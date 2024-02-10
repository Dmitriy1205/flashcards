import 'package:flashcards/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillText extends StatelessWidget {
  final List<Map<String,dynamic>> content;
  final TextStyle? style;
  QuillText({Key? key, required this.content, this.style}) : super(key: key);

  late final QuillController _controller = QuillController(document: Document.fromJson(content), selection: const TextSelection(baseOffset: 0, extentOffset: 0));

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: QuillEditor.basic(configurations: QuillEditorConfigurations(
        controller: _controller,
        customStyles: style == null ? null : DefaultStyles(
          bold: style,
          paragraph: DefaultListBlockStyle(
            DefaultStyles.getInstance(context).paragraph!.style.merge(style), VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          align: DefaultListBlockStyle(
              style!, VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          lists: DefaultListBlockStyle(
            style!, VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          leading: DefaultListBlockStyle(
              style!, VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          h1: DefaultListBlockStyle(
              style!, VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          h2: DefaultListBlockStyle(
              style!, VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          h3: DefaultListBlockStyle(
              style!, VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          h4: DefaultListBlockStyle(
              style!, VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          h5: DefaultListBlockStyle(
              style!, VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
          h6: DefaultListBlockStyle(
              style!, VerticalSpacing(0,0), VerticalSpacing(0,0), null, null
          ),
        ),
        showCursor: false,
        readOnly: true
      )),
    );
  }
}
