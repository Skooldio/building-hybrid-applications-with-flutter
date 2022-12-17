import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_plugin/demo_plugin_method_channel.dart';

void main() {
  MethodChannelDemoPlugin platform = MethodChannelDemoPlugin();
  const MethodChannel channel = MethodChannel('demo_plugin');

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
    expect(await platform.getPlatformVersion(), '42');
  });
}
