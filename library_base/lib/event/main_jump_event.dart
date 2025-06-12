/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:37:34
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 14:02:34
 * @FilePath: /flutter_mvvm/library_base/lib/event/main_jump_event.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
class MainJumpEvent {
  MainJumpPage page;
  Map<String, dynamic>? params;

  MainJumpEvent(this.page, {this.params});
}

enum MainJumpPage { home, otc, mine }

extension MainJumpPageExtension on MainJumpPage {
  int get value => [0, 1, 2][index];
}
