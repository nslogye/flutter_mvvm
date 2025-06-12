/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-06 10:51:44
 * @FilePath: /flutter_mvvm/library_base/lib/widget/shot_view.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShotView extends StatefulWidget {
  final Widget child;
  final ShotController? controller;

  const ShotView({super.key, required this.child, this.controller});

  @override
  ShotViewState createState() => ShotViewState();
}

class ShotViewState extends State<ShotView> {
  GlobalKey<_OverRepaintBoundaryState> globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.setGlobalKey(globalKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _OverRepaintBoundary(
      key: globalKey,
      child: RepaintBoundary(
        child: widget.child,
      ),
    );
  }
}

class _OverRepaintBoundary extends StatefulWidget {
  final Widget child;

  const _OverRepaintBoundary({super.key, required this.child});

  @override
  _OverRepaintBoundaryState createState() => _OverRepaintBoundaryState();
}

class _OverRepaintBoundaryState extends State<_OverRepaintBoundary> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class ShotController {
  late GlobalKey<_OverRepaintBoundaryState> globalKey;

  Future<Uint8List> makeImageUint8List() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    // 这个可以获取当前设备的像素比
    var dpr = ui.window.devicePixelRatio;
    ui.Image image = await boundary.toImage(pixelRatio: dpr);
    ByteData byteData = await (image.toByteData(format: ui.ImageByteFormat.png)
        as Future<ByteData>);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    return pngBytes;
  }

  setGlobalKey(GlobalKey<_OverRepaintBoundaryState> globalKey) {
    this.globalKey = globalKey;
  }
}
