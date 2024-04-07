import 'dart:developer' as dev;

import 'package:flashcards/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';

class QuillText extends StatelessWidget {
  final List<Map<String,dynamic>> content;
  final TextStyle? style;
  final bool center;

  late final QuillController _controller;

  QuillText({Key? key, required this.content, this.style, this.center = false}) : super(key: key){
    final document = Document.fromJson(content);
    if(center){
      document.format(0, document.length, Attribute.centerAlignment);
    }
    List<Operation> operations = [];
    document.toDelta().operations.forEach((e) {
      final attributes = {...?e.attributes};
      if(e.hasAttribute("list") && e.hasAttribute("align")){
        attributes["align"] = Attribute.leftAlignment.key;
      }
      final newOperation = Operation(e.key, e.length, e.data, attributes);
      operations.add(newOperation);
    });
    final newDoc = Document.fromDelta(Delta.fromOperations(operations));
    _controller = QuillController(document: newDoc, selection: const TextSelection(baseOffset: 0, extentOffset: 0));
  }


  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: QuillEditor.basic(configurations: QuillEditorConfigurations(
        controller: _controller,
        customStyles: style == null ? null : DefaultStyles(
          bold: DefaultStyles.getInstance(context).bold!.merge(style),
          paragraph: DefaultListBlockStyle(
            DefaultStyles.getInstance(context).paragraph!.style.merge(style), VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          align: DefaultListBlockStyle(
              DefaultStyles.getInstance(context).align!.style.merge(style), VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          lists: DefaultListBlockStyle(
              DefaultStyles.getInstance(context).lists!.style.merge(style), VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          leading: DefaultListBlockStyle(
              DefaultStyles.getInstance(context).leading!.style.merge(style), VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          h1: DefaultListBlockStyle(
              DefaultStyles.getInstance(context).h1!.style.merge(style), VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          h2: DefaultListBlockStyle(
              DefaultStyles.getInstance(context).h2!.style.merge(style), VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          h3: DefaultListBlockStyle(
              DefaultStyles.getInstance(context).h3!.style.merge(style), VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          h4: DefaultListBlockStyle(
              DefaultStyles.getInstance(context).h4!.style.merge(style), VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          h5: DefaultListBlockStyle(
              DefaultStyles.getInstance(context).h5!.style.merge(style), VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          h6: DefaultListBlockStyle(
              DefaultStyles.getInstance(context).h6!.style.merge(style), VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
        ),
        showCursor: false,
        readOnly: true
      )),
    );
  }
}
