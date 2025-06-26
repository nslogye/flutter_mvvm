/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-23 14:24:19
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-23 14:24:21
 * @FilePath: /flutter_mvvm/library_base/lib/model/milestone.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:library_base/utils/object_util.dart';

class MileStone {
  String? content;
  String? date;

  MileStone({
    this.content,
    this.date,
  });

  MileStone.fromJson(Map<String, dynamic> jsonMap) {
    content = jsonMap['content'] ?? '';
    date = jsonMap['date'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = new Map<String, dynamic>();
    jsonMap['content'] = this.content;
    jsonMap['created_at'] = this.date;

    return jsonMap;
  }

  static List<MileStone>? fromJsonList(List<dynamic> mapList) {
    if (ObjectUtil.isEmptyList(mapList)) {
      return null;
    }

    List<MileStone> items = [];
    for (Map<String, dynamic> map in mapList) {
      items.add(MileStone.fromJson(map));
    }
    return items;
  }
}
