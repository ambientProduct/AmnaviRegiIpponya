import UIKit
import Flutter
import StarIO10

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private var methodChannel: FlutterMethodChannel?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        // MethodChannelの設定
        methodChannel = FlutterMethodChannel(name: "ipponya.kit.printer", binaryMessenger: controller.binaryMessenger)
        
        // MethodChannelのハンドラを設定
        methodChannel?.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            guard let self = self else {
                result(FlutterError(code: "METHOD_CHANNEL_ERROR", message: "Self is nil", details: nil))
                return
            }
            
            if call.method == "sendPrintData" {
                print("sendPrintData method called") // ログを追加
                if let arguments = call.arguments as? [String: Any],
                   let name = arguments["name"] as? String,
                   let tableNo = arguments["tableNo"] as? String,
                   let quantity = arguments["quantity"] as? Int {
                    
                    print("Printing data: Name: \(name), Table No: \(tableNo), Quantity: \(quantity)") // ログを追加
                    
                    // データを使用して印刷処理を実行
                   self.printFunction(result: result, name: name, tableNo: tableNo, quantity: quantity)
                } else {
                    result(FlutterError(code: "METHOD_CHANNEL_ERROR", message: "Invalid arguments", details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    // 印刷処理を行う関数
    func printFunction(result: @escaping FlutterResult, name: String, tableNo: String, quantity: Int ) {
        let starConnectionSettings = StarConnectionSettings(interfaceType: .bluetooth, identifier: "2582322050600142")
        let printer = StarPrinter(starConnectionSettings)
        let builder = StarXpandCommand.StarXpandCommandBuilder()
        print(tableNo)
        let command = builder.addDocument(StarXpandCommand.DocumentBuilder()
                    .addPrinter(
                        StarXpandCommand.PrinterBuilder()
                            .styleBold(true)
                            .styleInternationalCharacter(.japan)
                            .actionPrintText("Item:  \(name)\n")
                            .add(
                                StarXpandCommand.PrinterBuilder()
                                    .styleMagnification(StarXpandCommand.MagnificationParameter(width: 1, height: 2))
                                    .actionPrintText("* \(tableNo) *\n")
                            )
                            .actionPrintText(
                                "アンビエントナビ\n" +
                                "モバイルオーダー\n" +
                                "\n" +
                                "Time:   2/3 17:00\n" +
                                " 初稼働\n" +
                                "\n" +
                                "--------------------------------\n"
                            )
                            .add(
                                StarXpandCommand.PrinterBuilder()
                                    .styleBold(true)
                                    .actionPrintText(">MOBILE<\n")
                            )
                            .actionPrintText("--------------------------------\n")
                            .actionCut(.partial)
                    )
                ).getCommands()
        
        Task {
            do {
                

                print("プリンタ接続直前！")
                try await printer.open()
                print("プリンタ接続成功！")
                
                defer {
                    Task {
                        await printer.close()
                    }
                }
                
                // 印刷コマンドを送信
                try await printer.print(command: command)
                
                // 成功を通知
                print("Success")
                result("Success")
            } catch let error {
                // エラーを通知
                print("Error: \(error)")
                result(FlutterError(code: "PRINT_ERROR", message: "Failed to print", details: nil))
            }
        }
    }
}
