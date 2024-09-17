import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_menu_left/nav_menu_left_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'score_view_widget.dart' show ScoreViewWidget;
import 'package:flutter/material.dart';

class ScoreViewModel extends FlutterFlowModel<ScoreViewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavMenuLeft component.
  late NavMenuLeftModel navMenuLeftModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<ScoreStruct>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<ScoreStruct>();

  @override
  void initState(BuildContext context) {
    navMenuLeftModel = createModel(context, () => NavMenuLeftModel());
  }

  @override
  void dispose() {
    navMenuLeftModel.dispose();
    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
  }
}
