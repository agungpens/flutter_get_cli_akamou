class ApiEndPoints {
  static final String baseUrl =
      "http://192.168.1.5/LARAVEL/akamou-new/public/api/";
  // static final String baseUrl = "https://agungaldi.pjjaka.com/api/";
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String loginApi = 'login/loginApi';
  final String mouData = 'mobile/dokumen-mou/getData';
  final String mouDetailData = 'mobile/dokumen-mou/getDetailDataMobile';
  final String moaDta = 'mobile/dokumen-moa/getData';
  final String moaDetailData = 'mobile/dokumen-moa/getDetailDataMobile';
  final String detailUser = 'login/getDataDetailUser';
}
