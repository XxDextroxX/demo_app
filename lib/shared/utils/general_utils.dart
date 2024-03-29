import 'package:demo_app/shared/services/key_values_impl.dart';
import 'package:intl/intl.dart';

class GeneralUtils {
  static Future<void> setUid(String uid) async {
    final keyValueStorage = KeyValuesImplementation();
    await keyValueStorage.setKeyValue('uid', uid);
  }

  static Future<String?> getUid() async {
    final keyValueStorage = KeyValuesImplementation();
    return await keyValueStorage.getValue<String>('uid');
  }

  static Future<void> removeUid() async {
    final keyValueStorage = KeyValuesImplementation();
    await keyValueStorage.removeKey('uid');
  }

  //set password
  static Future<void> setPassword(String password) async {
    final keyValueStorage = KeyValuesImplementation();
    await keyValueStorage.setKeyValue('password', password);
  }

  static Future<String?> getPassword() async {
    final keyValueStorage = KeyValuesImplementation();
    return await keyValueStorage.getValue<String>('password');
  }

  static Future<void> removePassword() async {
    final keyValueStorage = KeyValuesImplementation();
    await keyValueStorage.removeKey('password');
  }

  static getAmoutFormat(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String timeAgo(String timestamp) {
    final time = DateTime.parse(timestamp);
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 7) {
      return 'hace ${difference.inDays ~/ 7} semanas';
    } else if (difference.inDays > 0) {
      return 'hace ${difference.inDays} días';
    } else if (difference.inHours > 0) {
      return 'hace ${difference.inHours} horas';
    } else if (difference.inMinutes > 0) {
      return 'hace ${difference.inMinutes} minutos';
    } else {
      return 'hace ${difference.inSeconds} segundos';
    }
  }
}
