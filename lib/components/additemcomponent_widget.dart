import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'additemcomponent_model.dart';
export 'additemcomponent_model.dart';

class AdditemcomponentWidget extends StatefulWidget {
  const AdditemcomponentWidget({super.key});

  @override
  State<AdditemcomponentWidget> createState() => _AdditemcomponentWidgetState();
}

class _AdditemcomponentWidgetState extends State<AdditemcomponentWidget> {
  late AdditemcomponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdditemcomponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(1.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://picsum.photos/seed/381/600',
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 45.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '29kosaec' /* 商品名 */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Helvetica',
                            color: FlutterFlowTheme.of(context).subBlack,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).subBlack4,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'uaq8o02j' /* 公開 */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Helvetica',
                              color: FlutterFlowTheme.of(context).subBlack2,
                              fontSize: 14.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '0o4svw0z' /* ¥ */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Helvetica',
                                color: FlutterFlowTheme.of(context).subBlack,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ayx789qw' /* 100 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Helvetica',
                                color: FlutterFlowTheme.of(context).subBlack,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 160.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).subWhite,
                  width: 2.0,
                ),
              ),
              child: FlutterFlowCountController(
                decrementIconBuilder: (enabled) => Icon(
                  Icons.remove_circle_outline,
                  color: enabled
                      ? FlutterFlowTheme.of(context).subBlack2
                      : FlutterFlowTheme.of(context).subBlack3,
                  size: 35.0,
                ),
                incrementIconBuilder: (enabled) => Icon(
                  Icons.add_circle,
                  color: enabled
                      ? FlutterFlowTheme.of(context).mainColor2
                      : FlutterFlowTheme.of(context).subBlack3,
                  size: 35.0,
                ),
                countBuilder: (count) => Text(
                  count.toString(),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Helvetica',
                        color: FlutterFlowTheme.of(context).subBlack,
                        useGoogleFonts: false,
                      ),
                ),
                count: _model.countControllerValue ??= 0,
                updateCount: (count) =>
                    setState(() => _model.countControllerValue = count),
                stepSize: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
