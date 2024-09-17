// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_delta_from_html/flutter_quill_delta_from_html.dart';
import 'package:delta_to_html/delta_to_html.dart';

class HTMLEditor extends StatefulWidget {
  const HTMLEditor({
    super.key,
    this.width,
    this.height,
    this.currentHTML,
    required this.backgroundColor,
  });

  final double? width;
  final double? height;
  final String? currentHTML;
  final Color backgroundColor;

  @override
  State<HTMLEditor> createState() => _HTMLEditorState();
}

class _HTMLEditorState extends State<HTMLEditor> {
  QuillController _controller = QuillController.basic();
  Timer? _debounce;

  @override
  void initState() {
    var delta = HtmlToDelta().convert(
        widget.currentHTML == null || widget.currentHTML!.isEmpty
            ? ""
            : widget.currentHTML!);
    _controller = QuillController(
      document: Document.fromDelta(delta), // "\n" is mandatory
      selection: TextSelection.collapsed(offset: 0),
    );
    _controller.formatTextStyle(
        0, 0, Style.fromJson({'color': '#ffffff', 'size': 24.0}));
    _controller.addListener(_onTextChanged);
    super.initState();
  }

  void _onTextChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _convertDeltaToHtml();
    });
  }

  void _convertDeltaToHtml() {
    List delta = _controller.document.toDelta().toJson();
    FFAppState().update(() {
      FFAppState().textFromHtmlEditor = DeltaToHTML.encodeJson(delta);
    });
  }

  @override
  void dispose() {
    /// please do not forget to dispose the controller
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuillSimpleToolbar(
            controller: _controller,
            configurations: const QuillSimpleToolbarConfigurations(),
          ),
          Expanded(
              child: Container(
            color: widget.backgroundColor,
            child: QuillEditor.basic(
              controller: _controller,
              configurations: const QuillEditorConfigurations(
                customStyles: DefaultStyles(
                  paragraph: DefaultTextBlockStyle(
                      TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                      HorizontalSpacing(1, 0),
                      VerticalSpacing(0, 0),
                      VerticalSpacing(0, 0),
                      null),
                ),
                autoFocus: true,
                showCursor: true,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
