
import 'package:plinic2/src/translations/en_US/en_us_translations.dart';
import 'package:plinic2/src/translations/kr_KR/kr_kr_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> 
  translations = 
{
    'kr_KR' : krKr,
    'en_US' : enUs,
};

}