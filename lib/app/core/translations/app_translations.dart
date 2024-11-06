import 'package:get/get.dart';
import 'en.dart';
import 'de.dart';
import 'fr.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'de': de,
        'fr': fr,
      };
}
