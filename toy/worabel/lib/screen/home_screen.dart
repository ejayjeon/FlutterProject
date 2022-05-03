import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:worabel/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool shiftDone = false;
  GoogleMapController? mapController;
  static final LatLng companyLatLng = LatLng(37.566254, 126.975775);
  static double okDistance = 100;

  static final Circle withinDistanceCircle = Circle(
    circleId: CircleId('withinDistanceCircle'),
    center: companyLatLng,
    fillColor: primaryColor.withOpacity(0.5),
    radius: okDistance,
    strokeColor: primaryColor,
    strokeWidth: 1,
  );

  static final Circle notWithinDistanceCircle = Circle(
    circleId: CircleId('notWithinDistanceCircle'),
    center: companyLatLng,
    fillColor: errorColor.withOpacity(0.5),
    radius: okDistance,
    strokeColor: errorColor,
    strokeWidth: 1,
  );

  static final Circle checkedCircle = Circle(
    circleId: CircleId('checkedCircle'),
    center: companyLatLng,
    fillColor: corrColor.withOpacity(0.5),
    radius: okDistance,
    strokeColor: corrColor,
    strokeWidth: 1,
  );

  static final Marker marker = Marker(
    markerId: MarkerId('marker'),
    position: companyLatLng,
  );

  static final CameraPosition initialPosition = CameraPosition(
    target: companyLatLng,
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '워라벨',
          style: TextStyle(color: fontColor, fontSize: 20.0),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              if (mapController == null) {
                return;
              }
              final location = await Geolocator.getLastKnownPosition();
              mapController!.animateCamera(
                CameraUpdate.newLatLng(
                  LatLng(location!.latitude, location.longitude),
                ),
              );
              print(location);
              // mapController!.animateCamera(
              //   CameraUpdate.
              // );
              // if (mapController == null) {
              //   return;
              // }
              // final location = await Geolocator.getCurrentPosition();
              // mapController!.animateCamera(
              //   CameraUpdate.newLatLng(
              //     LatLng(location.latitude, location.longitude),
              //   ),
              // );
              print('이동완료');
            },
            icon: Icon(Icons.my_location),
          ),
        ],
      ),
      // 권한 허가를 위해 일반 Column 대신 FutureBuilder를 사용
      body: FutureBuilder<String>(
        future: checkPermission(), // 무조건 Future를 리턴해주는 함수 실행
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // Future 값을 snapshot으로 반환받을 수 있게 된다
          //print(snapshot.connectionState);
          //print(snapshot.data);
          if (!snapshot.hasData) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            // 처음 재시작했을 때만 data가 없음. setState를 한다고 하더라도, FutureBuilder의 캐싱 기능을 통해 기존의 데이터가 유지됨
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }

          if (snapshot.data == '위치 권한이 허가되었습니다') {
// 2. StreamBuilder : yield를 통해 받아오는 값의 변화가 있을 때마다 계속해서 값을 리턴함
// 새로운 위치가 yield 되면 snapshot.data가 바뀌기 때문에 builder가 다시 실행되고, streambuilder는 변경된 상태를 계속해서 리스닝하기 때문에 값을 받아올 수 있게 된다
            return StreamBuilder<Position>(
                stream: Geolocator.getPositionStream(),
                // 설정한 값이 변경될 때마다 stream값이 리턴된다
                // build가 될 때마다 getPositionStream이 타입의 값을 받아올 수 있다
                builder: (context, snapshot) {
                  // print(snapshot.data);
                  // Latitude: 37.566254 Longitude: 126.975775
                  // 움직일 때마다 Stream이 실행됨 -> Streambuilder가 Stream을 계속 리스닝하고 있기 때문
                  // 현재 위치가 바뀔 때마다 현재 위치가 100m 안에 드는지 계산해 준 후,서롤 다른 형태의 Circle 들을 _curtomGoogleMap에 넣어주면 된다

                  // 내가 원 안에 위치해 있으면 true, 그렇지 않으면 false
                  bool isWithinRange = false;
                  bool isOutofRange = true;
                  if (snapshot.hasData) {
                    final start = snapshot.data!;
                    final end = companyLatLng;

                    final distance = Geolocator.distanceBetween(
                      start.latitude,
                      start.longitude,
                      end.latitude,
                      end.longitude,
                    );
                    // 100m 이내라는 이야기
                    if (distance < okDistance) {
                      isWithinRange = true;
                      isOutofRange = false;
                    }
                  }
                  return Column(
                    children: [
                      _customGoogleMap(
                        initialPosition: initialPosition,
                        onMapCreated: onMapCreated,
                        circle: shiftDone
                            ? checkedCircle
                            : isWithinRange
                                ? withinDistanceCircle
                                : notWithinDistanceCircle,
                        marker: marker,
                      ),
                      _shiftButton(
                        isOutofRange: isOutofRange,
                        isWithinRange: isWithinRange,
                        onPressed: onShiftPressed,
                        shiftDone: shiftDone,
                      ),
                    ],
                  );
                });
          }
          return Center(
            child: Text(snapshot.data),
          );
        },
      ),
    );
  }

  onMapCreated(GoogleMapController controller) {
    // setState는 할 필요가 없다. controller가 생겼다고해서 화면에 반영할 게 없기 때문에
    // 만약에 controller의 값에 따라 화면의 UI가 다르게 보여진다면 그때는 setState가 필요한데
    // 그런 게 전혀 없기 때문에 필요 없다
    mapController = controller;
  }

  onShiftPressed() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('출근하기'),
          content: const Text('출근을 하시겠습니까'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('출근하기'),
            ),
          ],
        );
      },
    );
    if (result) {
      setState(() {
        shiftDone = true;
      });
    }
  }

  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      return '위치 서비스를 활성화 해주세요';
    }

// 현재 앱이 가지고 있는 위치 서비스 : denied, deniedForever, whileInUse, always
    LocationPermission checkedPermission = await Geolocator.checkPermission();

    if (checkedPermission == LocationPermission.denied) {
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        return '위치 권한을 허가해 주세요';
      }
    }

    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 설정창에서 허가해주세요';
    }

    return '위치 권한이 허가되었습니다';
  }
}

class _shiftButton extends StatelessWidget {
  final bool isOutofRange;
  final bool isWithinRange;
  final VoidCallback onPressed;
  final bool shiftDone;
  const _shiftButton({
    required this.isOutofRange,
    required this.isWithinRange,
    required this.onPressed,
    required this.shiftDone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.timelapse_outlined,
              size: 50.0,
              color: shiftDone
                  ? corrColor
                  : isWithinRange
                      ? primaryColor
                      : errorColor,
            ),
            const SizedBox(
              height: 20.0,
            ),
            // if (!shiftDone && isWithinRange)
            TextButton(
              onPressed: onPressed,
              child: !shiftDone && isWithinRange
                  ? const Text(
                      '출근하기',
                      style: TextStyle(fontSize: 20.0, color: primaryColor),
                    )
                  : isOutofRange
                      ? const Text(
                          '삐 -',
                          style: TextStyle(fontSize: 20.0, color: errorColor),
                        )
                      : const Text(
                          '출근완료',
                          style: TextStyle(fontSize: 20.0, color: corrColor),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

class _customGoogleMap extends StatelessWidget {
  const _customGoogleMap({
    Key? key,
    required this.initialPosition,
    required this.circle,
    required this.marker,
    required this.onMapCreated,
  }) : super(key: key);

  final CameraPosition initialPosition;
  final Circle circle;
  final Marker marker;
  final MapCreatedCallback onMapCreated;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GoogleMap(
        // 처음 구글 지도 시작했을 때 위치
        initialCameraPosition: initialPosition,
        // hybrid, normal, satellite, terrain
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        circles: Set.from([circle]),
        markers: Set.from([marker]),
        onMapCreated: onMapCreated,
      ),
    );
  }
}
