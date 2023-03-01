import 'package:hive/hive.dart';

part 'record.g.dart';

@HiveType(typeId: 1)
class CacheRecord {
  @HiveField(0)
  final String url;

  @HiveField(1)
  final String path;

  @HiveField(2)
  final DateTime createdAt;

  CacheRecord(this.url, this.path, this.createdAt);
}
