part of 'services.dart';

class UserServices {
  static Future<BaseResponse<User>> signIn(
      String email, String password) async {
    _dio.options.headers["Content-Type"] = "application/json";

    var data =
        jsonEncode(<String, String>{'email': email, 'password': password});

    Response res = await _dio.post(loginURL, data: data);

    if (res.statusCode != 200) {
      return BaseResponse(message: 'Please try again');
    }

    var body = (res.data);

    User.token = body['data']['access_token'];
    User value = User.fromJson(body['data']['user']);

    return BaseResponse(value: value);
  }

  static Future<BaseResponse<User>> signUp(User user, String password,
      {File pictureFile}) async {
    _dio.options.headers['Content-Type'] = 'application/json';

    var data = jsonEncode(<String, String>{
      'name': user.name,
      'email': user.email,
      'password': password,
      'password_confirmation': password,
      'city': user.city,
    });

    Response res = await _dio.post(signUpURL, data: data);

    if (res.statusCode != 200) {
      return BaseResponse(message: 'Please try again');
    }

    var body = (res.data);

    User.token = body['data']['access_token'];
    User value = User.fromJson(body['data']['user']);

    if (pictureFile != null) {
      BaseResponse<String> result = await uploadProfilePicture(pictureFile);
      if (result.value != null) {
        value =
            value.copyWith(picturePath: baseURL + "storage/" + result.value);
      }
    }

    return BaseResponse(value: value);
  }

  static Future<BaseResponse<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest request}) async {
    String url = baseApi + 'user/photo';
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["Authorization"] = "Bearer ${User.token}";
    }

    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return BaseResponse(value: imagePath);
    } else {
      return BaseResponse(message: 'Uploading Profile Picture Failed');
    }
  }
}
