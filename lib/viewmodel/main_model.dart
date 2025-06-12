/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 18:41:32
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-03 18:42:57
 * @FilePath: /flutter_mvvm/lib/viewmodel/main_model.dart
//  * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:library_base/event/event.dart';
import 'package:library_base/event/main_jump_event.dart';
import 'package:library_base/event/user_event.dart';
import 'package:library_base/mvvm/base_page.dart';
import 'package:library_base/router/routers.dart';

class MainModel extends ValueNotifier<int> {
  late BuildContext context;
  late PageController pageController;
  List<GlobalKey<BasePageMixin>>? keyList;

  StreamSubscription? userSubscription;
  StreamSubscription? mainJumpSubscription;

  MainModel() : super(0);

  void listenEvent(BuildContext context, PageController pageController,
      List<GlobalKey<BasePageMixin>>? keyList) {
    this.context = context;
    this.pageController = pageController;
    this.keyList = keyList;

    userSubscription?.cancel();
    mainJumpSubscription?.cancel();

    userSubscription = Event.eventBus.on<UserEvent>().listen((event) {
      if (event.state == UserEventState.logout) {
        Routers.navigateTo(this.context, Routers.loginPage);
      }
    });

    mainJumpSubscription = Event.eventBus.on<MainJumpEvent>().listen((event) {
      if (event.page.value >= 0) {
        this.pageController.jumpToPage(event.page.value);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          this
              .keyList![event.page.value]
              .currentState
              ?.jump(params: event.params);
        });
      }
    });
  }

  @override
  void dispose() {
    userSubscription?.cancel();
    mainJumpSubscription?.cancel();
    super.dispose();
  }
}
