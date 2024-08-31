import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_header/nav_header_widget.dart';
import '/components/nav_menu_left/nav_menu_left_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_score_board_widget.dart' show AddScoreBoardWidget;
import 'package:flutter/material.dart';

class AddScoreBoardModel extends FlutterFlowModel<AddScoreBoardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for NavMenuLeft component.
  late NavMenuLeftModel navMenuLeftModel;
  // Model for NavHeader component.
  late NavHeaderModel navHeaderModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ScoreStruct>();
  // State field(s) for txtScoreTime widget.
  FocusNode? txtScoreTimeFocusNode;
  TextEditingController? txtScoreTimeTextController;
  String? Function(BuildContext, String?)? txtScoreTimeTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for txtTargetReached widget.
  FocusNode? txtTargetReachedFocusNode;
  TextEditingController? txtTargetReachedTextController;
  String? Function(BuildContext, String?)?
      txtTargetReachedTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for txtCompletionTime widget.
  FocusNode? txtCompletionTimeFocusNode;
  TextEditingController? txtCompletionTimeTextController;
  String? Function(BuildContext, String?)?
      txtCompletionTimeTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {
    navMenuLeftModel = createModel(context, () => NavMenuLeftModel());
    navHeaderModel = createModel(context, () => NavHeaderModel());
  }

  @override
  void dispose() {
    navMenuLeftModel.dispose();
    navHeaderModel.dispose();
    paginatedDataTableController.dispose();
    txtScoreTimeFocusNode?.dispose();
    txtScoreTimeTextController?.dispose();

    txtTargetReachedFocusNode?.dispose();
    txtTargetReachedTextController?.dispose();

    txtCompletionTimeFocusNode?.dispose();
    txtCompletionTimeTextController?.dispose();
  }
}
