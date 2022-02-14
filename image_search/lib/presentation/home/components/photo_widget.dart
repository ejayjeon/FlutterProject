import 'package:flutter/material.dart';
import 'package:image_search/domain/models/photo.dart';

// 포토데이터를 받을 곳 : 그러니까 model photo를 기반으로 움직여야 하는 게 맞다
class PhotoWidget extends StatelessWidget {
  // model을 받아주기 위해서 final 변수 이용
  final Photo photo;
  const PhotoWidget({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(photo.previewURL),
            )),
      ),
    );
  }
}
