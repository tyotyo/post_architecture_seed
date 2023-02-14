import 'package:get/get.dart';
import 'package:post_architecture_seed/entities/user.dart';
import 'package:post_architecture_seed/repositories/auth_repository.dart';

class SignInUseCase {
  final _authRepository = Get.find<AuthRepository>();

  Stream<User> get userStream => _authRepository.userStream.stream;

  // todo: repository 에 parameter 를 정의 해놓고 써야 하는지..?
  Future<void> signIn(String email, String password) async {
    await _authRepository.signIn(email, password);
  }
}
