import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:video_recoder/theme/theme.dart';

// homeScreen에서 다 담을 수 없는 규모의 비디오를 담기 위해 components 제작
class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  final VoidCallback onNewVideoPressed;
  const CustomVideoPlayer(
      {required this.onNewVideoPressed, required this.video, Key? key})
      : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController;

  // 현재 비디오의 포지션을 매번 여기에다가 저장할 것
  Duration currentPosition = Duration();
  bool showController = false;

  @override
  void initState() {
    super.initState();
    initializeController(); // 이게 끝날 때까지 기다리지는 않음
  }

  // 위젯이 살아있는 상태에서 상태가 변경되었을 때에는?? initState X -> didUpdate
  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

// 업데이트 전의 oldwidget과 현재 상태의 위젯이 다르다면, initializeController를 다시 실행한다는 의미
    if (oldWidget.video.path != widget.video.path) {
      initializeController();

      //Another exception was thrown: 'package:flutter/src/material/slider.dart': Failed assertion: line 147 pos 15: 'value >= min && value <= max': is not true. 버그
      // 현재 포지션을 변경하지 않은 채로 새로 컨트롤러를 생성했을 때 싱크가 맞지 않아서 생기는 버그

    }
  }

// initState는 async 사용할 수 없어서 임시로 async 할 수 있는 함수 만듦
  initializeController() async {
    currentPosition = Duration();
    videoController = VideoPlayerController.file(
      // ImagePicker의 xFile을 File의 형태로 바꾸어서 path를 불러와줌
      // flutter.io pkg
      File(widget.video.path), // xFile형태
    );
    await videoController!.initialize();
    videoController!.addListener(
      () async {
        final currentPosition = videoController!.value.position;
        setState(
          () {
            this.currentPosition = currentPosition;
          },
        );
      },
    );

// 비디오 컨트롤러를 만들었으니까 새롭게 빌드하라는 의미
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // videoController가 null일 수 있으니까 미리 null처리를 해줌
    if (videoController == null) {
      return const CircularProgressIndicator(
        color: primaryColor,
      );
    }
    return AspectRatio(
      // 원래영상의 비율 조정
      aspectRatio: videoController!.value.aspectRatio,
      // showController를 true로 변경해주기 위해
      child: GestureDetector(
        onTap: () {
          setState(() {
            showController = !showController;
          });
        },
        child: Stack(
          children: [
            VideoPlayer(
              videoController!,
            ),
            if (showController)
              _controllers(
                onReversePressed: onReversePressed,
                onPlayPressed: onPlayPressed,
                onForwardPressed: onForwardPressed,
                isPlaying: videoController!.value.isPlaying,
              ),
            if (showController)
              _newVideo(
                onPressed: widget.onNewVideoPressed,
              ),
            _slideBottom(
              currentPosition: currentPosition,
              videoController: videoController,
              maxPosition: videoController!.value.duration,
              onChanged: onSlideChanged,
            ),
          ],
        ),
      ),
    );
  }

  void onSlideChanged(double val) {
    // setState(() {
    //   currentPosition = Duration(seconds: val.toInt());
    // });
    videoController!.seekTo(
      Duration(
        seconds: val.toInt(),
      ),
    );
  }

  void onReversePressed() {
    // 현재 영상이 어느 부분을 상영하고 있는지 알고 있어야함
    final currentPosition = videoController!.value.position;
    // 현재 포지션이 3초가 안된 경우? 기존 포지션 0초
    Duration position = Duration();
    if (currentPosition.inSeconds > 3) {
      position = currentPosition - Duration(seconds: 3);
    }
    videoController!.seekTo(position);
  }

  void onPlayPressed() {
    // 영상 재생
    // 이미 실행중이면 중지 : 실행중이 아니면 재생
    setState(() {
      if (videoController!.value.isPlaying) {
        videoController!.pause();
      } else {
        videoController!.play();
      }
    });
  }

  void onForwardPressed() {
    final maxPosition = videoController!.value.duration;
    final currentPosition = videoController!.value.position;
    Duration position = maxPosition;
    // 전체길이에서 3초를 뺀 부분을 초로 가져온 부분이 현재 길이보다 길 경우, 현재 포지션에서 3초를 더해도 길어지지 않는다.
    if ((maxPosition - Duration(seconds: 3)).inSeconds >
        currentPosition.inSeconds) {
      position = currentPosition + Duration(seconds: 3);
    }
    videoController!.seekTo(position);
  }

  // void onNewVideoPressed() {}
  // 이 함수는 실제로 homeScreen에서 관리를 해야함
}

// SlideBottom
class _slideBottom extends StatelessWidget {
  const _slideBottom({
    Key? key,
    required this.currentPosition,
    required this.videoController,
    required this.maxPosition,
    required this.onChanged,
  }) : super(key: key);

  final Duration currentPosition;
  final VideoPlayerController? videoController;
  final Duration maxPosition;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              '${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(color: fontColor),
            ),
            Expanded(
              child: Slider(
                value: currentPosition.inSeconds.toDouble(),
                onChanged: onChanged,
                max: maxPosition.inSeconds.toDouble(),
                min: 0,
              ),
            ),
            Text(
              '${maxPosition.inMinutes}:${(maxPosition.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(color: fontColor),
            ),
          ],
        ),
      ),
    );
  }
}

class _newVideo extends StatelessWidget {
  final VoidCallback onPressed;
  const _newVideo({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: IconButton(
        color: fontColor,
        onPressed: onPressed,
        icon: Icon(Icons.photo_camera_back),
      ),
    );
  }
}

class _controllers extends StatelessWidget {
  final VoidCallback onPlayPressed;
  final VoidCallback onReversePressed;
  final VoidCallback onForwardPressed;
  final bool isPlaying;

  const _controllers({
    required this.onPlayPressed,
    required this.onReversePressed,
    required this.onForwardPressed,
    required this.isPlaying,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: isPlaying ? bgColor.withOpacity(0) : bgColor.withOpacity(0.5),
      child: Row(
        // 버튼까지 늘어남
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          renderIconButton(
            onPressed: onReversePressed,
            iconData: Icons.rotate_left,
          ),
          renderIconButton(
            onPressed: onPlayPressed,
            iconData: isPlaying ? Icons.pause : Icons.play_arrow,
          ),
          renderIconButton(
            onPressed: onForwardPressed,
            iconData: Icons.rotate_right,
          ),
        ],
      ),
    );
  }

  Widget renderIconButton(
      {required VoidCallback onPressed, required IconData iconData}) {
    return IconButton(
      onPressed: onPressed,
      iconSize: 50.0,
      color: fontColor,
      icon: Icon(iconData),
    );
  }
}
