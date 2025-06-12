/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-11 15:10:22
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-11 15:10:32
 * @FilePath: /flutter_mvvm/library_base/lib/extension/extension_string.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:convert';
import 'package:crypto/crypto.dart';

/// 判断字符串是否为空
bool isEmptyString(String? str) {
  return str == null || str.isEmpty;
}

extension StringExtension on String {
  String md5Hash() {
    // 将字符串转换为字节数组
    var content = utf8.encode(this);
    // 使用 md5 算法进行加密
    var digest = md5.convert(content);
    // 将加密结果转换为 hex 字符串
    return digest.toString();
  }

  // 扩展方法，将字符串转换为 Map<String, dynamic>
  Map<String, dynamic> toMap() {
    try {
      // 使用 json.decode 尝试将字符串解析为 Map
      return json.decode(this) as Map<String, dynamic>;
    } catch (e) {
      // 若解析失败，打印错误信息并返回一个空 Map
      print('转换出错: $e');
      return {};
    }
  }

  // Base64 编码
  String base64Encode() {
    // 使用 utf8 编码将字符串转换为字节数组，再进行 Base64 编码
    return base64.encode(utf8.encode(this));
  }

  // Base64 解码
  String base64Decode() {
    try {
      // 对 Base64 编码的字符串进行解码，再使用 utf8 解码为字符串
      return utf8.decode(base64.decode(this));
    } catch (e) {
      // 若解码失败，打印错误信息并返回原字符串
      print('Base64 decoding error: $e');
      return this;
    }
  }

  /// 截取指定长度字符串
  String truncate(int length) {
    if (this.length <= length) {
      return this;
    }
    return '${substring(0, length)}...';
  }

  /// 批量替换多个子字符串
  String replaceMultiple(Map<String, String> replacements) {
    String result = this;
    // 遍历替换规则的映射
    replacements.forEach((oldStr, newStr) {
      // 对当前字符串中的旧字符串进行全局替换
      result = result.replaceAll(oldStr, newStr);
    });
    return result;
  }

  /// 忽略大小写的字符串替换
  String replaceCaseInsensitive(String oldStr, String newStr) {
    final regExp = RegExp(oldStr, caseSensitive: false);
    return replaceAll(regExp, newStr);
  }

  /// 按索引范围替换字符串
  String replaceInRange(int start, int end, String replacement) {
    if (start < 0) start = 0;
    if (end > length) end = length;
    return substring(0, start) + replacement + substring(end);
  }
}
