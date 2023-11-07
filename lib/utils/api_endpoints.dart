class ApiEndpoints {
  static final String baseUrl = "http://192.168.10.6:5000";
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerMail = "/user/register";
  final String loginMail = "/user/login";
  final String uploadimage = "/upload";
}
