/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 18:41:42
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-10 16:00:31
 * @FilePath: /flutter_mvvm/lib/viewmodel/splash_model.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:library_base/event/event.dart';
import 'package:library_base/event/user_event.dart';
import 'package:library_base/mvvm/view_state_model.dart';
import 'package:library_base/net/apis.dart';
import 'package:library_base/net/dio_util.dart';
import 'package:library_base/model/account.dart';
import 'package:library_base/global/rt_account.dart';
import 'package:library_base/utils/object_util.dart';

/// 启动页Model，可以做一些初始化工作
/// 比如：获取本地配置、用户登录信息、APP版本更新检查等等
class SplashModel extends ViewStateModel {
  Account? loginResult;

  SplashModel();
  Future autoLogin() async {
    // 设置页面状态success
    setSuccess();
  }
  // Future autoLogin() {
  //   Account? account = RTAccount().loadAccount();
  //   if (account == null) {
  //     setError(Apis.ERRNO_UNKNOWN, message: Apis.ERRNO_UNKNOWN_MESSAGE);
  //     return Future.value();
  //   }

  //   if (ObjectUtil.isEmpty(account.token)) {
  //     setError(Apis.ERRNO_UNKNOWN, message: Apis.ERRNO_UNKNOWN_MESSAGE);
  //     return Future.value();
  //   }

  //   RTAccount().setActiveAccount(account);

  //   return DioUtil.getInstance()!.requestNetwork(
  //       Apis.URL_GET_ACCOUNT_INFO, "get", params: {}, cancelToken: cancelToken,
  //       onSuccess: (dynamic data) {
  //     loginResult = Account.fromJson(data);
  //     loginResult!.token = account.token;

  //     //account.token = headers.value(Apis.KEY_USER_TOKEN);
  //     RTAccount().setActiveAccount(loginResult);
  //     RTAccount().saveAccount();

  //     setSuccess();
  //     Event.eventBus.fire(UserEvent(loginResult, UserEventState.login));
  //   }, onError: (errno, msg) {
  //     loginResult = null;
  //     setError(errno!, message: msg);
  //   });
  // }
}
