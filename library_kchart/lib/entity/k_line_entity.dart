/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 18:58:34
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-26 15:23:02
 * @FilePath: /flutter_mvvm/library_kchart/lib/entity/k_line_entity.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:library_kchart/entity/k_entity.dart';

class KLineEntity extends KEntity {
  double? open;
  double? high;
  double? low;
  double? close;
  double? vol;
  double? amount;
  int? count;
  int? id;

  KLineEntity({
    this.open,
    this.high,
    this.low,
    this.close,
    this.vol,
    this.amount,
    this.count,
    this.id,
  });

  KLineEntity.fromJson(Map<String, dynamic> json) {
    open = (json['open'] as num?)?.toDouble();
    high = (json['high'] as num?)?.toDouble();
    low = (json['low'] as num?)?.toDouble();
    close = (json['close'] as num?)?.toDouble();
    vol = (json['vol'] as num?)?.toDouble();
    amount = (json['amount'] as num?)?.toDouble();
    count = (json['count'] as num?)?.toInt();
    id = (json['id'] as num?)?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['open'] = open;
    data['close'] = close;
    data['high'] = high;
    data['low'] = low;
    data['vol'] = vol;
    data['amount'] = amount;
    data['count'] = count;
    return data;
  }

  @override
  String toString() {
    return 'MarketModel{open: $open, high: $high, low: $low, close: $close, vol: $vol, id: $id}';
  }
}
