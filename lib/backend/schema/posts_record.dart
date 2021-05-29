import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  String get post;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PostsRecordBuilder builder) =>
      builder..post = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;
}

Map<String, dynamic> createPostsRecordData({
  DocumentReference user,
  String post,
}) =>
    serializers.serializeWith(
        PostsRecord.serializer,
        PostsRecord((p) => p
          ..user = user
          ..post = post));

PostsRecord get dummyPostsRecord {
  final builder = PostsRecordBuilder()..post = dummyString;
  return builder.build();
}

List<PostsRecord> createDummyPostsRecord({int count}) =>
    List.generate(count, (_) => dummyPostsRecord);
