import 'dart:io';

class MyAdmob {
  //TEST
  static final String TEST_app_id_ios =
      'ca-app-pub-2334510780816542~6726672523';
  static final String TEST_app_id_android =
      'ca-app-pub-2334510780816542~7385148076';
  static final String TEST_banner_id_ios =
      'ca-app-pub-3940256099942544/2934735716';
  static final String TEST_banner_id_android =
      'ca-app-pub-3940256099942544/6300978111';
  static final String TEST_interstitial_id_ios =
      'ca-app-pub-3940256099942544/4411468910';
  static final String TEST_interstitial_id_android =
      'ca-app-pub-3940256099942544/1033173712';

  //PROD
  static final String PROD_app_id_ios =
      'ca-app-pub-4473546092325949~3852512696';
  static final String PROD_app_id_android =
      'ca-app-pub-4473546092325949~7375288910';
  static final String PROD_banner_id_ios =
      'ca-app-pub-4473546092325949/1034777663';
  static final String PROD_banner_id_android =
      'ca-app-pub-4473546092325949/4749125570';
  static final String PROD_interstitial_id_ios =
      'ca-app-pub-4473546092325949/5977496040';
  static final String PROD_interstitial_id_android =
      'ca-app-pub-4473546092325949/7977432875';

  static String getAppName() {
    if (Platform.isAndroid) {
      return 'Match Animals';
    } else {
      return 'Brain Game. Picture Match 2021';
    }
  }
}
