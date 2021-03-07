import 'package:dio/dio.dart';
import 'package:dreambit_test/models/image_entity.dart';


class ApiClient {
  static const String baseUrl = "https://images-api.nasa.gov/";
  Dio dio = Dio();

  Future<List<ImageEntity>> getImages() async {
    final response = await dio.get("$baseUrl/search?q=earth");

    int code = response.statusCode;
    if (code == 200) {
      List<ImageEntity> images = [];
      final data = response.data["collection"]["items"];
      for (int i = 0; i < 100; ++i) {
        images.add(ImageEntity.fromJson(data[i]));
      }
      return images;
    } else {
      print(" ${response.data['message']}"); //????????????????????????
      throw Exception(response.data['message']);
    }
  }
}
