/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:36:40
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-10 14:35:40
 * @FilePath: /flutter_mvvm/lib/init/default_app.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:library_base/constant/app_config.dart';
import 'package:library_base/generated/l10n.dart';
import 'package:library_base/global/locale_provider.dart';
import 'package:library_base/global/theme_provider.dart';
import 'package:library_base/mvvm/provider_widget.dart';
import 'package:library_base/router/app_analysis.dart';
import 'package:library_base/router/routers.dart';
import 'package:library_base/utils/device_util.dart';
import 'package:library_base/utils/log_util.dart';
import 'package:library_base/utils/orientation_helper.dart';
import 'package:library_base/utils/refresh_util.dart';
import 'package:library_base/utils/sp_util.dart';
import 'package:library_base/utils/toast_util.dart';
import 'package:flutter_mvvm/main_router.dart';
import 'package:flutter_mvvm/page/splash_page.dart';
import 'package:module_home/home_router.dart';
import 'package:module_login/login_router.dart';
import 'package:module_otc/otc_router.dart';
import 'package:module_user/uers_router.dart';
// import 'package:module_info/info_router.dart';
// import 'package:module_mine/mine_router.dart';
// import 'package:module_quote/quote_router.dart';
// import 'package:module_money/money_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:umeng_common_sdk/umeng_common_sdk.dart';

class DefaultApp {
  //运行app
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();

    await initApp();

    runApp(MyApp());
  }

  //程序初始化操作
  static Future<void> initApp() async {
    LogUtil.init(isDebug: AppConfig.isTestEnvironment);

    if (DeviceUtil.isAndroid) {
      // 透明状态栏
      const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    await SPUtil.init();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //强制竖屏
    OrientationHelper.setPreferredOrientations([DeviceOrientation.portraitUp]);
    OrientationHelper.forceOrientation(DeviceOrientation.portraitUp);
    Routers.init(
        [MainRouter(), HomeRouter(), LoginRouter(), UserRouter(), OTCRouter()]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget2(
        model1: ThemeProvider(),
        model2: LocaleProvider(SPUtil.getString(SPUtil.key_locale)),
        builder: (context, dynamic themeProvider, dynamic localeModel, _) {
          Widget child = MaterialApp(
            title: 'flutter_mvvm',
            home: const SplashPage(),
            theme: themeProvider.getThemeData(),
            darkTheme: themeProvider.getThemeData(isDarkMode: true),
            themeMode: themeProvider.getThemeMode(),
            onGenerateRoute: Routers.router!.generator,
            navigatorObservers: [AppAnalysis()],
            locale: localeModel.getLocale(),
            localizationsDelegates: const [
              S.delegate,
              RefreshLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            localeResolutionCallback:
                (Locale? locale, Iterable<Locale> supportedLocales) {
              if (localeModel.getLocale() != null) {
                //如果已经选定语言，则不跟随系统
                return localeModel.getLocale();
              } else {
                //跟随系统
                if (S.delegate.isSupported(locale!)) {
                  return locale;
                }
                return supportedLocales.first;
              }
            },
            builder: (context, widget) {
              return MediaQuery(
                //设置文字大小不随系统设置改变
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: widget!,
              );
            },
          );

          return ToastUtil.init(RefreshUtil.init(child));
        });
  }
}
