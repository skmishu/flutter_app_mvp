// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsData _$NewsDataFromJson(Map<String, dynamic> json) {
  return NewsData(
      p_id: json['p_id'] as int,
      post_title: json['post_title'] as String,
      post_content: json['post_content'] as String,
      img_src: json['img_src'] as String);
}

Map<String, dynamic> _$NewsDataToJson(NewsData instance) => <String, dynamic>{
      'p_id': instance.p_id,
      'post_content': instance.post_content,
      'post_title': instance.post_title,
      'img_src': instance.img_src
    };
