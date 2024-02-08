// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState {
  final ProfileStatus status;
  final AuthenticatedUserModel? authenticatedUser;

  ProfileState({required this.status, this.authenticatedUser});

  ProfileState copyWith({
    ProfileStatus? status,
    AuthenticatedUserModel? authenticatedUser,
  }) {
    return ProfileState(
      status: status ?? this.status,
      authenticatedUser: authenticatedUser ?? this.authenticatedUser,
    );
  }

  @override
  bool operator ==(covariant ProfileState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.authenticatedUser == authenticatedUser;
  }

  @override
  int get hashCode => status.hashCode ^ authenticatedUser.hashCode;

  @override
  String toString() =>
      'ProfileState(status: $status, authenticatedUser: $authenticatedUser)';
}
