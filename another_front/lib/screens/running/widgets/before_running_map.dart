import 'dart:async';

import 'package:another/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class BeforeRunningMap extends StatefulWidget {
  const BeforeRunningMap({Key? key}) : super(key: key);

  @override
  State<BeforeRunningMap> createState() => _BeforeRunningMapState();
}

class _BeforeRunningMapState extends State<BeforeRunningMap> {
  late Timer _timer;
  // 지도관련
  GoogleMapController? mapController;
  onMapCreated(GoogleMapController controller) {
    print("지도 controller 및 onMapCreated");
    mapController = controller;
    mapController?.setMapStyle(
        '''[
          {"featureType": "administrative.land_parcel", "elementType": "labels", "stylers": [{"visibility": "off"}]},
          {"featureType": "poi", "elementType": "labels.text", "stylers": [{"visibility": "off"}]},
          {"featureType": "poi", "elementType": "labels.icon", "stylers": [{"visibility": "off"}]},
          {"featureType": "poi.business", "stylers": [{"visibility": "off"}]},
          {"featureType": "road", "elementType": "labels.icon", "stylers": [{"visibility": "off"}]},
          {"featureType": "road", "elementType": "labels", "stylers": [{"visibility": "off"}]},
          {"featureType": "road.local", "elementType": "labels", "stylers": [{"visibility": "off"}]},
          {"featureType": "transit", "stylers": [{"visibility": "off"}]},
        ]'''
    );
  }
  bool isLoading = false;
  static late CameraPosition currentPosition;

  @override
  void initState() {
    print("initstate");
    super.initState();
    if (mounted) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
        getCurrentLocation();
        print("1초마다 돈다~");
      });
    }
  }
  @override
  void dispose() {
    print("dispose");
    mapController!.dispose();
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print("build");
    return
      isLoading ?
      GoogleMap(
      initialCameraPosition: currentPosition,
      mapType: MapType.normal,
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: onMapCreated,
    )
    : Center(child: CircularProgressIndicator());
  }
  void getCurrentLocation() async {
    // // 위치 정보 권한 요청
    // final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!isLocationEnabled) {
    //   return ;
    // }
    // LocationPermission checkedPermission = await Geolocator.checkPermission();
    // if (checkedPermission == LocationPermission.denied) {
    //   checkedPermission = await Geolocator.requestPermission();
    //   if (checkedPermission == LocationPermission.denied) {
    //     return ;
    //   }
    //   print('$checkedPermission================================');
    // }
    // if (checkedPermission == LocationPermission.deniedForever) {
    //   return ;
    // }

    PermissionStatus backgroundStatus = await Permission.locationAlways.request();

    PermissionStatus locationStatus = await Permission.location.request();

    if (locationStatus == PermissionStatus.granted) {
      // 위치 권한이 허용된 경우
      // 백그라운드 위치 권한 요청
      PermissionStatus backgroundStatus = await Permission.locationAlways.request();

      if (backgroundStatus == PermissionStatus.granted) {
        // 백그라운드 위치 권한이 허용된 경우
        // 원하는 작업 수행
      }
    }
    // 위치 권한 완료
    if (mounted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      currentPosition = CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 17);
      if (position != null && isLoading == false) {
        setTrue();
      }
      changeCamera(position);
    }
    return ;
  }
  void setTrue() {
    setState(() {
      print("is로딩이냐?");
      isLoading = true;
    });
  }
  void changeCamera(position) {
    print("카메라냐??");
    currentPosition = CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 17);
    isLoading = true;
    if (mapController != null && currentPosition != Provider.of<RunningData>(context, listen: false).currentPosition) {
      print("돌았다!");
      mapController!.animateCamera(
          CameraUpdate.newCameraPosition(currentPosition)
      );
      Provider.of<RunningData>(context, listen: false).setCurrentPosition(currentPosition);
    }
  }
}
