import 'package:library_base/utils/object_util.dart';

class AccountEntity {
  String? token;
  Account? account_info;
  String? expire_time;

  AccountEntity({
    this.token,
    this.account_info,
    this.expire_time,
  });

  AccountEntity.fromJson(Map<String, dynamic> jsonMap) {
    token = jsonMap['token'];
    expire_time = jsonMap['expire_time'];

    if (ObjectUtil.isNotEmpty(jsonMap['account_info'])) {
      account_info = Account.fromJson(jsonMap['account_info']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = <String, dynamic>{};
    jsonMap['token'] = token;
    jsonMap['expire_time'] = expire_time;

    if (account_info != null) {
      jsonMap['account_info'] = account_info?.toJson();
    }

    return jsonMap;
  }
}

class Account {
  num? account_id;
  String? phone;
  String? area_code;
  String? nick_name;
  String? password;
  String? latest_login_at;
  String? created_at;
  String? updated_at;
  String? head_ico;
  String? invite_code;
  String? remark;
  bool? had_password;
  WechatAccount? wechat_account;

  String? token;

  String? get phoneSecret => _getPhoneSecret();

  String? _getPhoneSecret() {
    var t = phone?.split(' ');
    String? secret = t?.last;

    if (secret != null && secret.length >= 11) {
      secret =
          secret.replaceRange(secret.length - 8, secret.length - 4, '****');
    }
    return secret;
  }

  Account({
    this.account_id,
    this.phone,
    this.area_code,
    this.nick_name,
    this.password,
    this.latest_login_at,
    this.created_at,
    this.updated_at,
    this.head_ico,
    this.invite_code,
    this.remark,
    this.had_password,
    this.wechat_account,
    this.token,
  });

  Account.fromJson(Map<String, dynamic> jsonMap) {
    account_id = jsonMap['id'] ?? 0;
    phone = jsonMap['phone'] ?? '';
    area_code = jsonMap['area_code'] ?? '+86';
    nick_name = jsonMap['nick_name'] ?? '';
    password = jsonMap['password'] ?? '';
    latest_login_at = jsonMap['latest_login_at'] ?? '';
    created_at = jsonMap['created_at'] ?? '';
    updated_at = jsonMap['updated_at'] ?? '';
    head_ico = jsonMap['head_ico'] ?? '';
    invite_code = jsonMap['invite_code'] ?? '';
    remark = jsonMap['remark'] ?? '';
    had_password = jsonMap['had_password'] ?? false;
    token = jsonMap['token'] ?? '';
    wechat_account = WechatAccount.fromJson(jsonMap['wechat_account'] ?? {});
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = <String, dynamic>{};
    jsonMap['id'] = account_id;
    jsonMap['phone'] = phone;
    jsonMap['area_code'] = area_code;
    jsonMap['nick_name'] = nick_name;
    jsonMap['password'] = password;
    jsonMap['latest_login_at'] = latest_login_at;
    jsonMap['created_at'] = created_at;
    jsonMap['updated_at'] = updated_at;
    jsonMap['head_ico'] = head_ico;
    jsonMap['invite_code'] = invite_code;
    jsonMap['remark'] = remark;
    jsonMap['had_password'] = had_password;
    jsonMap['token'] = token;
    jsonMap['wechat_account'] = wechat_account?.toJson();
    return jsonMap;
  }

  Account.fromLocalJson(Map<String, dynamic> jsonMap) {
    account_id = jsonMap['id'];
    phone = jsonMap['phone'];
    area_code = jsonMap['area_code'];
    nick_name = jsonMap['nick_name'];
    head_ico = jsonMap['head_ico'];
    token = jsonMap['token'];
  }

  Map<String, dynamic> toLocalJson() {
    final Map<String, dynamic> jsonMap = <String, dynamic>{};
    jsonMap['id'] = account_id;
    jsonMap['phone'] = phone;
    jsonMap['area_code'] = area_code;
    jsonMap['nick_name'] = nick_name;
    jsonMap['head_ico'] = head_ico;
    jsonMap['token'] = token;
    return jsonMap;
  }
}

class WechatAccount {
  bool? binded;

  WechatAccount({
    this.binded,
  });

  WechatAccount.fromJson(Map<String, dynamic> jsonMap) {
    binded = jsonMap['binded'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = <String, dynamic>{};
    jsonMap['binded'] = binded;

    return jsonMap;
  }
}
