/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 14:22:52
 * @FilePath: /flutter_mvvm/library_base/lib/net/base/entry_factory.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
class EntityFactory {
  static T? generateOBJ<T>(json) {
    if (json == null) {
      return null;
    } else if (T.toString() == 'String') {
      return json.toString() as T;
    } else {
      return json as T;
    }
  }
}
