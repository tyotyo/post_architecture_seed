import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:post_architecture_seed/data_providers/constants.dart';

class AuthLocalProvider extends GetxService {
  final _store = GetStorage();

  Future<void> setAccessToken(String accessToken) async {
    await _store.write(accessTokenKey, accessToken);
  }
}
