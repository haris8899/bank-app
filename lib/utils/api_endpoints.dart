class ApiEndpoints {
  static final String baseUrl = "http://192.168.10.7:5000";
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerMail = "/register";
  final String loginMail = "/login";
  final String uploadimage = "/upload";
}
