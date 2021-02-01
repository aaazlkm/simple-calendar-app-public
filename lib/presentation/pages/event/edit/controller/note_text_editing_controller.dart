import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NoteTextEditingController {
  NoteTextEditingController()
      : _textEditingController = TextEditingController(),
        _focusNode = FocusNode();

  static NoteTextEditingController of(BuildContext context) => context.read<NoteTextEditingController>();

  final TextEditingController _textEditingController;

  final FocusNode _focusNode;

  TextEditingController get textEditingController => _textEditingController;

  String get text => _textEditingController.text;

  set text(String text) => _textEditingController.text = text;

  FocusNode get focusNode => _focusNode;

  bool get hasFocus => _focusNode.hasFocus;

  void dispose() {
    _textEditingController.clear();
    _focusNode.dispose();
  }

  void requestFocus() {
    _focusNode.requestFocus();
    if (!hasFocus) {
      _textEditingController.selection = TextSelection.collapsed(offset: text.length);
    }
  }
}
