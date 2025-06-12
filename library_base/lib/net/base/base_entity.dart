import 'package:library_base/net/base/entry_factory.dart';
import 'package:library_base/net/apis.dart';
import 'package:library_base/utils/object_util.dart';

class BaseEntity<T> {
  String? code;
  String? msg;
  T? data;

  BaseEntity({this.code, this.msg, this.data});

  BaseEntity.fromJson(Map<String, dynamic> jsonMap) {
    code = jsonMap[Apis.CODE] as String?;
    msg = jsonMap[Apis.MESSAGE] as String?;

    if (jsonMap.containsKey('data') && !ObjectUtil.isEmpty(jsonMap['data'])) {
      data = EntityFactory.generateOBJ<T>(jsonMap['data']);
    }
  }
}
