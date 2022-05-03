import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_search/data/data_sources/result.dart';
import 'package:image_search/domain/models/photo.dart';
import 'package:image_search/domain/use_case/get_photos_use_case.dart';
import 'package:image_search/presentation/home/home_state.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';

// 화면단 비즈니스 모델
class HomeViewModel with ChangeNotifier {
  //final PhotoApiRepository repository; // repository를 알 필요가 없다
  final GetPhotosUseCase getPhotosUseCase;
  // PixalBayAPI를 받는 게 아니라, 인터페이스로 빼둔 PhotoApiRepository를 받음
  // final _photoStreamController = StreamController<List<Photo>>()..add([]);
  // 최초에는 아무것도 생성되지 않은 상태. 그래서 빈 리스트를 add함
  // ..을 사용하면 void를 사용하는 메소드를 사용하면서, 객체 레퍼런스를 반환할 수 있다.
  // 외부에서 들어온 Stream을 통해서 변경을 체크하는 형식
  // Stream<List<Photo>> get photoStream =>
  //     _photoStreamController.stream; // getter 메소드
  HomeState _state = HomeState([], false);
  HomeState get state => _state;
  // List<Photo> _photos = [];
  // UnmodifiableListView<Photo> get photos =>
  //     UnmodifiableListView(_photos); // getter
  // bool _isLoading = false;
  // bool get isLoading => _isLoading;
  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;
  // 외부에서 다른 개발자가 photos 객체를 수정할 수 없게 하기 위해서 getter를 쓴다
  // .add, .remove 등으로 수정을 못하게 하기 위해서 UnmodifiableListView를 이용한다

  HomeViewModel(this.getPhotosUseCase);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    //state.isLoading = true;
    notifyListeners();
    final Result<List<Photo>> result =
        await getPhotosUseCase(query); // call() 메소드를 가지고 있게 만들어서 생략함

    result.when(
      success: (photos) {
        _state = state.copyWith(photos: photos);
        //state.photos = photos;
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    _state = state.copyWith(isLoading: false);
    //state.isLoading = false;
    notifyListeners();

    // _photoStreamController.add(result);

    // 변경이 된 후 이 메소드를 호출
    // changeNotifier를 구현하고 있는 클래스에서 이 메소드를 쓰면 변경되는 데이터를 감시
  }
}
