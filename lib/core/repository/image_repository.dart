import 'package:dreambit_test/core/api/api_client.dart';
import 'package:dreambit_test/models/image_entity.dart';

class ImageRepository {
  ApiClient _apiClient = ApiClient();

  Future<List<ImageEntity>> getImages() async {
    return await _apiClient.getImages();
  }
}
