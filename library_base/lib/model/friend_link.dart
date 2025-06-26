/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-23 14:23:54
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-23 14:23:56
 * @FilePath: /flutter_mvvm/library_base/lib/model/friend_link.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:library_base/utils/object_util.dart';

class FriendLink {
  String? name;
  String? url;
  String? ico;

  FriendLink({
    this.name,
    this.url,
    this.ico,
  });

  FriendLink.fromJson(Map<String, dynamic> jsonMap) {
    name = jsonMap['name'] ?? '';
    url = jsonMap['url'] ?? '';
    ico = jsonMap['ico'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = new Map<String, dynamic>();
    jsonMap['name'] = this.name;
    jsonMap['url'] = this.url;
    jsonMap['ico'] = this.ico;

    return jsonMap;
  }

  static List<FriendLink>? fromJsonList(List<dynamic> mapList) {
    if (ObjectUtil.isEmptyList(mapList)) {
      return null;
    }

    List<FriendLink> items = [];
    for (Map<String, dynamic> map in mapList) {
      items.add(FriendLink.fromJson(map));
    }
    return items;
  }
}
