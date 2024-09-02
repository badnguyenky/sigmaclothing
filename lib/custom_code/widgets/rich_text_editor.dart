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

import 'package:quill_html_editor/quill_html_editor.dart';

class RichTextEditor extends StatefulWidget {
  const RichTextEditor({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<RichTextEditor> createState() => _RichTextEditorState();
}

class _RichTextEditorState extends State<RichTextEditor> {
  final customToolBarList = [
    ToolBarStyle.bold,
    ToolBarStyle.italic,
    ToolBarStyle.align,
    ToolBarStyle.color,
    ToolBarStyle.background,
    ToolBarStyle.listBullet,
    ToolBarStyle.listOrdered,
    ToolBarStyle.clean,
    ToolBarStyle.addTable,
    ToolBarStyle.editTable,
  ];

  final _toolbarColor = Colors.grey.shade200;
  final _backgroundColor = Colors.white70;
  final _toolbarIconColor = Colors.black87;
  final _editorTextStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontFamily: 'Poppins');
  final _hintTextStyle = const TextStyle(
      fontSize: 18, color: Colors.black38, fontWeight: FontWeight.normal);

  bool _hasFocus = false;
  final QuillEditorController controller = QuillEditorController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToolBar(
          toolBarColor: _toolbarColor,
          padding: const EdgeInsets.all(8),
          iconSize: 25,
          iconColor: _toolbarIconColor,
          activeIconColor: Colors.greenAccent.shade400,
          controller: controller,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          customButtons: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: _hasFocus ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(15)),
            ),
            InkWell(
                onTap: () => unFocusEditor(),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.black,
                )),
            InkWell(
                onTap: () async {
                  var selectedText = await controller.getSelectedText();
                  debugPrint('selectedText $selectedText');
                  var selectedHtmlText = await controller.getSelectedHtmlText();
                  debugPrint('selectedHtmlText $selectedHtmlText');
                },
                child: const Icon(
                  Icons.add_circle,
                  color: Colors.black,
                )),
          ],
        ),
        Expanded(
          child: QuillHtmlEditor(
            text: "<h1>Hello</h1>This is a quill html editor example 😊",
            hintText: 'Hint text goes here',
            controller: controller,
            isEnabled: true,
            ensureVisible: false,
            minHeight: 500,
            autoFocus: false,
            textStyle: _editorTextStyle,
            hintTextStyle: _hintTextStyle,
            hintTextAlign: TextAlign.start,
            padding: const EdgeInsets.only(left: 10, top: 10),
            hintTextPadding: const EdgeInsets.only(left: 20),
            backgroundColor: _backgroundColor,
            inputAction: InputAction.newline,
            onEditingComplete: (s) => debugPrint('Editing completed $s'),
            // loadingBuilder: (context) {
            //   return const Center(
            //       child: CircularProgressIndicator(
            //     strokeWidth: 1,
            //     color: Colors.red,
            //   ));
            // },
            onFocusChanged: (focus) {
              debugPrint('has focus $focus');
              setState(() {
                _hasFocus = focus;
              });
            },
            onTextChanged: (text) => debugPrint('widget text change $text'),
            onEditorCreated: () {
              debugPrint('Editor has been loaded');
              setHtmlText('Testing text on load');
            },
            onEditorResized: (height) => debugPrint('Editor resized $height'),
            onSelectionChanged: (sel) =>
                debugPrint('index ${sel.index}, range ${sel.length}'),
          ),
        ),
      ],
    );
  }

  void setHtmlText(String text) async {
    await controller.setText(text);
  }

  void unFocusEditor() => controller.unFocus();
}
