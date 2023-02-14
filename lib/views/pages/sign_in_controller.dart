import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:post_architecture_seed/usecases/sign_in_usecase.dart';
import 'package:post_architecture_seed/entities/user.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final SignInUseCase signInUseCase;

  Rxn<User> user = Rxn();

  SignInController(this.signInUseCase);

  void signInSubmit() {
    signInUseCase.signIn(emailController.text, passwordController.text);
  }

  @override
  void onReady() {
    signInUseCase.userStream.listen((user) => this.user(user));
    super.onReady();
  }
}
