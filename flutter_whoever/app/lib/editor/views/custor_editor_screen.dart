import 'package:app/common/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class CustomEditorScreen extends StatefulWidget {
  const CustomEditorScreen({super.key});

  @override
  State<CustomEditorScreen> createState() => _CustomEditorScreenState();
}

class _CustomEditorScreenState extends State<CustomEditorScreen> {
  late quill.QuillController _controller;

  @override
  void initState() {
    super.initState();
    _controller = quill.QuillController.basic();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null)
      return MainLayout(body: CircularProgressIndicator());

    return CustomScrollView(
      slivers: [
        _toolBar(),
        _body(),
      ],
    );
  }

  SliverToBoxAdapter _toolBar() {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: quill.QuillToolbar.basic(
          controller: _controller,
        ),
      ),
    );
  }

  SliverToBoxAdapter _body() {
    return SliverToBoxAdapter(
      child: quill.QuillEditor(
        controller: _controller,
        scrollController: ScrollController(),
        scrollable: true,
        focusNode: FocusNode(),
        padding: EdgeInsets.all(4),
        readOnly: false,
        autoFocus: false,
        expands: false,
        placeholder: '본문을 입력해 주세요',
      ),
    );
  }
}
