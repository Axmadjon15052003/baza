import 'package:baza/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

class LocalDataBase {
  static LocalDataBase? _dataBase;
  static Store? _store;
  static Future<LocalDataBase> getInstance() async {
    if (_dataBase == null) {
      _store = await _init();
      await _init();
      _dataBase = LocalDataBase._();
    }

    return _dataBase!;
  }

  static Future<Store> _init() async {
    final applicationDirectory = await getApplicationDocumentsDirectory();

    final store =
        await openStore(directory: "${applicationDirectory.path}/dataBase");
    return store;
  }

  LocalDataBase._();
}
