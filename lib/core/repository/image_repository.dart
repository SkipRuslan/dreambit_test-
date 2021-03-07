import 'package:dreambit_test/core/api/api_client.dart';
import 'package:dreambit_test/models/image_entity.dart';

class ImageRepository {
  static Future<List<ImageEntity>> getImages() async {
    return await ApiClient().getImages();
  }
}
