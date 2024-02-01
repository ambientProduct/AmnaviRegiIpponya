import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_settings_model.dart';
export 'payment_settings_model.dart';

class PaymentSettingsWidget extends StatefulWidget {
  const PaymentSettingsWidget({super.key});

  @override
  State<PaymentSettingsWidget> createState() => _PaymentSettingsWidgetState();
}

class _PaymentSettingsWidgetState extends State<PaymentSettingsWidget> {
  late PaymentSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentSettingsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 40.0,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 100.0,
                    height: 970.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      border: Border.all(
                        color: Color(0xFF959BA0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 80.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('HomePage');
                            },
                            child: Icon(
                              Icons.home_outlined,
                              color: FlutterFlowTheme.of(context).subBlack2,
                              size: 40.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: Icon(
                            Icons.credit_card_sharp,
                            color: Color(0xFF989898),
                            size: 40.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('menumanagement');
                            },
                            child: Icon(
                              Icons.restaurant_menu,
                              color: Color(0xFF989898),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('qrcode');
                            },
                            child: Icon(
                              Icons.qr_code,
                              color: Color(0xFF989898),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('CloudService');
                            },
                            child: Icon(
                              Icons.cloud_sync_outlined,
                              color: Color(0xFF989898),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: Icon(
                            Icons.mail_outline,
                            color: Color(0xFF989898),
                            size: 40.0,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 360.0, 0.0, 0.0),
                            child: Container(
                              width: 90.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(15.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(15.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('HomePage');
                                  },
                                  child: Icon(
                                    Icons.settings_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Container(
                      width: 1165.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '6gbsv6la' /* オン状態の支払い方法は客様のスマホに表示されますので、必ず対... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Helvetica',
                                  color: FlutterFlowTheme.of(context).subBlack2,
                                  fontSize: 16.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: 1265.0,
                        height: 750.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '4iad8eke' /* 決済方法設定 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Helvetica',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .subBlack,
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          60.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '65m52kic' /* 現金 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Helvetica',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .subBlack,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 60.0, 0.0),
                                      child: Switch.adaptive(
                                        value: _model.switchValue1 ??= true,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue1 = newValue!);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .mainColor3,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 3.0,
                                color: FlutterFlowTheme.of(context).subBlack3,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          60.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'data:image/png;base64,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',
                                          width: 120.0,
                                          height: 50.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 60.0, 0.0),
                                      child: Switch.adaptive(
                                        value: _model.switchValue2 ??= true,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue2 = newValue!);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .mainColor3,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).subBlack3,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          60.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'data:image/png;base64,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',
                                          width: 120.0,
                                          height: 50.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 60.0, 0.0),
                                      child: Switch.adaptive(
                                        value: _model.switchValue3 ??= true,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue3 = newValue!);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .mainColor3,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).subBlack3,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          60.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'data:image/png;base64,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',
                                          width: 120.0,
                                          height: 50.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 60.0, 0.0),
                                      child: Switch.adaptive(
                                        value: _model.switchValue4 ??= true,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue4 = newValue!);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .mainColor3,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).subBlack3,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          60.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '43ocz8c7' /* Squareリーダー/スタンド */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Helvetica',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .subBlack,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 60.0, 0.0),
                                      child: Switch.adaptive(
                                        value: _model.switchValue5 ??= true,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue5 = newValue!);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .mainColor3,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).subBlack3,
                              ),
                              Container(
                                width: 232.0,
                                height: 57.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).subBlack3,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'xk5byoxw' /* ＋登録する */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Helvetica',
                                          color: FlutterFlowTheme.of(context)
                                              .mainColor2,
                                          fontSize: 20.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Stack(
                      children: [
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            'tum6hz88' /* 保存する */,
                          ),
                          options: FFButtonOptions(
                            width: 1275.0,
                            height: 80.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).mainColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Helvetica',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  useGoogleFonts: false,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
