/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-25 16:41:47
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-25 16:43:46
 * @FilePath: /flutter_mvvm/library_base/lib/utils/secureMnemonicStorage.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pointycastle/digests/sha256.dart';
import 'package:pointycastle/key_derivators/api.dart';
import 'package:pointycastle/key_derivators/pbkdf2.dart';
import 'package:pointycastle/macs/hmac.dart';

// mnemonic
const String kMnemonicKey = "MNEMONIC_KEY";
// Salt 存储键名
const String kEncryptionKey = "ENCRYPTION_SALT_KEY";
// PBKDF2 迭代次数
const int kPBKDF2Iterations = 100000;

class SecureMnemonicStorage {
  // 使用 FlutterSecureStorage 存储密钥和 Salt
  final _storage = const FlutterSecureStorage();

  /// 生成随机 Salt
  Future<Uint8List> _getSalt() async {
    String? saltBase64 = await _storage.read(key: kEncryptionKey);
    if (saltBase64 == null) {
      final salt = encrypt.Key.fromSecureRandom(16).bytes;
      saltBase64 = base64Encode(salt);
      await _storage.write(key: kEncryptionKey, value: saltBase64);
    }
    return base64Decode(saltBase64);
  }

  /// 通过 PBKDF2 生成 AES 密钥
  Future<encrypt.Key> _generateKey(String password) async {
    final salt = await _getSalt();
    final derivator = PBKDF2KeyDerivator(HMac(SHA256Digest(), 64))
      ..init(Pbkdf2Parameters(salt, kPBKDF2Iterations, 32));
    final key = derivator.process(utf8.encode(password));
    return encrypt.Key(Uint8List.fromList(key));
  }

  /// AES 加密助记词
  Future<String> encryptMnemonic(String password, String mnemonic) async {
    final key = await _generateKey(password);
    final iv = encrypt.IV.fromLength(16);
    final encryptEr = encrypt.Encrypter(encrypt.AES(key));
    final encryptEd = encryptEr.encrypt(mnemonic, iv: iv);
    return jsonEncode({"iv": iv.base64, "data": encryptEd.base64});
  }

  /// AES 解密助记词
  Future<String> decryptMnemonic(String password, String encryptedText) async {
    final key = await _generateKey(password);
    final decoded = jsonDecode(encryptedText);
    final iv = encrypt.IV.fromBase64(decoded["iv"]);
    final encryptedData = encrypt.Encrypted.fromBase64(decoded["data"]);
    final encryptEr = encrypt.Encrypter(encrypt.AES(key));
    return encryptEr.decrypt(encryptedData, iv: iv);
  }

  /// 存储加密助记词
  Future<void> saveMnemonic(String password, String mnemonic) async {
    String encryptedMnemonic = await encryptMnemonic(password, mnemonic);
    await _storage.write(key: kMnemonicKey, value: encryptedMnemonic);
  }

  /// 读取并解密助记词
  Future<String?> getMnemonic(String password) async {
    String? encryptedMnemonic = await _storage.read(key: kMnemonicKey);
    if (encryptedMnemonic == null) return null;
    return await decryptMnemonic(password, encryptedMnemonic);
  }
}
/*
Future<void> onTap() async {
    final secureStorage = SecureMnemonicStorage();
    // 1. 获取助记词
    final String mnemonic = BlockChainUtils().mnemonic();
    print("助记词: $mnemonic");
    // 2. 用户输入的密码
    final String userPassword = "zfj123456";
    // 3. 加密并存储
    await secureStorage.saveMnemonic(userPassword, mnemonic);
    print("助记词已加密存储！");
    // 4. 读取并解密
    String? decryptedMnemonic = await secureStorage.getMnemonic(userPassword);
    print("解密后的助记词: $decryptedMnemonic");
  }
**/
