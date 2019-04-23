// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Update _$UpdateFromJson(Map<String, dynamic> json) {
  return Update(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      timestamp: json['timestamp'] as String);
}

Map<String, dynamic> _$UpdateToJson(Update instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'timestamp': instance.timestamp
    };
