import 'package:flutter/material.dart';
import 'package:jemmemo/presentation/memo/components/memo_item.dart';
import 'package:jemmemo/presentation/memo/components/order_section.dart';
import 'package:jemmemo/presentation/memo/memo_event.dart';
import 'package:jemmemo/presentation/memo/memo_view_model.dart';
import 'package:jemmemo/presentation/update_memo/update_memo_screen.dart';
import 'package:provider/provider.dart';

class MemoScreen extends StatelessWidget {
  const MemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MemoViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jem Memo',
          style: TextStyle(fontSize: 30),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              viewModel.onEvent(const MemoEvent.toggleOrderSection());
            },
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isSaved = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UpdateMemoScreen()),
          );
          if (isSaved != null && isSaved) {
            viewModel.onEvent(const MemoEvent.loadMemos());
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.isOrderSectionVisible
                  ? OrderSection(
                      memoOrder: state.memoOrder,
                      onOrderChanged: (memoOrder) {
                        viewModel.onEvent(MemoEvent.changeOrder(memoOrder));
                      },
                    )
                  : Container(),
            ),
            ...state.memos
                .map(
                  (memo) => GestureDetector(
                    onTap: () async {
                      bool? isSaved = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateMemoScreen(
                            memo: memo,
                          ),
                        ),
                      );
                      if (isSaved != null && isSaved) {
                        viewModel.onEvent(const MemoEvent.loadMemos());
                      }
                    },
                    child: MemoItem(
                      memo: memo,
                      onDeleteTap: () {
                        viewModel.onEvent(MemoEvent.deleteMemo(memo));
                        final snackBar = SnackBar(
                          content: const Text('노트가 삭제되었습니다'),
                          action: SnackBarAction(
                            label: '취소',
                            onPressed: () {
                              viewModel.onEvent(
                                const MemoEvent.undoMemo(),
                              );
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
