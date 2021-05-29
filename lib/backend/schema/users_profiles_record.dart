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
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersProfilesRecordBuilder builder) => builder;

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

Map<String, dynamic> createUsersProfilesRecordData() =>
    serializers.serializeWith(
        UsersProfilesRecord.serializer, UsersProfilesRecord((u) => u));

UsersProfilesRecord get dummyUsersProfilesRecord {
  final builder = UsersProfilesRecordBuilder();
  return builder.build();
}

List<UsersProfilesRecord> createDummyUsersProfilesRecord({int count}) =>
    List.generate(count, (_) => dummyUsersProfilesRecord);
