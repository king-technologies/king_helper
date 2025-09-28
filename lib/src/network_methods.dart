part of '../king_helper.dart';

Future<String> getLocalSubnet() async {
  try {
    final ip = await getLocalIp();
    return ip.split('.').sublist(0, 3).join('.');
  } catch (e) {
    debugPrint('Error getting local subnet: $e');
    rethrow;
  }
}

Future<String> getLocalIp() async {
  try {
    final interfaces = await NetworkInterface.list(
      type: InternetAddressType.IPv4,
    );
    final supportedNetworks = ['wi-fi', 'wlan'];
    for (final interface in interfaces) {
      var supported = false;
      for (final network in supportedNetworks) {
        if (interface.name.toLowerCase().contains(network)) {
          supported = true;
          break;
        }
      }
      if (supported) {
        return interface.addresses.first.address;
      }
    }
  } catch (e) {
    debugPrint('Error getting local IP: $e');
    rethrow;
  }
  throw Exception('No devices found');
}
