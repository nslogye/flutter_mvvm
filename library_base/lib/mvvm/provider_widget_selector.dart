/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:03
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 14:20:29
 * @FilePath: /flutter_mvvm/library_base/lib/mvvm/provider_widget_selector.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Provider封装类
/// 方便数据初始化
class ProviderWidget<T extends ChangeNotifier, S> extends StatefulWidget {
  final ValueWidgetBuilder<S> builder;
  final S Function(BuildContext, T) selector;
  final T model;
  final Widget? child;
  final Function(T model)? onModelReady;
  final bool autoDispose;

  const ProviderWidget({
    super.key,
    required this.builder,
    required this.model,
    required this.selector,
    this.child,
    this.onModelReady,
    required this.autoDispose,
  });

  @override
  ProviderWidgetState<T> createState() => ProviderWidgetState<T>();
}

class ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T, dynamic>> {
  late T model;

  @override
  void initState() {
    model = widget.model;
    widget.onModelReady?.call(model);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.autoDispose) model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Selector<T, dynamic>(
        selector: widget.selector,
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
