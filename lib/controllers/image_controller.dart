import 'package:furniture_shop/models/base_image.dart';

class ImageController {
  BaseImage image;

  ImageController(this.image);

  static List<BaseImage> toImages(List<Map<String, dynamic>> jsonObjects) {}
}
