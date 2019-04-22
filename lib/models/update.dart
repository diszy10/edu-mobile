import 'package:json_annotation/json_annotation.dart';

part 'update.g.dart';

@JsonSerializable()

class Update {
  final String id;
  final String title, content, timestamp;

  Update({this.id, this.title, this.content, this.timestamp});

  factory Update.fromJson(Map<String, dynamic> json) {
    if (json.keys.first != null) {
      Map<String, dynamic> idMap = {"id": json.keys.first};
      Map<String, dynamic> data = idMap..addAll(json.values.first);
      return _$UpdateFromJson(data);
    }
    return null;
  }
}
