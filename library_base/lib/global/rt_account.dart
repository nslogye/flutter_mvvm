/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:37:45
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:21:18
 * @FilePath: /flutter_mvvm/library_base/lib/global/rt_account.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:convert';

import 'package:library_base/event/event.dart';
import 'package:library_base/event/user_event.dart';
import 'package:library_base/model/account.dart';
import 'package:library_base/utils/object_util.dart';
import 'package:library_base/utils/sp_util.dart';

class RTAccount {
  // 静态私有实例
  static final RTAccount _instance = RTAccount._internal();
  // 工厂方法返回单例实例
  factory RTAccount() {
    return _instance;
  }
  // 私有构造函数
  RTAccount._internal();
  // 激活的账户信息
  Account? _activeAccount;
  // 获取账号信息
  Account? getActiveAccount() => _activeAccount;
// 设置账号信息
  setActiveAccount(Account? account) {
    _activeAccount = account;
  }

  bool isLogin() {
    return _activeAccount != null;
  }

  void logout() {
    if (_activeAccount != null) {
      _activeAccount!.token = '';
      saveAccount();

      _activeAccount = null;
    }

    Event.eventBus.fire(UserEvent(null, UserEventState.logout));
  }

  saveAccount() async {
    await SPUtil.putString(
        SPUtil.key_latest_account, json.encode(_activeAccount?.toLocalJson()));
  }

  Account? loadAccount() {
    String jsonString =
        SPUtil.getString(SPUtil.key_latest_account, defValue: '');

    if (ObjectUtil.isEmptyString(jsonString)) {
      return null;
    }

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return Account.fromLocalJson(jsonMap);
  }
}
