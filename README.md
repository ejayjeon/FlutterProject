# ToyProject

(인프런: Flutter 앱 개발 101) <br/>

## 1) Web View

- `pub.dev` 패키지 이용하기

  - webview_flutter: ^3.0.1

- WebView 컨트롤러 & 위젯 이용하기

```dart
// 웹뷰 컨트롤러 사용 -> WebView 위젯 내에서 선언한 onWebViewCreated controller 대체
WebViewController? controller;
final url = 'https://github.com/jemmajeon';
...
body: WebView(
  // 처음 시작할 때 WebViewController를 불러옴
  // on : 어떤 행동을 시작했을 때
    onWebViewCreated: (WebViewController controller) {
      // 상단에 선언한 context의 controller가 곧 이 controller
      this.controller = controller;
    },
    initialUrl: url,
),
```

<br/>

- WebView 상 JavaScript 권한 열기

```dart
  // default 값에서 자바스크립트 사용 중지를 풀어줌
javascriptMode: JavascriptMode.unrestricted,
```

<br/>

- HTTP 프로토콜 열어주기

```dart
// ios : ios > Runner > info.plist
// 가장 하단에 작성
...
// <-- 여기부터
    <key>NSAppTransportSecurity</key>
    <dict>
    <key>NSAllowsLocalNetworking</key>
    <true/>
    <key>NSAllowsArbitrayLoadInWebContent</key>
    <true/>
    </dict>
//  여기까지 -->
</dict>
</plist>

```

<br/><br/>

---

<br/>

## 2) 전자 액자

- PageView 위젯 사용하기

```dart
PageController controller = PageController(initialPage: 0,);
...
body: PageView(
  controller: controller,
  children: [1, 2, 3, 4, 5]
  .map(
    (e) => Image.asset('assets/image_$e.jpeg', fit: BoxFit.cover),
  ).toList(),
),

```

<br/>

- Timer 클래스 주기적으로 실행하기

```dart
timer = Timer.periodic(Duration(seconds: 1), (timer) {
  // 사이에 내용 추가
  }
```

<br/>

- Stateful & 라이프사이클 실전 이용하기

```dart
// Timer는 앱이 최초에 실행될 때, initState 단계에서 실행
@override
void initState() {
  super.initState();
  timer = Timer.periodic(Duration(seconds: 1), (timer) {
    int currentPage = controller.page!.toInt();
    int nextPage = currentPage + 1;

    // 마지막 페이지에 달하면 페이지 다시 0페이지로
    if (nextPage > maxPage) {
      nextPage = 0;
    }
    controller.animateToPage(nextPage,
        duration: Duration(milliseconds: 1000), curve: Curves.linear);
  });
}

// Timer 와 Controller는 dispose에서 꼭 해제해 준다
 @override
  void dispose() {
    controller.dispose();
    if (timer != null) timer!.cancel();
    super.dispose();
  }


```

<br/><br/>

---

<br/>

## 3) 우리 처음 만난 날

- Image / Font / Theme 적용하기

```dart
// pubspect.yaml
// image
 assets:
    - asset/images/

// font
fonts:
    - family: GowunDodum
      fonts:
        - asset: asset/fonts/GowunDodum-Regular.ttf

```

<br/>

- Date Picker 사용하기

```dart
DateTime selectedDate = DateTime.now();
...

child: CupertinoDatePicker(
  // 한계 날짜를 정해줌
  mode: CupertinoDatePickerMode.date,
  initialDateTime: selectedDate,
  maximumDate: DateTime.now(),
  onDateTimeChanged: (DateTime date) {
    setState(() {
      // 받아오는 date와, 선언한 selectedDate
      selectedDate = date;
    });
  },
),

```

<br/>

- Date Time 클래스 실전에 사용하기

```dart
// 현재날짜와 디데이를 카운트할 선택한 날짜와의 차이 구하기
final now = DateTime.now();
...
'D+${DateTime(now.year, now.month, now.day).difference(selectedDate).inDays + 1}

```

<br/>

- Cupertino Dialog 활용하기

```dart
showCupertinoDialog(
  context: context,
  // 다른 부분 클릭 여부 컨트롤
  barrierDismissible: true,
  builder: (BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.white.withOpacity(0.5),
        height: 300.0,
        child: CupertinoDatePicker(
          // 한계 날짜를 정해줌
          mode: CupertinoDatePickerMode.date,
          initialDateTime: selectedDate,
          maximumDate: DateTime.now(),
          onDateTimeChanged: (DateTime date) {
            setState(
              () {
                selectedDate = date;
              },
            );
          },
        ),
      ),
    );
  },
);

```

<br/>

---

<br/>

## 4) 랜덤 숫자 생성기

- 난수 생성하기

```dart
import 'dart:math';
...
final rand = Random();
// 랜덤 숫자 중 중복숫자를 방지하기 위해 List / Map / Set 중 Set 이용
final Set<int> newNumbers = {};
  while (newNumbers.length != 6) {
    final number = rand.nextInt(maxNumber);
    newNumbers.add(number);
  }

```

<br/>

- 간단한 Navigation 및 데이터 송수신

```dart
// push : list의 Add와 같은 기능. 페이지 이동
 Navigator.of(context).push<int>(
  MaterialPageRoute(
    builder: (BuildContext context) {
      return SettingsScreen(
        maxNumber: maxNumber,
      );
    },
  ),

// 뒤로가기
Navigator.of(context).pop(maxNumber.toInt());

```

<br/>

- Slider 위젯 사용하기

```dart
 void initState() {
  super.initState();
  maxNumber = widget.maxNumber.toDouble();
 }
...
Slider(
  value: maxNumber,
  min: 0,
  max: 100,
  onChanged: (double val) {
    setState(() {
      maxNumber = val;
      print(maxNumber);
    });
  },
),

```

<br/>

- Functional 프로그래밍 / asMap()

```dart
Column(
  children: randomNumbers
      .asMap()
      .entries
      .map(
        (e) => Padding(
          // 열의 마지막 숫자면 패딩을 넣지 않는다? asMap().entries를 한 순간 key를 가지고 올 수 있다
          // 인덱스의 마지막 번째 !== ? :
          padding: EdgeInsets.only(bottom: e.key == 5 ? 0 : 16.0),
          child: Row(
            children: e.value
                .toString()
                .split('')
                .map((y) => Image.asset(
                      'assets/images/$y.png',
                      height: 70.0,
                      width: 50.0,
                    ))
                .toList(),
          ),
        ),
      )
      .toList(),
),

```

<br/><br/>

---

<br/>

## 5) 동영상 플레이어

- AspectRatio 위젯 사용하기 : 동영상이나 사진을 삽입했을 때, 원래의 비율대로 조정하기 위함

```dart
AspectRatio(
 aspectRatio: videoController!.value.aspectRatio,
 ...
)
```

<br/>

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

<br/>

- Image Picker 라이브러리 사용하기

```dart
void onNewVideoPressed() async {
  final video = await ImagePicker().pickVideo(
    source: ImageSource.gallery,
  );
}
```

<br/>

- Video Player 라이브러리 사용하기

```dart
 CustomVideoPlayer(
    video: video!,
    onNewVideoPressed: onNewVideoPressed,
  )
```

<br/>

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

<br/><br/>

---

<br/>

## 6) 위치 기반 출근 앱

- 구글 지도 API 세팅하기

  - google_maps_flutter 2.1.3
  - geolocator 8.2.0

<br/>

- 위치 서비스를 이용하여 내 위치 지도에 표시하기

```dart
// latitude(위도) - longitude(경도)를 나타내기 위한 GoogleMaps 라이브러리 기능 이용하기
// 화면에서 보이는 가운데, 위도와 경도 지점
final LatLng deksuLatLng = LatLng(37.566254, 126.975775);

// Zoom Level ( 1 ~ 20 )
final CameraPosition initialPosition = CameraPosition(
  target: companyLatLng,
  zoom: 15,
);

// GoogleMap 위젯을 사용해서 화면에 위젯 띄우기
Scaffold(
  body: GoogleMap(
    // 처음 구글 지도 시작했을 때 위치
    initialCameraPosition: initialPosition,
    // 지도 타입 : hybrid, normal, satellite, terrain
    mapType: MapType.normal,
  ),
);
```

<br/>

- 위치 서비스 이용에 대한 권한 요청하기 (geolocator)

```dart
Future<String> checkPermission() async {
  final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

  if (!isLocationEnabled) {
    return '위치 서비스를 활성화 해주세요';
  }

// 현재 앱이 가지고 있는 위치 서비스 : denied, deniedForever, whileInUse, always
  LocationPermission checkedPermission = await Geolocator.checkPermission();

  if (checkedPermission == LocationPermission.denied) {
    checkedPermission = await Geolocator.requestPermission();
// 그럼에도 불구하고 위치 권한 서비스가 denied 상태라면
    if (checkedPermission == LocationPermission.denied) {
      return '위치 권한을 허가해 주세요';
    }
  }

  if (checkedPermission == LocationPermission.deniedForever) {
    return '앱의 위치 권한을 설정창에서 허가해주세요';
  }

  return '위치 권한이 허가되었습니다';
}
```

<br/>

- FutureBuilder / StreamBuilder 이용하기

```dart
// 1. FutureBuilder : Future 형태를 받아서 값을 리턴해줄 수 있는 위젯
Future<String> checkPermission() async {
  final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

  if (!isLocationEnabled) {
    return '위치 서비스를 활성화 해주세요';
  }
}

// Future 값을 snapshot으로 반환받을 수 있게 된다
body: FutureBuilder<String>(
  future: checkPermission(), // 무조건 Future를 리턴해주는 함수 실행
  builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      );
    }
  }
}


// 2. StreamBuilder : yield를 통해 받아오는 값의 변화가 있을 때마다 계속해서 값을 리턴함
// 새로운 위치가 yield 되면 snapshot.data가 바뀌기 때문에 builder가 다시 실행되고, streambuilder는 변경된 상태를 계속해서 리스닝하기 때문에 값을 받아올 수 있게 된다
StreamBuilder<Position>(
  stream: Geolocator.getPositionStream(),
  builder: (context, snapshot) {
 ...
  }
)

```

<br/>

- 지도에 마커 표시하기

```dart
// Marker 인스턴스 생성
 final Marker marker = Marker(
  markerId: MarkerId('marker'),
  position: companyLatLng,
);

// GoogleMaps 위젯 안에서 사용. marker는 Set 형태로 저장
child: GoogleMap(
 ...
  markers: Set.from([marker]),
);

```

<br/>

- 지도에 원 표시하기
  ![이미지](./worabel/assets/2.png)

```dart
// Circle 인스턴스 생성
final Circle withinDistanceCircle = Circle(
  circleId: CircleId('withinDistanceCircle'),
  center: companyLatLng,
  fillColor: primaryColor.withOpacity(0.5),
  radius: distance,
  strokeColor: primaryColor,
  strokeWidth: 1,
);

// GoogleMaps 위젯 안에서 사용. circle은 Set 형태로 저장
child: GoogleMap(
  ...
  circles: Set.from([circle]),
),

```

<br/>

- 특정 위치로 카메라 이동시키기

```dart
// 구글맵 컨트롤러 생성
GoogleMapController? mapController;

// 컨트롤러가 null이 아닐 경우를 가정하여, animateCamera를 이용, Geolocator가 제공하는 Position 메소드를 이용한다. -> getCurrentPosition()을 이용해도 된다
final location = await Geolocator.getLastKnownPosition();
  mapController!.animateCamera(
    CameraUpdate.newLatLng(
      LatLng(location!.latitude, location.longitude),
    ),
  );


```

<br/>

- 현재 위치 표시하고 위도와 경도 구하기

```dart

// 내가 원 안에 위치해 있으면 true, 그렇지 않으면 false
bool isWithinRange = false;
  if (snapshot.hasData) {
    final start = snapshot.data!;
    final end = companyLatLng;

// Geolocator 내 거리를 구하는 메소드 이용
    final distance = Geolocator.distanceBetween(
      start.latitude,
      start.longitude,
      end.latitude,
      end.longitude,
    );
    // circle이 표시되는, 즉 회사 주변 100m 이내라는 이야기
    if (distance < circleDistance) {
      isWithinRange = true;
    }
  }

```

<br/>

- Material Dialog 활용하기

![이미지](./worabel/assets/1.png)

```dart
showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: const Text('출근하기'),
      content: const Text('출근을 하시겠습니까'),
    )
  }
  actions: []
);

```

<br/><br/>

---

<br/>

## 7) LIVE 영상 통화

- Agora API를 활용한 영상통화 앱 제작

```dart

```

<br/>

- RTC(Real Time Communication) : 실시간 커뮤니케이션

```dart

```

<br/>

- Stack : 현재 영상 위로 쌓이는 레이어 위젯

```dart

```

<br/><br/>

---

<br/>

## 8) 캘린더 스케줄러

- Drift 패키지를 활용한 SQ Lite 사용하기

```dart

```

<br/>

- Bottom Sheet 활용하기

```dart

```

<br/>

- Wrap 위젯 사용하기

```dart

```

<br/>

- Table Calendar 패키지 활용하기

```dart

```

<br/>

- Dismissible 위젯으로 삭제 애니메이션 구현하기

```dart

```

<br/>

- Stream을 통해 데이터의 변화 자동으로 감지하기

```dart

```

<br/>

<br/>

---

<br/>

## 9) 미세먼지 측정 앱

- HTTP 요청 연동하기

```dart

```

<br/>

- Hive 데이터베이스를 이용한 캐싱 및 오 프라인 지원

```dart

```

<br/>

<br/>
