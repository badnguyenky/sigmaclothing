import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'nav_menu_left_model.dart';
export 'nav_menu_left_model.dart';

class NavMenuLeftWidget extends StatefulWidget {
  const NavMenuLeftWidget({
    super.key,
    int? index,
  }) : index = index ?? 0;

  final int index;

  @override
  State<NavMenuLeftWidget> createState() => _NavMenuLeftWidgetState();
}

class _NavMenuLeftWidgetState extends State<NavMenuLeftWidget> {
  late NavMenuLeftModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavMenuLeftModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
      width: FFAppState().isNavBarCollapsed == false ? 270.0 : 80.0,
      height: double.infinity,
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            color: FlutterFlowTheme.of(context).alternate,
            offset: const Offset(
              1,
              0,
            ),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (FFAppState().isNavBarCollapsed == false)
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.asset(
                              'assets/images/sigma-logo.png',
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      FFAppState().isNavBarCollapsed =
                          !(FFAppState().isNavBarCollapsed ?? true);
                      safeSetState(() {});
                    },
                    child: Icon(
                      Icons.menu_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.click ?? MouseCursor.defer,
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = false);
              }),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('Dashboard');
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.mouseRegionHovered1
                          ? valueOrDefault<Color>(
                              widget.index == 0
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).hoverColor,
                              FlutterFlowTheme.of(context).primary,
                            )
                          : valueOrDefault<Color>(
                              widget.index == 0
                                  ? FlutterFlowTheme.of(context).primary
                                  : const Color(0x00000000),
                              FlutterFlowTheme.of(context).primary,
                            ),
                      FlutterFlowTheme.of(context).primary,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: valueOrDefault<Color>(
                            widget.index == 0
                                ? Colors.white
                                : FlutterFlowTheme.of(context).secondaryText,
                            Colors.white,
                          ),
                          size: 28,
                        ),
                        if (FFAppState().isNavBarCollapsed == false)
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Dashboard',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: valueOrDefault<Color>(
                                      widget.index == 0
                                          ? Colors.white
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      Colors.white,
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.click ?? MouseCursor.defer,
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered2 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered2 = false);
              }),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('ScoreBoard');
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.mouseRegionHovered2
                          ? valueOrDefault<Color>(
                              widget.index == 1
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).hoverColor,
                              FlutterFlowTheme.of(context).secondaryBackground,
                            )
                          : valueOrDefault<Color>(
                              widget.index == 1
                                  ? FlutterFlowTheme.of(context).primary
                                  : const Color(0x00000000),
                              FlutterFlowTheme.of(context).primary,
                            ),
                      FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.database,
                          color: valueOrDefault<Color>(
                            widget.index == 1
                                ? Colors.white
                                : FlutterFlowTheme.of(context).secondaryText,
                            FlutterFlowTheme.of(context).secondaryText,
                          ),
                          size: 28,
                        ),
                        if (FFAppState().isNavBarCollapsed == false)
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Scoreboard',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: valueOrDefault<Color>(
                                      widget.index == 1
                                          ? Colors.white
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.click ?? MouseCursor.defer,
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered3 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered3 = false);
              }),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('Cell');
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.mouseRegionHovered3
                          ? valueOrDefault<Color>(
                              widget.index == 2
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).hoverColor,
                              FlutterFlowTheme.of(context).secondaryBackground,
                            )
                          : valueOrDefault<Color>(
                              widget.index == 2
                                  ? FlutterFlowTheme.of(context).primary
                                  : const Color(0x00000000),
                              FlutterFlowTheme.of(context).primary,
                            ),
                      FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.groups,
                          color: valueOrDefault<Color>(
                            widget.index == 2
                                ? Colors.white
                                : FlutterFlowTheme.of(context).secondaryText,
                            FlutterFlowTheme.of(context).secondaryText,
                          ),
                          size: 28,
                        ),
                        if (FFAppState().isNavBarCollapsed == false)
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Cell',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: valueOrDefault<Color>(
                                      widget.index == 2
                                          ? Colors.white
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.click ?? MouseCursor.defer,
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered4 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered4 = false);
              }),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('AssignJob');
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.mouseRegionHovered4
                          ? valueOrDefault<Color>(
                              widget.index == 3
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).hoverColor,
                              FlutterFlowTheme.of(context).secondaryBackground,
                            )
                          : valueOrDefault<Color>(
                              widget.index == 3
                                  ? FlutterFlowTheme.of(context).primary
                                  : const Color(0x00000000),
                              FlutterFlowTheme.of(context).primary,
                            ),
                      FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.rocket_launch,
                          color: valueOrDefault<Color>(
                            widget.index == 3
                                ? Colors.white
                                : FlutterFlowTheme.of(context).secondaryText,
                            FlutterFlowTheme.of(context).secondaryText,
                          ),
                          size: 28,
                        ),
                        if (FFAppState().isNavBarCollapsed == false)
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Assign Job',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: valueOrDefault<Color>(
                                      widget.index == 3
                                          ? Colors.white
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.click ?? MouseCursor.defer,
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered5 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered5 = false);
              }),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('PopupSettings');
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.mouseRegionHovered5
                          ? valueOrDefault<Color>(
                              widget.index == 4
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).hoverColor,
                              FlutterFlowTheme.of(context).secondaryBackground,
                            )
                          : valueOrDefault<Color>(
                              widget.index == 4
                                  ? FlutterFlowTheme.of(context).primary
                                  : const Color(0x00000000),
                              FlutterFlowTheme.of(context).primary,
                            ),
                      FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.anchor,
                          color: valueOrDefault<Color>(
                            widget.index == 4
                                ? Colors.white
                                : FlutterFlowTheme.of(context).secondaryText,
                            FlutterFlowTheme.of(context).secondaryText,
                          ),
                          size: 28,
                        ),
                        if (FFAppState().isNavBarCollapsed == false)
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Popup Settings',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: valueOrDefault<Color>(
                                      widget.index == 4
                                          ? Colors.white
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (FFAppState().isNavBarCollapsed == false)
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(1, 0),
                                      child: Text(
                                        'SIGMA Sentinel',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(1, 0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          'Powered by Connectiv',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ].divide(const SizedBox(height: 12)),
        ),
      ),
    );
  }
}
