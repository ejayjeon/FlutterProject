import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_recoder/components/custom_video_player.dart';
import 'package:video_recoder/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 영상을 골랐으면 state에서 저장을 하고 있어야함
  XFile? video;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      // video를 선택하지 않았을 때 renderEmpty()
      body: video == null ? renderEmpty() : renderVideo(),
    );
  }

// 영상을 골랐을 때
  Widget renderVideo() {
    return Center(
      // renderVideo가 실행되는 경우에는 Video가 null인 경우가 아니기 때문에 !를 붙여주어서 null이 아님을 보증해 준다
      child: CustomVideoPlayer(
        video: video!,
        onNewVideoPressed: onNewVideoPressed,
      ),
    );
  }

// 영상이 없을 때
  Widget renderEmpty() {
    final textStyle = TextStyle(
        color: fontColor,
        fontSize: 40.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w300);
    // stateful widget은 따로 context를 넣어주지 않아도 어디서나 가져올 수 있음
    return SafeArea(
      top: false,
      bottom: false,
      // 전체 너비를 구하기 위해 SizedBox 설정
      child: Container(
        // 데코레이션과 color: 를 같이 쓸 수 없다
        decoration: getBoxDecoration(),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Logo(
              onTap: onNewVideoPressed,
            ),
            const SizedBox(
              height: 30.0,
            ),
            _AppTitle(textStyle: textStyle),
          ],
        ),
      ),
    );
  }

  void onNewVideoPressed() async {
    //print('실행');
    final video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (video != null) {
      setState(() {
        this.video = video;
      });
    }
  }

  BoxDecoration getBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter, // 어디서 시작할지
        end: Alignment.bottomCenter, // 어디서 끝낼지
        colors: [primaryColor, bgColor, Colors.black], // 리스트로 색깔을 받는다
      ),
    );
  }
}

class _AppTitle extends StatelessWidget {
  const _AppTitle({
    Key? key,
    required this.textStyle,
  }) : super(key: key);

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'VIDEO ',
          style: textStyle,
        ),
        Text(
          'PLAYER',
          // copyWith : 기존에 선언된 것들을 copy 해서 덮어 씌운다
          style: textStyle.copyWith(fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;
  const _Logo({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 170.0,
          ),
        ],
      ),
    );
  }
}
