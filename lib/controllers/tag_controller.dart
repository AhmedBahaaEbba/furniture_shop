import 'package:furniture_shop/models/base_tag.dart';

class TagController {
  BaseTag tag;

  TagController(this.tag);

  static List<BaseTag> toTags(List<Map<String, dynamic>> jsonObjects) {}
}
