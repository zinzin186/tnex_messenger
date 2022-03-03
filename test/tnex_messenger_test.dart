import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tnex_messenger/tnex_messenger.dart';

void main() {
  const MethodChannel channel = MethodChannel('tnex_messenger');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await TnexMessenger.platformVersion, '42');
  });
}
