import 'package:ads/ads.dart';

class SubjectCombination {
  // ignore: non_constant_identifier_names
  static String HL1, HL2, HL3, SL1, SL2, SL3;
  static double hl1Score, hl2Score, hl3Score, sl1Score, sl2Score, sl3Score;
}

class BoundariesPOJO {
  int year;
  Map<String, Map<dynamic, dynamic>> ranges;
}

class AppAds {
  static Ads ads;
}