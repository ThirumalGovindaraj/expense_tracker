import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

// Firebase Configuration
class FirebaseConfig {
  FirebaseConfig({required this.accessKeyID, required this.secretKey});

  // accessKeyID
  // @description Firebase Access Key ID
  final String accessKeyID;

  /// secretKey
  /// @description Firebase Secret Key
  final String secretKey;
}
