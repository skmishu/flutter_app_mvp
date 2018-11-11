import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'package:zoombox_practice/json/latest_news.dart';

part 'serializers.g.dart';

@SerializersFor(const [LatestNews],)
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();