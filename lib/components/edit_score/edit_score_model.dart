import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_score_widget.dart' show EditScoreWidget;
import 'package:flutter/material.dart';

class EditScoreModel extends FlutterFlowModel<EditScoreWidget> {
  ///  Local state fields for this component.

  List<ScoreStruct> scoreList = [];
  void addToScoreList(ScoreStruct item) => scoreList.add(item);
  void removeFromScoreList(ScoreStruct item) => scoreList.remove(item);
  void removeAtIndexFromScoreList(int index) => scoreList.removeAt(index);
  void insertAtIndexInScoreList(int index, ScoreStruct item) =>
      scoreList.insert(index, item);
  void updateScoreListAtIndex(int index, Function(ScoreStruct) updateFn) =>
      scoreList[index] = updateFn(scoreList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtScoreTime widget.
  FocusNode? txtScoreTimeFocusNode;
  TextEditingController? txtScoreTimeTextController;
  String? Function(BuildContext, String?)? txtScoreTimeTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for txtTargetReached widget.
  FocusNode? txtTargetReachedFocusNode;
  TextEditingController? txtTargetReachedTextController;
  String? Function(BuildContext, String?)?
      txtTargetReachedTextControllerValidator;
  String? _txtTargetReachedTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    txtTargetReachedTextControllerValidator =
        _txtTargetReachedTextControllerValidator;
  }

  @override
  void dispose() {
    txtScoreTimeFocusNode?.dispose();
    txtScoreTimeTextController?.dispose();

    txtTargetReachedFocusNode?.dispose();
    txtTargetReachedTextController?.dispose();
  }
}
