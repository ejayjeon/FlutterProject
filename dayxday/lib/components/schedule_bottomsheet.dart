import 'package:dayxday/components/custom_text_field.dart';
import 'package:dayxday/model/category_name.dart';
import 'package:dayxday/theme/theme.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// Column이라는 패키지를 불러오지 않겠다 -> 이렇게 해주지 않으면 에러가 발생함
import 'package:dayxday/database/drift_db.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDate;
  final int? sheduleId;
  const ScheduleBottomSheet(
      {required this.selectedDate, this.sheduleId, Key? key})
      : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  // 일종의 Form의 컨트롤러 역할
  final GlobalKey<FormState> formkey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;
  int? selectedCateId;

// 키보드가 올라오는 만큼 아래 패딩을 넣어주어야 한다
  @override
  Widget build(BuildContext context) {
    // 시스템적인 UI 때문에 가려진 분
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return GestureDetector(
      onTap: () {
        // 아무 곳이나 눌렀을 때 키보드가 닫히게끔
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: FutureBuilder<Schedule>(
          future: widget.sheduleId == null
              ? null
              : GetIt.I<LocalDb>().getScheduleById(widget.sheduleId!),
          builder: (context, snapshot) {
            //print(snapshot.data);
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  '스케줄을 불러올 수 없습니다',
                  style: TextStyle(color: veryperi),
                ),
              );
            }
            // Future Builder 가 처음 실행되었고 로딩중일 때
            if (snapshot.connectionState != ConnectionState.none &&
                !snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // Future 가 실행되고 값이 있는데, 단 한 번도 StartTime이 세팅되지 않았을 때
            if (snapshot.hasData && startTime == null) {
              startTime = snapshot.data!.startTime;
              endTime = snapshot.data!.endTime;
              content = snapshot.data!.content;
              selectedCateId = snapshot.data!.cateId;
            }
            return SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height / 2 + bottomInset,
                decoration: BoxDecoration(
                  color: fontColor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  // 키보드가 안올라올 때에는 cmd + shift + k
                  padding: EdgeInsets.only(bottom: bottomInset),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
                    // FormTextField를 사용하기 위해
                    child: Form(
                      key: formkey, // Form의 Controller
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _Time(
                            onStartSaved: (String? val) {
                              startTime = int.parse(val!);
                            },
                            startInitialValue: startTime?.toString() ?? '',
                            onEndSaved: (String? val) {
                              endTime = int.parse(val!);
                            },
                            endInitialValue: endTime?.toString() ?? '',
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          _Content(
                            onContentSaved: (String? val) {
                              content = val!;
                            },
                            contentInitialValue: content ?? '',
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          FutureBuilder<List<CategoryNameData>>(
                            future: GetIt.I<LocalDb>().getCategoryName(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData && selectedCateId == null) {
                                if (snapshot.data!.isNotEmpty) {
                                  selectedCateId = snapshot.data![0].cateId;
                                }
                              }

                              return _CatePicker(
                                  cateIdSetter: (int cateId) {
                                    setState(() {
                                      selectedCateId = cateId;
                                    });
                                  },
                                  selectedCateId: selectedCateId,
                                  categoryName: snapshot.hasData
                                      ? snapshot.data!.map((e) => e).toList()
                                      : []);
                              // Color의 경우:
                              // Color(int.parse('FF${e.hexCode}', radix: 16,)).toList()
                            },
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          _SaveBtn(
                            onPressed: onSaveBtnPressed,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  onSaveBtnPressed() async {
    // 눌렀을 때 FormKey를 사용해서 TextField 검증
    if (formkey.currentState == null) {
      return; // formKey는 생성했는데, formWidget과 결합을 못함. 여기서 끝냄
    }
    // 모든 필드의 Validate가 실행 -> String값을 리턴하면 에러가 있는 것임
    if (formkey.currentState!.validate()) {
      print('에러 없음');
      formkey.currentState!.save();

      if (widget.sheduleId == null) {
        final key = await GetIt.I<LocalDb>().createSchedule(
          SchedulesCompanion(
            content: Value(content!),
            date: Value(widget.selectedDate),
            startTime: Value(startTime!),
            endTime: Value(endTime!),
            cateId: Value(selectedCateId!),
            colorId: Value(1),
          ),
        );
      } else {
        await GetIt.I<LocalDb>().updateScheduleById(
            widget.sheduleId!,
            SchedulesCompanion(
              content: Value(content!),
              date: Value(widget.selectedDate),
              startTime: Value(startTime!),
              endTime: Value(endTime!),
              cateId: Value(selectedCateId!),
              colorId: Value(1),
            ));
      }

      Navigator.of(context).pop();
    } else {
      print('에러 발생');

      renderCate(String string) {}
    }
  }
}

class _Content extends StatelessWidget {
  final FormFieldSetter<String> onContentSaved;
  final String? contentInitialValue;
  const _Content({
    required this.onContentSaved,
    this.contentInitialValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        initialValue: contentInitialValue!,
        label: '내용',
        isTime: false,
        onSaved: onContentSaved,
      ),
    );
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSaved;
  final FormFieldSetter<String> onEndSaved;
  final String? startInitialValue;
  final String? endInitialValue;
  const _Time({
    required this.onStartSaved,
    required this.onEndSaved,
    this.startInitialValue,
    this.endInitialValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '시작 시간',
            isTime: true,
            onSaved: onStartSaved,
            initialValue: startInitialValue!,
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: CustomTextField(
            label: '마감 시간',
            isTime: true,
            onSaved: onEndSaved,
            initialValue: endInitialValue!,
          ),
        ),
      ],
    );
  }
}

typedef CateIdSetter = void Function(int cateId);

class _CatePicker extends StatelessWidget {
  final List<CategoryNameData> categoryName;
  final int? selectedCateId;

  final CateIdSetter cateIdSetter;
  const _CatePicker(
      {required this.cateIdSetter,
      required this.selectedCateId,
      required this.categoryName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.0,
      runSpacing: 8.0,
      children: categoryName
          .map((e) => GestureDetector(
              onTap: () {
                cateIdSetter(e.cateId);
              },
              child: renderCate(e.category, selectedCateId == e.cateId)))
          .toList(),
      // renderCate('pencil'),
      // renderCate('book'),
      // renderCate('call'),
      // renderCate('cinema'),
      // renderCate('coding'),
      // renderCate('coffee'),
      // renderCate('eat'),
      // renderCate('exercising'),
      // renderCate('game'),
      // renderCate('hand'),
      // renderCate('medical'),
      // renderCate('meeting'),
      // renderCate('paint'),
      // renderCate('gold'),
      // renderCate('stock'),
      // renderCate('travel'),
      // renderCate('work'),
    );
  }

  Widget renderCate(String cate, isSelected) {
    return SizedBox(
      child: Image.asset(
        'asset/img/${cate}.png',
        color: isSelected ? veryperi : paleGrey,
      ),
      width: 15.0,
      height: 15.0,
    );
  }
}

class _SaveBtn extends StatelessWidget {
  final VoidCallback onPressed;
  const _SaveBtn({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(primary: veryperi),
            child: Text('저장'),
          ),
        ),
      ],
    );
  }
}
