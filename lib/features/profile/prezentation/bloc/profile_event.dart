part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetData extends ProfileEvent {}

class SetData extends ProfileEvent {
  final String fish;
  final String address;
  final String imgurl;

  SetData({
    required this.fish,
    required this.address,
    required this.imgurl,
  });
}
