import 'package:baza/features/authentication/data/model/authenticated_user.dart';
import 'package:hive/hive.dart';

void registerAdapter() {
  Hive.registerAdapter(AuthenticatedUserModelAdapter());
}
