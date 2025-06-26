/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-20 18:56:45
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-25 16:14:31
 * @FilePath: /flutter_mvvm/module_quote/lib/model/index_brief.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:library_base/utils/object_util.dart';

class IndexBrief {
  String? key;
  String? title;
  String? value;
  String? detail;
  int? type;

  IndexBrief({
    this.key,
    this.title,
    this.value,
    this.detail,
    this.type,
  });

  IndexBrief.fromJson(Map<String, dynamic> jsonMap) {
    key = jsonMap['key'] ?? '';
    title = jsonMap['title'] ?? '';
    value = jsonMap['value'] ?? '';
    detail = jsonMap['detail'] ?? '';
    type = jsonMap['type'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = <String, dynamic>{};
    jsonMap['key'] = key;
    jsonMap['title'] = title;
    jsonMap['value'] = value;
    jsonMap['detail'] = detail;
    jsonMap['type'] = type;

    return jsonMap;
  }

  static List<IndexBrief>? fromJsonList(List<dynamic> mapList) {
    if (ObjectUtil.isEmptyList(mapList)) {
      return null;
    }

    List<IndexBrief> items = [];
    for (Map<String, dynamic> map in mapList) {
      items.add(IndexBrief.fromJson(map));
    }
    return items;
  }
}
