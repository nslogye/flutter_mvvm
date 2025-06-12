/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-10 11:23:31
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-10 11:34:04
 * @FilePath: /flutter_mvvm/module_home/lib/main.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_base/constant/app_config.dart';
import 'package:library_base/generated/l10n.dart';
import 'package:library_base/router/routers.dart';
import 'package:library_base/utils/device_util.dart';
import 'package:library_base/utils/log_util.dart';
import 'package:library_base/utils/refresh_util.dart';
import 'package:library_base/utils/sp_util.dart';
import 'package:library_base/utils/toast_util.dart';
import 'home_router.dart';
import 'page/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class DefaultApp {
  //运行app
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SPUtil.init();

    runApp(MyApp());

    initApp();
  }

  //程序初始化操作
  static void initApp() {
    LogUtil.init(isDebug: AppConfig.isTestEnvironment);
    if (DeviceUtil.isAndroid) {
      // 透明状态栏
      const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Routers.init([HomeRouter()]);

    HomeRouter.isRunModule = true;

    Widget child = MaterialApp(
      title: 'module_home',
      home: const HomePage(),
      onGenerateRoute: Routers.router!.generator,
      locale: const Locale('zh', 'CN'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
    );

    return ToastUtil.init(RefreshUtil.init(child));
  }
}

mixin RefreshLocalizations {}
