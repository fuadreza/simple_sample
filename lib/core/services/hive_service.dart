
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final HiveService hive = HiveService.instance;

class HiveService {

  //region INITIALIZE

  static const String BOX_TOKEN = 'boxToken';

  static const String KEY_TOKEN = 'keyToken';

  static final HiveService _instance = HiveService();

  static HiveService get instance => _instance;

  Future<void> init() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocDirectory.path);
  }

  //endregion


  //region SAVE

  saveToken(String token) async {
    final Box boxToken = await Hive.openBox(BOX_TOKEN);
    await boxToken.put(KEY_TOKEN, token);
    boxToken.close();
  }

  //endregion


  //region GETTER

  Future<String?> getToken() async {
    final Box boxToken = await Hive.openBox(BOX_TOKEN);
    String? token = await boxToken.get(KEY_TOKEN);
    boxToken.close();
    return token;
  }

  //endregion


  //region DELETE

  deleteToken() async {
    final Box boxToken = await Hive.openBox(BOX_TOKEN);
    await boxToken.delete(KEY_TOKEN);
    boxToken.close();
  }

  //endregion

}
