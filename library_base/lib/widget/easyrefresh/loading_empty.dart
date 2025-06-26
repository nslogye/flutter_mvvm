/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-26 11:54:23
 * @FilePath: /flutter_mvvm/library_base/lib/widget/easyrefresh/loading_empty.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/constant/constant.dart';
import 'package:library_base/generated/l10n.dart';
import 'package:library_base/res/styles.dart';
import 'package:library_base/widget/image/local_image.dart';

class LoadingEmpty extends StatelessWidget {
  final String? text;
  final String? image;

  const LoadingEmpty({super.key, this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: LocalImage(image ?? 'img_nodata', package: Constant.baseLib),
          ),
          Text(
            text ?? S.of(context).noData,
            style: TextStyles.textGray400_w400_14,
          ),
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
