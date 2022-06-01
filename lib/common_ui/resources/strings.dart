import 'package:bluetooth_tutorial/common_ui/resources/en_strings.dart';
import 'package:bluetooth_tutorial/common_ui/resources/et_strings.dart';
import 'package:get/route_manager.dart';

class Strings extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en_EN': enStrings,
      'et_ET': etStrings,
    };
  }
}
