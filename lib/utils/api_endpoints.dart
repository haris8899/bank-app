class ApiEndpoints {
  static final String baseUrl = "http://192.168.10.3:5000";
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
  static _ImageEndpoints imageEndpoints = _ImageEndpoints();
}

class _AuthEndPoints {
  final String registerMail = "/user/register";
  final String loginMail = "/user/login";
}

class _ImageEndpoints {
  final String uploadimage = "/image/upload";
  final String addimage = "/image/add";
  final String getallimage = "/image/getall";
}
