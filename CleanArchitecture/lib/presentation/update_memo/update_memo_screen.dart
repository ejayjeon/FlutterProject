import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/presentation/update_memo/add_edit_memo_event.dart';
import 'package:jemmemo/presentation/update_memo/update_memo_view_model.dart';
import 'package:jemmemo/ui/colors.dart';
import 'package:provider/provider.dart';

class UpdateMemoScreen extends StatefulWidget {
  final Memo? memo;
  const UpdateMemoScreen({Key? key, this.memo}) : super(key: key);

  @override
  State<UpdateMemoScreen> createState() => _UpdateMemoScreenState();
}

class _UpdateMemoScreenState extends State<UpdateMemoScreen> {
  // 텍스트는 컨트롤러를 사용해줘야함
  final _titleCtrl = TextEditingController();
  final _contentCtrl = TextEditingController();
  StreamSubscription? _streamSubscription;
  // color를 list로 가지고 있고 -> Row로 정렬
  final List<Color> memoColors = [
    illusion,
    roseBud,
    primRose,
    appleGreen,
    skyBlue,
    wisteria,
    veryPery,
    bgGrey,
  ];
  @override
  void initState() {
    super.initState();
    // 업데이트 화면
    if (widget.memo != null) {
      _titleCtrl.text = widget.memo!.title;
      _contentCtrl.text = widget.memo!.content;
    }

    Future.microtask(() {
      final viewModel = context.read<UpdateMemoViewModel>();
      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(saveMemo: () {
          Navigator.pop(context, true);
          // 새로고침
        }, showSnackBar: (String message) {
          final snackBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _titleCtrl.dispose();
    _contentCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 변하는 것을 관찰하기 위해
    final viewModel = context.watch<UpdateMemoViewModel>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // if (_titleCtrl.text.isEmpty || _contentCtrl.text.isEmpty) {
          //   const snackBar = SnackBar(content: Text('내용이 비어 있습니다'));
          //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //   return;
          // }
          viewModel.onEvent(AddEditMemoEvent.saveMemo(
              widget.memo == null ? null : widget.memo!.id,
              _titleCtrl.text,
              _contentCtrl.text));
        },
        child: Icon(Icons.edit),
      ),
      body: AnimatedContainer(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 48),
        color: Color(viewModel.color),
        duration: Duration(milliseconds: 500),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: memoColors
                  .map(
                    (color) => InkWell(
                      onTap: () {
                        // 클릭을 하면 색깔을 바꿈

                        // setState(() {
                        //   viewModel.onEvent(
                        //       AddEditMemoEvent.changeColor(color.value));
                        // });
                        viewModel.onEvent(
                          AddEditMemoEvent.changeColor(color.value),
                        );
                      },
                      child: _buildBgColor(
                          color: color,
                          selected: viewModel.color == color.value),
                      // _color 와 color가 같으면 true
                    ),
                  )
                  .toList(),
            ),
            TextField(
              controller: _titleCtrl,
              maxLines: null,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: darkGray),
              decoration: InputDecoration(
                hintText: '제목을 입력하세요',
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: _contentCtrl,
              maxLines: null,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: darkGray),
              decoration: InputDecoration(
                hintText: '내용을 입력하세요',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

// option 형태
  Widget _buildBgColor({required Color color, required bool selected}) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 4,
            spreadRadius: 0.5,
          )
        ],
        // selected 일 때만 적용 : boolean
        border: selected
            ? Border.all(
                color: darkGray,
                width: 3.0,
              )
            : null,
      ),
    );
  }
}
