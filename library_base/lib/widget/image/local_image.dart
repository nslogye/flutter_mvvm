/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-26 11:46:27
 * @FilePath: /flutter_mvvm/library_base/lib/widget/image/local_image.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/utils/image_util.dart';

/// 加载本地资源图片
class LocalImage extends StatelessWidget {
  const LocalImage(this.image,
      {super.key,
      this.package,
      this.width,
      this.height,
      this.cacheWidth,
      this.cacheHeight,
      this.fit,
      this.format = ImageFormat.png,
      this.color,
      this.gaplessPlayback = false});

  final String image;
  final String? package;
  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? fit;
  final ImageFormat format;
  final Color? color;
  final bool gaplessPlayback;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageUtil.getImgPath(image, format: format),
      package: package,
      height: height,
      width: width,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      color: color,

      /// 忽略图片语义
      excludeFromSemantics: true,
      gaplessPlayback: gaplessPlayback,
    );
  }
}
