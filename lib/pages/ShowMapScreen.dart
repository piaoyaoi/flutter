import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:amap_core_fluttify/amap_core_fluttify.dart';
import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:permission_handler/permission_handler.dart';

/**
 * ShowMapScreen
 * 地图缩放
 * 标注
 */
class ShowMapScreen extends StatefulWidget {
  @override
  _ShowMapScreenState createState() => _ShowMapScreenState();
}

class _ShowMapScreenState extends State<ShowMapScreen> {
  @override
  initState() {
    AmapService.init(androidKey: '5d25928ef6db03b66a9a612060c5e003');
    super.initState();
  }

  Location _location;
  List<MarkerOption> markers = [];
  @override
  Widget build(BuildContext context) {
    return AmapView(
      // 地图类型 (可选)
      mapType: MapType.Standard,
      // 是否显示缩放控件 (可选)
      showZoomControl: true,
      // 是否显示指南针控件 (可选)
      showCompass: true,
      // 是否显示比例尺控件 (可选)
      showScaleControl: true,
      // 是否使能缩放手势 (可选)
      zoomGesturesEnabled: true,
      // 是否使能滚动手势 (可选)
      scrollGesturesEnabled: true,
      // 是否使能旋转手势 (可选)
      rotateGestureEnabled: true,
      // 是否使能倾斜手势 (可选)
      tiltGestureEnabled: true,
      // 缩放级别 (可选)
      zoomLevel: 19,
      // 中心点坐标 (可选)
      centerCoordinate: LatLng(39, 116),
      // 标记 (可选)
      markers: markers,
      // 标识点击回调 (可选)
      onMarkerClicked: (Marker marker) {},
      // 地图点击回调 (可选)
//      onMapClicked: (LatLng coord) {},
      onMapClicked: addMark,
      // 地图拖动开始 (可选)
      onMapMoveStart: (MapMove move) {},
      // 地图拖动结束 (可选)
      onMapMoveEnd: (MapMove move) {},
      // 地图创建完成回调 (可选)
      onMapCreated: (controller) async {
        // requestPermission是权限请求方法, 需要你自己实现
        // 如果不知道怎么处理, 可以参考example工程的实现, example工程依赖了`permission_handler`插件.
        await Permission.location.request();
        await controller.showMyLocation(MyLocationOption(
            show: true,
            myLocationType: MyLocationType.Follow,
            fillColor: Color(1),
            strokeColor: Color(1)));
      },
    );
  }
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(title: const Text('Plugin example app')),
//        body: DecoratedColumn(
//          padding: EdgeInsets.symmetric(horizontal: kSpaceLarge),
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            RaisedButton(
//              child: Text('获取单次定位'),
//              onPressed: () async {
//                await Permission.location.request();
//                final location = await AmapLocation.fetchLocation();
//                setState(() => _location = location);
//              },
//            ),
//            RaisedButton(
//              child: Text('获取连续定位'),
//              onPressed: () async {
//                await Permission.location.request();
//                await for (final location in AmapLocation.listenLocation()) {
//                  setState(() => _location = location);
//                }
//              },
//            ),
//            RaisedButton(
//              child: Text('停止定位'),
//              onPressed: () async {
//                await Permission.location.request();
//                await AmapLocation.stopLocation();
//                setState(() => _location = null);
//              },
//            ),
//            if (_location != null)
//              Center(
//                child: Text(
//                  _location.toString(),
//                  textAlign: TextAlign.center,
//                ),
//              ),
//          ],
//        ),
//      ),
//    );
//  }

  Future<void> addMark(LatLng latLng) {
    setState(() {
      markers.add(MarkerOption(latLng: latLng, title: '测试'));
    });
  }
}

//@override
//void dispose() {
//  super.dispose();
//}

//是否开启权限
void checkPersmission() async {}

//判空
bool isNotEmpty(var text) {
  if (text == null ||
      text.toString().isEmpty ||
      text.toString() == 'null' ||
      text.toString() == null) {
    return false;
  } else {
    return true;
  }
}

//提示框
getFloat(String text) {
//    FlutterToast.showToast(
////        : text,
////        toastLength: Toast.LENGTH_SHORT,
////        gravity: ToastGravity.CENTER,
////        timeInSecForIosWeb: 2,
////        fontSize: 16.0, child: null);
}
