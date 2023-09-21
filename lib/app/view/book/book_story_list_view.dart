import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/edit_controller.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';

class BookStoryListView extends GetView<EditController> {
  const BookStoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      onWillpopSetting: const {
        'title': '취소',
        'content': '글 작성을 취소하시겠습니까?',
        'to': Routes.BOOK,
      },
      title: 'BookStoryListView',
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuillToolbar.basic(
              controller: controller.editController,
              fontSizeValues: const {
                'Small': '8',
                'Medium': '14',
                'Large': '20',
              },
              showAlignmentButtons: true,
              showBackgroundColorButton: false,
              showClearFormat: false,
              showHeaderStyle: false,
              showListNumbers: false,
              showListBullets: false,
              showLink: false,
              showListCheck: false,
              showSubscript: false,
              multiRowsDisplay: false,
              // locale: Get.locale,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: QuillEditor(
                  controller: controller.editController,
                  focusNode: FocusNode(),
                  scrollController: controller.editScrollController,
                  scrollable: true,
                  padding: const EdgeInsets.all(8.0),
                  autoFocus: false,
                  readOnly: false,
                  expands: true,
                  placeholder: '내용을 입력하세요',
                  customStyles: DefaultStyles(
                    h1: DefaultTextBlockStyle(
                        const TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          height: 1.15,
                          fontWeight: FontWeight.w300,
                        ),
                        const VerticalSpacing(16, 0),
                        const VerticalSpacing(0, 0),
                        null),
                    sizeSmall: const TextStyle(fontSize: 9),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      needBottomNavigationBar: false,
      needDrawer: false,
    );
  }
}

/**
 * bool showDividers = true,
  bool showFontFamily = true,
  bool showFontSize = true,
  bool showBoldButton = true,
  bool showItalicButton = true,
  bool showSmallButton = false,
  bool showUnderLineButton = true,
  bool showStrikeThrough = true,
  bool showInlineCode = true,
  bool showColorButton = true,
  bool showBackgroundColorButton = true,
  bool showClearFormat = true,
  bool showAlignmentButtons = false,
  bool showLeftAlignment = true,
  bool showCenterAlignment = true,
  bool showRightAlignment = true,
  bool showJustifyAlignment = true,
  bool showHeaderStyle = true,
  bool showListNumbers = true,
  bool showListBullets = true,
  bool showListCheck = true,
  bool showCodeBlock = true,
  bool showQuote = true,
  bool showIndent = true,
  bool showLink = true,
  bool showUndo = true,
  bool showRedo = true,
  bool showDirection = false,
  bool showSearchButton = true,
  bool showSubscript = true,
  bool showSuperscript = true,
  List<QuillCustomButton> customButtons = const [],
  Map<String, String>? fontSizeValues,
  Map<String, String>? fontFamilyValues,
  List<Widget Function(QuillController, double, QuillIconTheme?, QuillDialogTheme?)>? embedButtons,
  QuillIconTheme? iconTheme,
  QuillDialogTheme? dialogTheme,
  void Function()? afterButtonPressed,
  Map<ToolbarButtons, String>? tooltips,
  Locale? locale,
  Color? color,
  Color? sectionDividerColor,
  double? sectionDividerSpace,
  RegExp? linkRegExp,
  LinkDialogAction? linkDialogAction,
  Key? key,
 */