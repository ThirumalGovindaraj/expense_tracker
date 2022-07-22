import 'package:flutter/material.dart';
import '/helpers/s3_config.dart';

import 'customer_service_config.dart';
import 'firebase_config.dart';

// App Configuration
class AppConfig extends InheritedWidget {
  AppConfig({
    required this.appName,
    required this.environment,
    required this.apiBaseURL,
    required this.nobitaApiBaseURL,
    required this.theme,
    required this.customerServiceConfig,
    required this.s3Config,
    required this.firebaseConfig,
    required this.eWalletBaseUrl,
    required Widget child,
  }) : super(child: child);

  // appName
  // @description Application Name
  final String appName;

  // mode
  // @description Application Environment
  final String environment;

  // apiBaseURL
  // @description GOPAY API Base URL
  final String apiBaseURL;

  // nobitaApiBaseURL
  // @description GOPAY API Base URL
  final String nobitaApiBaseURL;

  // eWalletBaseUrl
  // @description GOPAY API Base URL
  final String eWalletBaseUrl;

  // theme
  // @description GOPAY Theme
  final ThemeData theme;

  // customerServiceConfig
  // @description GOPAY Customer Service Contact Information
  final CustomerServiceConfig customerServiceConfig;

  // s3Config
  // @description S3 COnfiguration
  final S3Config s3Config;

  // firebaseConfig
  // @description Firebase Configuration
  final FirebaseConfig firebaseConfig;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
