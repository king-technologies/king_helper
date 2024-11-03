part of '../king_helper.dart';

Future<String> getDeviceName() async {
  final deviceInfo = (await DeviceInfoPlugin().deviceInfo).data;
  var name = 'Device';
  if (kIsWeb) {
    name = 'Web';
  } else if (Platform.isWindows) {
    final userName = deviceInfo['userName'].toString().trim();
    if (userName != 'null' && userName.isNotEmpty) {
      name = userName;
    }
    final computerName = deviceInfo['computerName'].toString().trim();
    if (computerName != 'null' && computerName.isNotEmpty) {
      name += ' ($computerName)';
    }
  } else if (Platform.isAndroid) {
    final model = deviceInfo['model'].toString().trim();
    if (model != 'null' && model.isNotEmpty) {
      name = model;
    }
  }
  return name;
}
