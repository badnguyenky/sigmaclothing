import '/backend/backend.dart';
import '/components/nav_header/nav_header_widget.dart';
import '/components/nav_menu_left/nav_menu_left_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'assign_job_widget.dart' show AssignJobWidget;
import 'package:flutter/material.dart';

class AssignJobModel extends FlutterFlowModel<AssignJobWidget> {
  ///  Local state fields for this page.

  bool isSorting = false;

  List<JobsRecord> sortedList = [];
  void addToSortedList(JobsRecord item) => sortedList.add(item);
  void removeFromSortedList(JobsRecord item) => sortedList.remove(item);
  void removeAtIndexFromSortedList(int index) => sortedList.removeAt(index);
  void insertAtIndexInSortedList(int index, JobsRecord item) =>
      sortedList.insert(index, item);
  void updateSortedListAtIndex(int index, Function(JobsRecord) updateFn) =>
      sortedList[index] = updateFn(sortedList[index]);

  bool isSearching = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in AssignJob widget.
  PopupRecord? popup;
  // Model for NavMenuLeft component.
  late NavMenuLeftModel navMenuLeftModel;
  // Model for NavHeader component.
  late NavHeaderModel navHeaderModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<JobsRecord> simpleSearchResults = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<JobsRecord>();

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
