/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:45:23
 * @FilePath: /flutter_mvvm/library_base/lib/widget/clickbar/setting_avatar_clickbar.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/constant/constant.dart';
import 'package:library_base/res/colors.dart';
import 'package:library_base/res/styles.dart';
import 'package:library_base/utils/image_util.dart';
import 'package:library_base/widget/image/circle_image.dart';

/// 列表项
class SettingAvatarClickBar extends StatefulWidget {
  // 标题
  final String title;

  final String? iconUrl;

  // 点击事件
  final Function()? onPressed;

  final OutlinedBorder? shape;
  // 构造函数
  const SettingAvatarClickBar({
    super.key,
    required this.title,
    this.iconUrl,
    this.onPressed,
    this.shape,
  });

  @override
  SettingAvatarClickBarState createState() => SettingAvatarClickBarState();
}

class SettingAvatarClickBarState extends State<SettingAvatarClickBar> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        shape: widget.shape,
        backgroundColor: Colours.white,
      ),
      onPressed: widget.onPressed,
      child: Container(
          height: 70.0,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 16, right: 16),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.6, color: Colours.default_line))),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  widget.title,
                  style: TextStyles.textGray800_w400_16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 5),
                alignment: Alignment.centerRight,
                child: CircleImage(
                  widget.iconUrl ?? '',
                  radius: 23,
                  borderWidth: 0,
                  borderColor: Colours.white,
                  placeholderImage: DecorationImage(
                    image: AssetImage(ImageUtil.getImgPath('icon_default_head'),
                        package: Constant.baseLib),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              widget.onPressed != null
                  ? const Icon(Icons.keyboard_arrow_right,
                      color: Colours.gray_200, size: 24)
                  : Container(),
            ],
          )),
    );
  }
}
