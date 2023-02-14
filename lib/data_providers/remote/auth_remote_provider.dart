import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:post_architecture_seed/data_providers/constants.dart';

class AuthRemoteProvider extends GetxService {
  final Dio _client = Dio(BaseOptions(
    contentType: 'application/json',
    maxRedirects: 5,
  ));

  Future<Map<String, dynamic>?> requestSignIn({
    required String email,
    required String password,
    String? fcmToken,
  }) async {
    final response = await _client.post('$host/v1/signin', data: {
      'v': 1,
      'email': email,
      'password': password,
      'role': 'driver',
      if (fcmToken != null) 'fcmToken': fcmToken,
    });

    if (response.statusCode == 200) {
      return response.data;
    }

    return null;
  }
}
