part of '../king_helper.dart';

Future<String> getDeviceName() async {
  final deviceInfo = (await DeviceInfoPlugin().deviceInfo).data;
  final name = deviceInfo['name'].toString().trim();
  return name == 'null'
      ? '${deviceInfo['model'].toString().trim()} ${deviceInfo['brand'].toString().trim()}'
      : name;
}
