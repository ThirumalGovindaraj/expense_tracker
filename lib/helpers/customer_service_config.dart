import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

// Customer Service Config Configuration
class CustomerServiceConfig {
  CustomerServiceConfig(
      {required this.email, required this.phone, required this.whatsapp});

  // Customer Service Email
  final String email;

  /// Customer Service Phone Number
  final String phone;

  /// Customer Service Whatsapp Number
  final String whatsapp;
}
