/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-26 11:54:30
 * @FilePath: /flutter_mvvm/library_base/lib/widget/easyrefresh/skeleton_list.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonList extends StatelessWidget {
  /// 需要展示的个数, 充满屏幕即可
  final int count;
  final EdgeInsetsGeometry padding;
  final IndexedWidgetBuilder builder;

  const SkeletonList(
      {super.key,
      this.padding = const EdgeInsets.all(0),
      this.count = 10,
      required this.builder});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    bool isDark = theme.brightness == Brightness.dark;

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 1500),
        baseColor: isDark ? Colors.grey[700]! : Colors.grey[350]!,
        highlightColor: isDark ? Colors.grey[500]! : Colors.grey[200]!,
        child: Padding(
          padding: padding,
          child: Column(
            children: List.generate(count, (index) => builder(context, index)),
          ),
        ),
      ),
    );
  }
}

class SkeletonContainer extends StatelessWidget {
  final double width;
  final double height;
  final bool isCircle;

  const SkeletonContainer(
      {super.key,
      required this.width,
      required this.height,
      this.isCircle = false});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Divider.createBorderSide(context, width: 0.5);
    return Container(
      width: width,
      height: height,
      decoration: SkeletonDecoration(isCircle: isCircle, isDark: isDark),
    );
  }
}

class SkeletonDecoration extends BoxDecoration {
  SkeletonDecoration({
    isCircle = false,
    isDark = false,
  }) : super(
          color: !isDark ? Colors.grey[350] : Colors.grey[700],
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        );
}
