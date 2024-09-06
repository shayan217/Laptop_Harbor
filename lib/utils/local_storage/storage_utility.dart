
import 'package:get_storage/get_storage.dart';

class LHLocalStorae {
  static final LHLocalStorae _instance = LHLocalStorae._internal();

  factory LHLocalStorae(){
    return _instance;
  }

  LHLocalStorae._internal();
  final _storage = GetStorage();
  Future<void> saveData<LH>(String key, LH value) async {
    await _storage.write(key, value);
  }
  LH? readData<LH>(String key) {
    return _storage.read<LH>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }

}