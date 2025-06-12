# Flutter MVVM 项目

## 项目介绍

Flutter MVVM 是一个基于 Flutter 框架开发的模块化应用程序，采用 MVVM (Model-View-ViewModel) 架构模式设计。该项目提供了一套完整的应用开发框架，包含了常用的功能组件和最佳实践，可作为中大型 Flutter 应用的基础架构参考。

## 架构设计

### 整体架构

项目采用模块化设计，主要分为以下几个部分：

- **主应用**：负责应用初始化、路由注册和模块集成
- **基础库**：提供公共组件、工具类和基础服务
- **业务模块**：按功能划分的独立模块，可单独运行和测试

### MVVM 模式实现

基于 `provider` 实现 MVVM 架构，主要包含：

- **Model**：数据模型和业务逻辑
- **View**：UI 界面，负责展示数据和用户交互
- **ViewModel**：连接 Model 和 View，处理业务逻辑和状态管理

### 模块化设计

项目按功能划分为多个模块，每个模块可独立开发、测试和运行：

- **library_base**：基础库，提供公共组件和服务
- **module_home**：首页模块
- **module_login**：登录模块
- **module_otc**：OTC 交易模块
- **module_user**：用户中心模块

## 核心功能

- **模块化路由管理**：基于 `fluro` 的路由封装，支持模块间页面跳转
- **网络请求封装**：基于 `dio` 的 HTTP 请求封装，支持拦截器、缓存等功能
- **WebSocket 封装**：基于 `web_socket_channel` 的 WebSocket 封装，支持自动重连
- **国际化支持**：基于 `i10n` 的多语言支持，支持中英文切换
- **状态管理**：基于 `provider` 的状态管理，实现 MVVM 架构
- **UI 组件库**：封装了常用的 UI 组件，如按钮、输入框、对话框等
- **下拉刷新和上拉加载**：基于 `pull_to_refresh` 的列表刷新加载功能
- **嵌套滚动**：NestedScrollView + TabView 联动实现
- **WebView 封装**：基于 `flutter_inappwebview` 的 WebView 封装
- **截图功能**：支持长页面截图和 WebView 截图

## 技术栈

### 核心框架

- **Flutter**：UI 框架
- **Provider**：状态管理
- **Dio**：网络请求
- **Fluro**：路由管理

### 主要第三方库

- **shared_preferences**：本地存储
- **event_bus**：事件总线
- **pull_to_refresh**：下拉刷新上拉加载
- **flutter_spinkit**：加载动画
- **decimal**：精确小数计算
- **web_socket_channel**：WebSocket 通信
- **cached_network_image**：图片加载和缓存
- **flutter_oktoast**：Toast 提示
- **image_picker & image_cropper**：图片选择和裁剪
- **flutter_inappwebview**：WebView 功能

## 环境配置

项目支持多环境配置，包括开发环境、测试环境和生产环境：

- **开发环境**：`main_dev.dart`
- **测试环境**：`main_test.dart`
- **生产环境**：`main.dart`

## 快速开始

### 环境要求

- Flutter SDK: ^3.5.0
- Dart SDK: ^3.5.0

### 安装依赖

```bash
flutter pub get
```

### 运行项目

```bash
# 开发环境
flutter run -t lib/main_dev.dart

# 测试环境
flutter run -t lib/main_test.dart

# 生产环境
flutter run -t lib/main.dart
```

## 模块开发指南

### 创建新模块

1. 创建模块目录结构
2. 实现 `IRouter` 接口注册路由
3. 在主应用中集成模块

### 页面开发流程

1. 创建数据模型 (Model)
2. 创建视图模型 (ViewModel)
3. 创建视图 (View)
4. 注册路由

## 项目结构

```
├── lib/                      # 主应用代码
│   ├── init/                 # 应用初始化
│   ├── page/                 # 页面
│   ├── viewmodel/            # 视图模型
│   ├── main.dart             # 生产环境入口
│   ├── main_dev.dart         # 开发环境入口
│   ├── main_test.dart        # 测试环境入口
│   └── main_router.dart      # 主路由
├── library_base/             # 基础库
│   ├── constant/             # 常量定义
│   ├── event/                # 事件定义
│   ├── l10n/                 # 国际化资源
│   ├── model/                # 数据模型
│   ├── mvvm/                 # MVVM 框架
│   ├── net/                  # 网络请求
│   ├── router/               # 路由管理
│   ├── utils/                # 工具类
│   └── widget/               # 公共组件
├── module_home/              # 首页模块
├── module_login/             # 登录模块
├── module_otc/               # OTC 模块
└── module_user/              # 用户模块
```

## 贡献指南

1. Fork 项目
2. 创建特性分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add some amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 创建 Pull Request

## 许可证

[MIT License](LICENSE)
