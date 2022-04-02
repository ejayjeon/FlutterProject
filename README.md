# ToyProject

(인프런: Flutter 앱 개발 101) <br/>

## 1) Web View

- `pub.dev` 패키지 이용하기
- 플랫폼 별 Native 세팅 변경하기
- WebView 위젯 이용하기
- WebView 상 JavaScript 권한 열기
- HTTP 프로토콜 열어주기

<br/>

## 2) 전자 액자

- PageView 위젯 사용하기
- Timer 클래스 주기적으로 실행하기
- Stateful & 라이프사이클 실전 이용하기

<br/>

## 3) 우리 처음 만난 날

- Image / Font / Theme 적용하기
- Date Picker 사용하기
- Date Time 클래스 실전에 사용하기
- Cupertino Dialog 활용하기

<br/>

## 4) 랜덤 숫자 생성기

- 난수 생성하기
- 간단한 Navigation 및 데이터 송수신
- Slider 위젯 사용하기
- Functional 프로그래밍을 활용한 위젯 렌더링 및 코드정리

<br/>

## 5) 동영상 플레이어

- AspectRatio 위젯 사용하기 : 동영상이나 사진을 삽입했을 때, 원래의 비율대로 조정하기 위함
```dart
AspectRatio(
 aspectRatio: videoController!.value.aspectRatio,
 ...
)
```

- Stack 위젯 사용하기
```dart
  Stack(
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
```

- Image Picker 라이브러리 사용하기
```dart
void onNewVideoPressed() async {
  final video = await ImagePicker().pickVideo(
    source: ImageSource.gallery,
  );
}
```
- Video Player 라이브러리 사용하기
```dart
 CustomVideoPlayer(
    video: video!,
    onNewVideoPressed: onNewVideoPressed,
  )
```
- 재생, 정지, 3초 앞으로 돌리기, 3초 뒤로 돌리기, 동영상 컨드롤러 제작하기
```dart
void onReversePressed() {
  // 현재 영상이 어느 부분을 상영하고 있는지 알고 있어야 한다
  final currentPosition = videoController!.value.position;
  Duration position = Duration();
  
  // 현재 포지션이 3초가 안된 경우? 기존 포지션 0초
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
```

<br/>

## 6) 위치 기반 출근 앱

- 구글 지도 API 세팅하기
- 위치 서비스를 이용하여 내 위치 지도에 표시하기
- 특정 위치간 거리 구하기
- 지도에 마커 표시하기
- 지도에 원 표시하기
- 특정 위치로 카메라 이동시키기
- 현재 위치 표시하고 위도와 경도 구하기
- 위도와 경도간 거리 구하기
- Material Dialog 활용하기

<br/>

## 7) LIVE 영상 통화

- Agora API를 활용한 영상통화 앱 제작
- Box Shadow 사용하기
  <br/>

## 8) 캘린더 스케줄러

- Drift 패키지를 활용한 SQ Lite 사용하기
- Bottom Sheet 활용하기
- Wrap 위젯 사용하기
- Table Calendar 패키지 활용하기
- Dismissible 위젯으로 삭제 애니메이션 구현하기
- Stream을 통해 데이터의 변화 자동으로 감지하기

<br/>

## 9) 미세먼지 측정 앱

- HTTP 요청 연동하기
- Hive 데이터베이스를 이용한 캐싱 및 오 프라인 지원
  <br/>
