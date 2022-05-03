import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search/style.dart';
import 'package:image_search/presentation/home/home_view_model.dart';
import 'package:image_search/presentation/home/components/photo_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  // final PixabayApi api;
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final api = PixabayApi(); 클래스 내부에서 인스턴스 생성 금지
  final _controller = TextEditingController();
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final viewModel = context.read<HomeViewModel>();
      viewModel.eventStream.listen(
        (event) {
          event.when(
            showSnackBar: (message) {
              final snackBar = SnackBar(content: Text(message));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          );
        },
      );
    });
  }

// 다쓴 컨트롤러 해제
  @override
  void dispose() {
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final viewModel = Provider.of<HomeViewModel>(context); // 예전 방식
    // final viewModel = context.watch<HomeViewModel>(); // 요즘 방식
    // Inherited Widget을 만들어 쓰지 않아도 된다
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'PixaBay 검색앱',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: MyColor.veryPeri,
        elevation: 0,
      ),
      body: Column(
        // 컬럼 안에 정확한 사이즈를 가지지 않는 위젯이 들어올 때 hasSize 에러 발생 : 해결법 1) shrinkWrap 2) gridView 자체를 화면에 꽉 채운다 : Expanded
        // 변수를 사용하지 않고 const 사용 시 compile 시 메모리 누수로부터 보호
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                suffixIcon: IconButton(
                  onPressed: () async {
                    context.read<HomeViewModel>().fetch(_controller.text);
                    // 실행하면 내부적으로 입력한 데이터는 add 메소드를 통해 들어가게 됨

                    // fetch 를 수행할 수 있도록 async
                    // 사용자가 무언가를 입력했을 때, controller를 통해 값을 얻을 수 있다.
                    // 이때 얻은 값을 통해 fetch를 수행할 것
                    // final photos =
                    //     await photoProvider.api.fetch(_controller.text);
                    // setState(() {
                    //   _photos = photos;
                    // });
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          // StreamCode를 Provider를 이용해서 제거함
//           StreamBuilder<List<Photo>>(
//             stream: viewModel.photoStream,
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const CircularProgressIndicator();
//               }
//               final photos = snapshot.data!;

// // Expanded 내부에서 Stream을 사용할 수 있도록 StreamBuilder로 감싸준다
//               return
//             },
//           ),
          Consumer<HomeViewModel>(
            builder: (_, viewModel, child) {
              return viewModel.state.isLoading
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(16),
                        //shrinkWrap: true,
                        itemCount:
                            viewModel.state.photos.length, // snapshot.data
                        // 그리드를 설정할건데, 가로 세로 스페이스 등을 지정해줌
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        // 아이템 빌더 : 컨텍스트랑 인덱스가 필요함
                        itemBuilder: (context, index) {
                          final photo =
                              viewModel.state.photos[index]; // snapshot.data
                          return PhotoWidget(
                            photo: photo,
                          );
                        },
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
