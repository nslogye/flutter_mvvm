/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 18:41:15
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-11 15:53:02
 * @FilePath: /flutter_mvvm/lib/page/main_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_base/constant/constant.dart';
import 'package:library_base/generated/l10n.dart';
import 'package:library_base/global/rt_account.dart';
import 'package:library_base/mvvm/base_page.dart';
import 'package:library_base/mvvm/provider_widget.dart';
import 'package:library_base/utils/device_util.dart';
import 'package:library_base/utils/log_util.dart';
import 'package:library_base/utils/object_util.dart';
import 'package:library_base/widget/double_tap_back_exit_app.dart';
import 'package:library_base/net/websocket_util.dart';
import 'package:library_base/res/colors.dart';
import 'package:library_base/res/dimens.dart';
import 'package:library_base/router/parameters.dart';
import 'package:library_base/router/routers.dart';
import 'package:library_base/widget/image/frame_animation_image.dart';
import 'package:library_base/widget/image/local_image.dart';
import 'package:flutter_mvvm/viewmodel/main_model.dart';
import 'package:uni_links/uni_links.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage>
    with WidgetsBindingObserver, BasePageMixin<MainPage> {
  StreamSubscription? _sub;
  static const double _imageSize = 25.0;

  List<GlobalKey<BasePageMixin>>? _keyList;
  late List<String> _appBarTitles;
  late List<Widget> _pageList;
  List<BottomNavigationBarItem>? _bottomBarItemList;

  late MainModel _mainModel;

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    initView();
    initViewModel();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      LogUtil.v('应用进入前台 resumed');
      WebSocketUtil().openSocket();
    } else if (state == AppLifecycleState.paused) {
      LogUtil.v('应用进入后台 paused');
      WebSocketUtil().closeSocket();
    } else if (state == AppLifecycleState.inactive) {
      LogUtil.v('应用进入非活动状态 inactive');
    } else if (state == AppLifecycleState.detached) {
      LogUtil.v('应用进入 detached 状态 detached');
    }
  }

  @override
  void dispose() {
    if (_sub != null) _sub!.cancel();
    _pageController.dispose();
    imageCache.clear();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void initView() {
    _appBarTitles = [S.current.home, S.current.otc, S.current.mine];
    _keyList = [
      GlobalKey<BasePageMixin>(debugLabel: _appBarTitles[0]),
      GlobalKey<BasePageMixin>(debugLabel: _appBarTitles[1]),
      GlobalKey<BasePageMixin>(debugLabel: _appBarTitles[2]),
    ];
    _pageList = [
      Routers.generatePage(context, Routers.homePage,
          parameters: Parameters()..putObj('key', _keyList![0]))!,
      Routers.generatePage(context, Routers.otcPage,
          parameters: Parameters()..putObj('key', _keyList![1]))!,
      Routers.generatePage(context, Routers.minePage,
          parameters: Parameters()..putObj('key', _keyList![2]))!,
    ];
  }

  void initViewModel() {
    if (Constant.isReleaseMode) WebSocketUtil.initWS();
    _mainModel = MainModel();
    _mainModel.listenEvent(context, _pageController, _keyList);
  }

  List<BottomNavigationBarItem>? _buildBottomNavigationBarItem() {
    if (_bottomBarItemList == null) {
      List<List<Widget>> tabImages = [
        [
          const LocalImage('tab_home_nor',
              gaplessPlayback: true,
              width: _imageSize,
              color: Colours.unselected_item_color),
          const LocalImage('tab_home_sel',
              gaplessPlayback: true,
              width: _imageSize,
              color: Colours.selected_item_color),
        ],
        [
          const LocalImage('tab_otc_nor',
              gaplessPlayback: true,
              width: _imageSize,
              color: Colours.unselected_item_color),
          const LocalImage('tab_otc_sel',
              gaplessPlayback: true,
              width: _imageSize,
              color: Colours.selected_item_color),
        ],
        [
          const LocalImage('tab_user_nor',
              gaplessPlayback: true,
              width: _imageSize,
              color: Colours.unselected_item_color),
          const LocalImage('tab_user_sel',
              gaplessPlayback: true,
              width: _imageSize,
              color: Colours.selected_item_color),
        ]
      ];

      _bottomBarItemList = List.generate(tabImages.length, (i) {
        return BottomNavigationBarItem(
          icon: Container(
              margin: const EdgeInsets.only(bottom: 3), child: tabImages[i][0]),
          activeIcon: Container(
              margin: const EdgeInsets.only(bottom: 3), child: tabImages[i][1]),
          label: _appBarTitles[i],
        );
      });
    }
    return _bottomBarItemList;
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<MainModel>(
      model: _mainModel,
      builder: (context, model, child) {
        return DoubleTapBackExitApp(
          child: Scaffold(
              bottomNavigationBar: Theme(
                  data: ThemeData(
                      brightness: Brightness.light,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent),
                  child: BottomNavigationBar(
                    backgroundColor: Colours.white,
                    items: _buildBottomNavigationBarItem()!,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: model.value,
                    elevation: 5.0,
                    iconSize: 24.0,
                    selectedFontSize: Dimens.font_sp10,
                    unselectedFontSize: Dimens.font_sp10,
                    selectedItemColor: Theme.of(context).primaryColor,
                    unselectedItemColor: Colours.unselected_item_color,
                    onTap: (index) {
                      if (model.value == index) {
                        _keyList![index].currentState?.refresh();
                      } else {
                        if (index == 2) {
                          if (!RTAccount().isLogin()) {
                            Routers.navigateTo(context, Routers.loginPage,
                                parameters: null);
                          } else {
                            _pageController.jumpToPage(index);
                          }
                        } else {
                          _pageController.jumpToPage(index);
                        }
                      }
                    },
                  )),
              // 使用PageView的原因参看 https://zhuanlan.zhihu.com/p/58582876
              body: PageView(
                physics: const NeverScrollableScrollPhysics(), // 禁止滑动
                controller: _pageController,
                onPageChanged: (int index) => _mainModel.value = index,
                children: _pageList,
              )),
        );
      },
    );
  }
}
