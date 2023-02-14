import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:post_architecture_seed/data_providers/constants.dart';
import 'package:post_architecture_seed/data_providers/local/auth_local_provider.dart';
import 'package:post_architecture_seed/data_providers/remote/auth_remote_provider.dart';
import 'package:post_architecture_seed/entities/user.dart';

class AuthRepository extends GetxController {
  final _authLocalProvider = Get.find<AuthLocalProvider>();
  final _authRemoteProvider = Get.find<AuthRemoteProvider>();
  final _userStream = StreamController<User>.broadcast();

  final _store = GetStorage();

  get userStream => _userStream;

  Future<void> signIn(String email, String password) async {
    final result = await _authRemoteProvider.requestSignIn(
        email: email, password: password);

    String? accessToken = result?['data']['accessToken'];

    if (accessToken != null) {
      _authLocalProvider.setAccessToken(accessToken);
    }
  }

  @override
  void onInit() {
    // todo: 이런 부분은 어떻게 처리 하면 좋을지?
    _store.listenKey(accessTokenKey, (value) {
      _addUser(JwtDecoder.decode(value));
    });
    super.onInit();
  }

  void _addUser(Map<String, dynamic> value) {
    try {
      _userStream.add(User.fromJson(value));
    } catch (e) {
      print(e);
    }
  }
}
