import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Encrypts the photo and personal details; only the key lives in secure storage.
class StudentCardCacheCipher {
  StudentCardCacheCipher({FlutterSecureStorage? storage})
    : _storage =
          storage ??
          const FlutterSecureStorage(
            iOptions: IOSOptions(
              accessibility: KeychainAccessibility.unlocked_this_device,
            ),
          );

  static const _keyName = 'student_card_cache_key_v1';
  static const _prefix = 'card-aes-gcm-v1:';
  final FlutterSecureStorage _storage;
  final _algorithm = AesGcm.with256bits();
  Future<SecretKey>? _keyFuture;

  Future<SecretKey> _key() =>
      _keyFuture ??= _loadKey().catchError((Object error) {
        _keyFuture = null;
        throw error;
      });

  Future<SecretKey> _loadKey() async {
    final stored = await _storage.read(key: _keyName);
    if (stored != null) {
      final bytes = base64Decode(stored);
      if (bytes.length != 32) throw const FormatException('Invalid cache key');
      return SecretKey(bytes);
    }
    final key = await _algorithm.newSecretKey();
    await _storage.write(
      key: _keyName,
      value: base64Encode(await key.extractBytes()),
    );
    return key;
  }

  Future<String> encrypt(String plaintext, String cacheKey) async {
    final box = await _algorithm.encrypt(
      utf8.encode(plaintext),
      secretKey: await _key(),
      aad: utf8.encode(cacheKey),
    );
    return '$_prefix${base64Encode(box.concatenation())}';
  }

  Future<String> decrypt(String ciphertext, String cacheKey) async {
    if (!ciphertext.startsWith(_prefix)) {
      throw const FormatException('Unencrypted student card cache');
    }
    final box = SecretBox.fromConcatenation(
      base64Decode(ciphertext.substring(_prefix.length)),
      nonceLength: 12,
      macLength: 16,
    );
    return utf8.decode(
      await _algorithm.decrypt(
        box,
        secretKey: await _key(),
        aad: utf8.encode(cacheKey),
      ),
    );
  }

  Future<void> reset() async {
    _keyFuture = null;
    await _storage.delete(key: _keyName);
  }
}
