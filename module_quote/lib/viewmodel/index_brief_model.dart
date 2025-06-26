/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-20 18:56:45
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-23 14:24:01
 * @FilePath: /flutter_mvvm/module_quote/lib/viewmodel/index_brief_model.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:async';

import 'package:library_base/mvvm/view_state.dart';
import 'package:library_base/mvvm/view_state_model.dart';
import 'package:library_base/net/apis.dart';
import 'package:library_base/net/dio_util.dart';
import 'package:library_base/model/friend_link.dart';
import 'package:library_base/model/milestone.dart';
import 'package:module_quote/model/index_brief.dart';

class IndexBriefModel extends ViewStateModel {
  List<IndexBrief> briefList = [];
  List<FriendLink> friendLinkList = [];
  List<MileStone> milestoneList = [];

  IndexBriefModel() : super(viewState: ViewState.first);

  Future getBrief(String chain) {
    Map<String, dynamic> params = {
      'chain': chain,
    };

    return DioUtil.getInstance()!.requestNetwork(
        Apis.URL_GET_CHAIN_DETAIL, 'get',
        params: params, cancelToken: cancelToken, onSuccess: (dynamic data) {
      briefList = IndexBrief.fromJsonList(data['chain_detail']) ?? [];
      friendLinkList = FriendLink.fromJsonList(data['friend_link']) ?? [];
      milestoneList = MileStone.fromJsonList(data['milestone']) ?? [];

      setSuccess();
    }, onError: (errno, msg) {
      setError(errno!, message: msg);
    });
  }
}
