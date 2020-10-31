part of 'services.dart';

class FoodServices {
  static Future<BaseResponse<List<Food>>> getFoods() async {
    try {
      _dio.options.headers['Accept'] = 'application/json';
      Response res = await _dio.get("/food");
      if (res.statusCode != 200) {
        print(
            "Unexpected error ${res.statusCode} message = ${res.statusMessage}");
        return BaseResponse(message: 'Please try again');
      }
      var body = (res.data);
      List<Food> foods =
          (body['data']['data'] as List).map((e) => Food.fromJson(e)).toList();

      return BaseResponse(value: foods);
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.CONNECT_TIMEOUT) {
        return BaseResponse(message: "Connection  Timeout Exception");
      }
      return BaseResponse(message: "${ex.message}");
    }
  }
}
