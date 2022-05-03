// import 'package:image_search/domain/models/photo.dart';

// class HomeState {
//   // UI에서 보여질 상태를 업데이트 하는 곳
//   final List<Photo> photos;
//   final bool isLoading;

//   HomeState(this.photos, this.isLoading);

//   // final을 붙이면 수정을 못하니까 copy를 하는 것
//   HomeState copy({List<Photo>? photos, bool? isLoading}) {
//     return HomeState(photos ??= this.photos, isLoading ??= this.isLoading);
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search/domain/models/photo.dart';
part 'home_state.freezed.dart';
part 'home_state.g.dart';

// state 불변 객체로 만들기 : viewModel 내부에서 보여지는 객체는 읽기 전용으로 만들자
@freezed
class HomeState with _$HomeState {
  factory HomeState(
    List<Photo> photos,
    bool isLoading,
  ) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
