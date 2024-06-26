class ApiEndPoints {
  // static final String baseUrl ="http://192.168.1.13/LARAVEL/akamou-new/public/api/";
  // static final String baseUrlWeb ="http://192.168.1.13/LARAVEL/akamou-new/public/";
  static final String baseUrl = "https://simouaka.pjjaka.com/public/api/";
  static final String baseUrlWeb = "https://simouaka.pjjaka.com/public";
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String loginApi = 'login/loginApi';
  final String mouData = 'mobile/dokumen-mou/getData';
  final String mouDetailData = 'mobile/dokumen-mou/getDetailDataMobile';
  final String moaDta = 'mobile/dokumen-moa/getData';
  final String moaDetailData = 'mobile/dokumen-moa/getDetailDataMobile';
  final String detailUser = 'login/getDataDetailUser';

// KEGIATAN
  final String listInstansi = 'mobile/kegiatan/getDataInstansi';
  final String searchDataByInstansi = 'kegiatan/searchDataByInstansi';
  final String getDataMoaByMou = 'kegiatan/getDataMoa';
  
// MASTER TEMPLATE
  final String getDataMasterTemplate = 'mobile/master_template/getData';
  final String detailDataMasterTemplate = 'mobile/master_template/getDetailDataMobile';
  
// Dashboard
  final String getDataDashboard = 'mobile/Dashboard';

}
