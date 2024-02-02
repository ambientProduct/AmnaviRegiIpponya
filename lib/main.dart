import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  
  // Firebaseの初期化
  await initFirebase();

  // MethodChannelの初期化
  final methodChannel = MethodChannel('ipponya.kit.printer');

  final appState = FFAppState();
  await appState.initializePersistedState();

  runApp(
    ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(methodChannel: methodChannel),
    )
  );
}

class MyApp extends StatefulWidget {
  final MethodChannel methodChannel;

  const MyApp({Key? key, required this.methodChannel}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);

   FirebaseFirestore.instance
    .collection('ItemDetail')
    .where('State', isEqualTo: 'Order')
    .snapshots()
    .listen((QuerySnapshot snapshot) {
  snapshot.docChanges.forEach((change) {
    if (change.type == DocumentChangeType.added) {
      final document = change.doc;
      final name = document.get('name');
      final tableNo = document.get('tableNo');
      final quantity = document.get('quantity');

      _sendDataToSwift(name, tableNo, quantity);
    }
  });
});

  }

  void _sendDataToSwift(String name, String tableNo, int quantity) {
    try {
      widget.methodChannel.invokeMethod('sendPrintData', {
        'name': name,
        'tableNo': tableNo,
        'quantity': quantity,
      });
    } on PlatformException catch (e) {
      print("Failed to send data to Swift: '${e.message}'.");
    }
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'IpponyaRegi',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('ja'),
        Locale('en'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}
