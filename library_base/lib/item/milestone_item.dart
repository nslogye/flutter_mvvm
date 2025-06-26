/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-23 14:28:23
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-25 14:47:08
 * @FilePath: /flutter_mvvm/library_base/lib/item/milestone_item.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/res/colors.dart';
import 'package:library_base/res/styles.dart';
import 'package:library_base/utils/date_util.dart';

class MileStoneItem extends StatelessWidget {
  final int index;
  final String content;
  final String time;
  final bool isLast;

  const MileStoneItem({
    super.key,
    required this.index,
    required this.content,
    required this.time,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 80,
                padding: const EdgeInsets.fromLTRB(20, 22, 0, 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                          DateUtil.getDateStrByTimeStr(time,
                                  format: DateFormat.YEAR_ONLY) ??
                              '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.textGray400_w400_12),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 3.0),
                      child: Text(
                          DateUtil.getDateStrByTimeStr(time,
                                  format: DateFormat.MONTH_DAY,
                                  dateSeparate: '/') ??
                              '',
                          style: TextStyles.textGray800_w700_15),
                    ),
                  ],
                )),
            SizedBox(
              height: double.infinity,
              child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                SizedBox(
                  width: 0.6,
                  height: 26,
                  child: index == 0
                      ? null
                      : const VerticalDivider(
                          width: 0.6, color: Colours.gray_200),
                ),
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    color: Colours.gray_200,
                  ),
                ),
                const Expanded(
                  child: VerticalDivider(width: 0.6, color: Colours.gray_200),
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 18, isLast ? 20 : 6),
                child: Text((content),
                    strutStyle: const StrutStyle(
                        forceStrutHeight: true, height: 1.2, leading: 0.5),
                    style: TextStyles.textGray800_w400_15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
