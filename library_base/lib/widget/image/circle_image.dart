/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-26 11:50:38
 * @FilePath: /flutter_mvvm/library_base/lib/widget/image/circle_image.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_base/res/colors.dart';

class CircleImage extends StatelessWidget {
  const CircleImage(this.imageUrl,
      {super.key,
      required this.radius,
      this.fit = BoxFit.cover,
      this.borderColor = Colours.white,
      this.borderWidth = 1,
      this.placeholderImage,
      this.boxShadow});

  final String imageUrl;
  final double radius;
  final BoxFit fit;
  final Color borderColor;
  final double borderWidth;
  final DecorationImage? placeholderImage;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: radius * 2,
      width: radius * 2,
      imageUrl: imageUrl,
      fit: fit,
      imageBuilder: (context, imageProvider) => Container(
        height: radius * 2,
        width: radius * 2,
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          borderRadius: BorderRadius.all(Radius.circular(radius + 5)),
          border: Border.all(
              color: borderColor, width: borderWidth, style: BorderStyle.solid),
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: Border.all(
              color: borderColor, width: borderWidth, style: BorderStyle.solid),
          color: Colours.gray_200,
        ),
      ),
      errorWidget: (_, __, dynamic error) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: Border.all(
              color: borderColor, width: borderWidth, style: BorderStyle.solid),
          color: Colours.gray_200,
          image: placeholderImage,
        ),
      ),
    );
  }
}
