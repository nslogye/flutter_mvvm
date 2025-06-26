/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-26 11:50:02
 * @FilePath: /flutter_mvvm/library_base/lib/widget/image/frame_animation_image.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

class FrameAnimationImage extends StatefulWidget {
  final List<String> assetList;
  final double? width;
  final double? height;
  final int interval;
  final bool repeat;

  const FrameAnimationImage(this.assetList,
      {super.key,
      this.width,
      this.height,
      this.interval = 25,
      this.repeat = false});

  @override
  State<StatefulWidget> createState() {
    return _FrameAnimationImageState();
  }
}

class _FrameAnimationImageState extends State<FrameAnimationImage>
    with SingleTickerProviderStateMixin {
  // 动画控制
  late Animation<double> _animation;
  late AnimationController _controller;
  int interval = 25;

  @override
  void initState() {
    super.initState();

    interval = widget.interval;
    final int imageCount = widget.assetList.length;
    final int maxTime = interval * imageCount;

    // 启动动画controller
    _controller = new AnimationController(
        duration: Duration(milliseconds: maxTime), vsync: this);
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed && widget.repeat) {
        _controller.forward(from: 0.0); // 完成后重新开始
      }
    });

    _animation = Tween<double>(begin: 0, end: imageCount.toDouble() - 1)
        .animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int ix = _animation.value.floor() % widget.assetList.length;

    List<Widget> images = [];
    // 把所有图片都加载进内容，否则每一帧加载时会卡顿
    for (int i = 0; i < widget.assetList.length; ++i) {
      if (i != ix) {
        images.add(Image.asset(
          widget.assetList[i],
          width: 0,
          height: 0,
          gaplessPlayback: true,
        ));
      }
    }

    images.add(Image.asset(
      widget.assetList[ix],
      width: widget.width,
      height: widget.height,
      gaplessPlayback: true,
    ));

    return Stack(alignment: AlignmentDirectional.center, children: images);
  }
}
