// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

part 'authenticated_user.g.dart';

@HiveType(typeId: 0)
class AuthenticatedUserModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String fish;
  @HiveField(2)
  final String address;
  @HiveField(3)
  final String? imgurl;

  AuthenticatedUserModel(
      {required this.id,
      required this.fish,
      required this.address,
      this.imgurl});

  @override
  String toString() =>
      'AuthenticatedUserModel(id: $id, firstName: $fish, lastName: $address, imgurl: $imgurl)';
}
