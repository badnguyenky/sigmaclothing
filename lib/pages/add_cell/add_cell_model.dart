import '/backend/backend.dart';
import '/components/nav_header/nav_header_widget.dart';
import '/components/nav_menu_left/nav_menu_left_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_cell_widget.dart' show AddCellWidget;
import 'package:flutter/material.dart';

class AddCellModel extends FlutterFlowModel<AddCellWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NavMenuLeft component.
  late NavMenuLeftModel navMenuLeftModel;
  // Model for NavHeader component.
  late NavHeaderModel navHeaderModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  Color? colorPicked;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CellsRecord? latestCell;

  @override
  void initState(BuildContext context) {
    navMenuLeftModel = createModel(context, () => NavMenuLeftModel());
    navHeaderModel = createModel(context, () => NavHeaderModel());
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    navMenuLeftModel.dispose();
    navHeaderModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
