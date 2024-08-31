import '/backend/backend.dart';
import '/components/edit_score/edit_score_widget.dart';
import '/components/nav_header/nav_header_widget.dart';
import '/components/nav_menu_left/nav_menu_left_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'add_score_board_model.dart';
export 'add_score_board_model.dart';

class AddScoreBoardWidget extends StatefulWidget {
  const AddScoreBoardWidget({
    super.key,
    required this.job,
  });

  final DocumentReference? job;

  @override
  State<AddScoreBoardWidget> createState() => _AddScoreBoardWidgetState();
}

class _AddScoreBoardWidgetState extends State<AddScoreBoardWidget> {
  late AddScoreBoardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddScoreBoardModel());

    _model.txtScoreTimeTextController ??= TextEditingController(
        text: _model.datePicked1 == null
            ? '--:-- --'
            : dateTimeFormat("HH:mm", _model.datePicked1));
    _model.txtScoreTimeFocusNode ??= FocusNode();

    _model.txtTargetReachedTextController ??= TextEditingController();
    _model.txtTargetReachedFocusNode ??= FocusNode();

    _model.txtCompletionTimeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.navMenuLeftModel,
                updateCallback: () => setState(() {}),
                child: const NavMenuLeftWidget(
                  index: 1,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 100.0,
                    height: double.infinity,
                    decoration: const BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.navHeaderModel,
                            updateCallback: () => setState(() {}),
                            child: const NavHeaderWidget(
                              title: 'Add Scoreboard',
                            ),
                          ),
                          FutureBuilder<JobsRecord>(
                            future: (_model.documentRequestCompleter ??=
                                    Completer<JobsRecord>()
                                      ..complete(JobsRecord.getDocumentOnce(
                                          widget.job!)))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitCircle(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }

                              final containerJobsRecord = snapshot.data!;

                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(15.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: const Color(0xFFECECEC),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Form(
                                              key: _model.formKey,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 200.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'Job',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        2.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 500.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFFEEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  containerJobsRecord
                                                                      .jobName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 1440.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 200.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Text(
                                                                'Score *',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          2.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    if (containerJobsRecord
                                                                        .scores
                                                                        .isNotEmpty)
                                                                      Container(
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final scores =
                                                                                containerJobsRecord.scores.toList();

                                                                            return FlutterFlowDataTable<ScoreStruct>(
                                                                              controller: _model.paginatedDataTableController,
                                                                              data: scores,
                                                                              columnsBuilder: (onSortChanged) => [
                                                                                DataColumn2(
                                                                                  label: DefaultTextStyle.merge(
                                                                                    softWrap: true,
                                                                                    child: Text(
                                                                                      'TIME',
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  fixedWidth: 100.0,
                                                                                ),
                                                                                DataColumn2(
                                                                                  label: DefaultTextStyle.merge(
                                                                                    softWrap: true,
                                                                                    child: Text(
                                                                                      'TARGET REACHED',
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                DataColumn2(
                                                                                  label: DefaultTextStyle.merge(
                                                                                    softWrap: true,
                                                                                    child: Text(
                                                                                      'PERFORMANCE',
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  fixedWidth: MediaQuery.sizeOf(context).width * 0.15,
                                                                                ),
                                                                                DataColumn2(
                                                                                  label: DefaultTextStyle.merge(
                                                                                    softWrap: true,
                                                                                    child: Text(
                                                                                      'ACTION',
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                              dataRowBuilder: (scoresItem, scoresIndex, selected, onSelectChanged) => DataRow(
                                                                                cells: [
                                                                                  Text(
                                                                                    dateTimeFormat("HH:mm", scoresItem.time!),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    scoresItem.targetReached.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    scoresItem.performance,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Builder(
                                                                                        builder: (context) => Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              await showDialog(
                                                                                                context: context,
                                                                                                builder: (dialogContext) {
                                                                                                  return Dialog(
                                                                                                    elevation: 0,
                                                                                                    insetPadding: EdgeInsets.zero,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                    child: GestureDetector(
                                                                                                      onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                      child: EditScoreWidget(
                                                                                                        score: containerJobsRecord.scores,
                                                                                                        jobRef: widget.job!,
                                                                                                        index: scoresIndex,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                            text: 'Edit',
                                                                                            options: FFButtonOptions(
                                                                                              width: 100.0,
                                                                                              height: 40.0,
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                              elevation: 0.0,
                                                                                              borderSide: const BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                            ),
                                                                                            showLoadingIndicator: false,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          await widget.job!.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'scores': FieldValue.arrayRemove([
                                                                                                  getScoreFirestoreData(
                                                                                                    updateScoreStruct(
                                                                                                      scoresItem,
                                                                                                      clearUnsetFields: false,
                                                                                                    ),
                                                                                                    true,
                                                                                                  )
                                                                                                ]),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                        },
                                                                                        text: 'Delete',
                                                                                        options: FFButtonOptions(
                                                                                          width: 100.0,
                                                                                          height: 40.0,
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: Colors.white,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderSide: const BorderSide(
                                                                                            color: Colors.transparent,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ].map((c) => DataCell(c)).toList(),
                                                                              ),
                                                                              paginated: false,
                                                                              selectable: false,
                                                                              width: MediaQuery.sizeOf(context).width * 0.5,
                                                                              height: (56 + 48 * containerJobsRecord.scores.length).toDouble(),
                                                                              minWidth: MediaQuery.sizeOf(context).width * 0.5,
                                                                              headingRowHeight: 56.0,
                                                                              dataRowHeight: 48.0,
                                                                              columnSpacing: 20.0,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              addHorizontalDivider: true,
                                                                              addTopAndBottomDivider: false,
                                                                              hideDefaultHorizontalDivider: true,
                                                                              horizontalDividerColor: const Color(0xFFDDDDDD),
                                                                              horizontalDividerThickness: 1.0,
                                                                              addVerticalDivider: false,
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    Wrap(
                                                                      spacing:
                                                                          0.0,
                                                                      runSpacing:
                                                                          20.0,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .center,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              250.0,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: TextFormField(
                                                                                    controller: _model.txtScoreTimeTextController,
                                                                                    focusNode: _model.txtScoreTimeFocusNode,
                                                                                    autofocus: false,
                                                                                    readOnly: true,
                                                                                    obscureText: false,
                                                                                    decoration: const InputDecoration(
                                                                                      enabledBorder: InputBorder.none,
                                                                                      focusedBorder: InputBorder.none,
                                                                                      errorBorder: InputBorder.none,
                                                                                      focusedErrorBorder: InputBorder.none,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    validator: _model.txtScoreTimeTextControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              FlutterFlowIconButton(
                                                                                borderColor: Colors.transparent,
                                                                                borderRadius: 30.0,
                                                                                borderWidth: 0.0,
                                                                                buttonSize: 40.0,
                                                                                icon: Icon(
                                                                                  Icons.access_time_outlined,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  final datePicked1Time = await showTimePicker(
                                                                                    context: context,
                                                                                    initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                                    builder: (context, child) {
                                                                                      return wrapInMaterialTimePickerTheme(
                                                                                        context,
                                                                                        child!,
                                                                                        headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                        headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                        headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              fontSize: 32.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                        pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                        selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                        selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                        actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                        iconSize: 24.0,
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  if (datePicked1Time != null) {
                                                                                    safeSetState(() {
                                                                                      _model.datePicked1 = DateTime(
                                                                                        getCurrentTimestamp.year,
                                                                                        getCurrentTimestamp.month,
                                                                                        getCurrentTimestamp.day,
                                                                                        datePicked1Time.hour,
                                                                                        datePicked1Time.minute,
                                                                                      );
                                                                                    });
                                                                                  }
                                                                                  setState(() {
                                                                                    _model.txtScoreTimeTextController?.text = dateTimeFormat("HH:mm", _model.datePicked1);
                                                                                    _model.txtScoreTimeTextController?.selection = TextSelection.collapsed(offset: _model.txtScoreTimeTextController!.text.length);
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              0.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                250.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.txtTargetReachedTextController,
                                                                              focusNode: _model.txtTargetReachedFocusNode,
                                                                              autofocus: false,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                hintText: 'Target Reached',
                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    letterSpacing: 0.0,
                                                                                    lineHeight: 1.0,
                                                                                  ),
                                                                              keyboardType: TextInputType.number,
                                                                              validator: _model.txtTargetReachedTextControllerValidator.asValidator(context),
                                                                              inputFormatters: [
                                                                                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.dropDownValueController ??=
                                                                              FormFieldController<String>(
                                                                            _model.dropDownValue ??=
                                                                                'Above Score Or Good',
                                                                          ),
                                                                          options: const [
                                                                            'Above Score Or Good',
                                                                            'On Score Or Slightly Under',
                                                                            'Average',
                                                                            'Bad',
                                                                            'Very Bad'
                                                                          ],
                                                                          onChanged: (val) =>
                                                                              setState(() => _model.dropDownValue = val),
                                                                          width:
                                                                              250.0,
                                                                          height:
                                                                              50.0,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              20.0,
                                                                          margin: const EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isOverButton:
                                                                              false,
                                                                          isSearchable:
                                                                              false,
                                                                          isMultiSelect:
                                                                              false,
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if ((_model.datePicked1 == null) || (_model.txtTargetReachedTextController.text == '')) {
                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Please fill out Score Time and Target Reached!',
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: Colors.white,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                    duration: const Duration(milliseconds: 3000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                );
                                                                                return;
                                                                              } else {
                                                                                _model.scoresList = containerJobsRecord.scores.toList().cast<ScoreStruct>();
                                                                                setState(() {});
                                                                                _model.addToScoresList(ScoreStruct(
                                                                                  time: _model.datePicked1,
                                                                                  performance: _model.dropDownValue,
                                                                                  targetReached: int.tryParse(_model.txtTargetReachedTextController.text),
                                                                                ));
                                                                                setState(() {});

                                                                                await widget.job!.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'scores': getScoreListFirestoreData(
                                                                                        _model.scoresList,
                                                                                      ),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                                setState(() => _model.documentRequestCompleter = null);
                                                                                await _model.waitForDocumentRequestCompleted();
                                                                                setState(() {
                                                                                  _model.txtTargetReachedTextController?.clear();
                                                                                });
                                                                                setState(() {
                                                                                  _model.txtScoreTimeTextController?.text = '--:-- --';
                                                                                  _model.txtScoreTimeTextController?.selection = TextSelection.collapsed(offset: _model.txtScoreTimeTextController!.text.length);
                                                                                });
                                                                                return;
                                                                              }
                                                                            },
                                                                            text:
                                                                                'Add',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 40.0,
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Colors.white,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderSide: const BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          20.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 200.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'Total Target per day *',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        2.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 250.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFFEEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '${valueOrDefault<String>(
                                                                    ((List<int>
                                                                            var1) {
                                                                      return var1
                                                                              .isNotEmpty
                                                                          ? var1.reduce((a, b) =>
                                                                              a +
                                                                              b)
                                                                          : 0;
                                                                    }(containerJobsRecord
                                                                            .scores
                                                                            .map((e) =>
                                                                                e.targetReached)
                                                                            .toList()))
                                                                        .toString(),
                                                                    '0',
                                                                  )}/${containerJobsRecord.targetPerDay.toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 200.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'Completion Time',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        2.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 500.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 250.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              TextFormField(
                                                                            controller: _model.txtCompletionTimeTextController ??=
                                                                                TextEditingController(
                                                                              text: valueOrDefault<String>(
                                                                                containerJobsRecord.completionTime != null ? dateTimeFormat("HH:mm", containerJobsRecord.completionTime) : (_model.datePicked2 == null ? '--:-- --' : dateTimeFormat("HH:mm", _model.datePicked2)),
                                                                                '--:-- --',
                                                                              ),
                                                                            ),
                                                                            focusNode:
                                                                                _model.txtCompletionTimeFocusNode,
                                                                            autofocus:
                                                                                false,
                                                                            readOnly:
                                                                                true,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                const InputDecoration(
                                                                              enabledBorder: InputBorder.none,
                                                                              focusedBorder: InputBorder.none,
                                                                              errorBorder: InputBorder.none,
                                                                              focusedErrorBorder: InputBorder.none,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            validator:
                                                                                _model.txtCompletionTimeTextControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            30.0,
                                                                        borderWidth:
                                                                            0.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .access_time_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          final datePicked2Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime((containerJobsRecord.completionTime ?? DateTime.now())),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (datePicked2Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked2 = DateTime(
                                                                                (containerJobsRecord.completionTime ?? DateTime.now()).year,
                                                                                (containerJobsRecord.completionTime ?? DateTime.now()).month,
                                                                                (containerJobsRecord.completionTime ?? DateTime.now()).day,
                                                                                datePicked2Time.hour,
                                                                                datePicked2Time.minute,
                                                                              );
                                                                            });
                                                                          }
                                                                          setState(
                                                                              () {
                                                                            _model.txtCompletionTimeTextController?.text =
                                                                                dateTimeFormat("HH:mm", _model.datePicked2);
                                                                            _model.txtCompletionTimeTextController?.selection =
                                                                                TextSelection.collapsed(offset: _model.txtCompletionTimeTextController!.text.length);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 200.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'Status',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        2.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 500.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Switch.adaptive(
                                                                  value: _model
                                                                          .switchValue ??=
                                                                      containerJobsRecord
                                                                          .completionStatus,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    setState(() =>
                                                                        _model.switchValue =
                                                                            newValue);
                                                                  },
                                                                  activeColor:
                                                                      const Color(
                                                                          0xFF5CB866),
                                                                  inactiveTrackColor:
                                                                      const Color(
                                                                          0xFFD9534F),
                                                                ),
                                                                Text(
                                                                  'Note : If Completed give \'Yes\', Otherwise \'NO\'',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFF7F7F7),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(20.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 15.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await widget.job!.update(
                                                          createJobsRecordData(
                                                        status: true,
                                                        completionTime:
                                                            _model.datePicked2,
                                                      ));
                                                    },
                                                    text: 'Save',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  text: 'Cancel',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: const Color(0xFFD2D5D8),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
