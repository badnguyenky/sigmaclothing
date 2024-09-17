import '/backend/backend.dart';
import '/components/nav_header/nav_header_widget.dart';
import '/components/nav_menu_left/nav_menu_left_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cell_widget.dart' show CellWidget;
import 'package:flutter/material.dart';

class CellModel extends FlutterFlowModel<CellWidget> {
  ///  Local state fields for this page.

  bool isSorting = false;

  List<CellsRecord> sortedList = [];
  void addToSortedList(CellsRecord item) => sortedList.add(item);
  void removeFromSortedList(CellsRecord item) => sortedList.remove(item);
  void removeAtIndexFromSortedList(int index) => sortedList.removeAt(index);
  void insertAtIndexInSortedList(int index, CellsRecord item) =>
      sortedList.insert(index, item);
  void updateSortedListAtIndex(int index, Function(CellsRecord) updateFn) =>
      sortedList[index] = updateFn(sortedList[index]);

  bool isSearching = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Cell widget.
  PopupRecord? popup;
  // Model for NavMenuLeft component.
  late NavMenuLeftModel navMenuLeftModel;
  // Model for NavHeader component.
  late NavHeaderModel navHeaderModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<CellsRecord> simpleSearchResults = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<CellsRecord>();

  @override
  void initState(BuildContext context) {
    navMenuLeftModel = createModel(context, () => NavMenuLeftModel());
    navHeaderModel = createModel(context, () => NavHeaderModel());
  }

  @override
  void dispose() {
    navMenuLeftModel.dispose();
    navHeaderModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    paginatedDataTableController.dispose();
  }
}
