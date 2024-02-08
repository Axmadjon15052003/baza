import 'dart:io';

import 'package:baza/features/authentication/data/model/authenticated_user.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class HiveRepository {
  HiveRepository._();
  static Box? _hive;
  static HiveRepository? _storegaHive;

  static Future<HiveRepository> getInstance() async {
    if (_storegaHive == null) {
      final storege = HiveRepository._();
      await storege.init();
      _storegaHive = storege;
    }
    return _storegaHive!;
  }

  Future<void> init() async {
    const boxName = "auth_user_data";
    Directory directory = await getApplicationCacheDirectory();
    Hive.init(directory.path);
    _hive = await Hive.openBox<dynamic>(boxName);
  }

  static Future<void> putData(String fish, String addres, String imgurl) async {
    await _hive?.put(
      "auth",
      AuthenticatedUserModel(
        id: "1",
        fish: fish,
        address: addres,
        imgurl: imgurl,
      ),
    );
  }

  static getData() {
    return _hive?.get(
      "auth",
      defaultValue: AuthenticatedUserModel(
        id: "0",
        fish: "Axmadjon Bakirov",
        address: "Farg'ona viloyati Uchko'prik tumani ",
      ),
    );
  }
}
