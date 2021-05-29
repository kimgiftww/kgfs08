import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'users_profiles_record.g.dart';

abstract class UsersProfilesRecord
    implements Built<UsersProfilesRecord, UsersProfilesRecordBuilder> {
  static Serializer<UsersProfilesRecord> get serializer =>
      _$usersProfilesRecordSerializer;

  @nullable
  DocumentReference get uid;

  @nullable
  int get phone;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersProfilesRecordBuilder builder) =>
      builder..phone = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users_profiles');

  static Stream<UsersProfilesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersProfilesRecord._();
  factory UsersProfilesRecord(
          [void Function(UsersProfilesRecordBuilder) updates]) =
      _$UsersProfilesRecord;
}

Map<String, dynamic> createUsersProfilesRecordData({
  DocumentReference uid,
  int phone,
}) =>
    serializers.serializeWith(
        UsersProfilesRecord.serializer,
        UsersProfilesRecord((u) => u
          ..uid = uid
          ..phone = phone));

UsersProfilesRecord get dummyUsersProfilesRecord {
  final builder = UsersProfilesRecordBuilder()..phone = dummyInteger;
  return builder.build();
}

List<UsersProfilesRecord> createDummyUsersProfilesRecord({int count}) =>
    List.generate(count, (_) => dummyUsersProfilesRecord);
