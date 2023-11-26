class ApiEndpoints {
  static final String baseUrl = "http://192.168.10.5:5000";
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
  static _ImageEndpoints imageEndpoints = _ImageEndpoints();
}

class _AuthEndPoints {
  final String registerMail = "/user/register";
  final String loginMail = "/user/login";
  final String uploadimage = "/upload";
}

class _ImageEndpoints {
  final String uploadimage = "/image/upload";
}
