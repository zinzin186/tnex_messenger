
import 'dart:async';

import 'package:flutter/services.dart';

class TnexMessenger {
  static const MethodChannel _channel = MethodChannel('tnex_messenger');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
