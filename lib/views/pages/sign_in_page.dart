import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:post_architecture_seed/views/pages/sign_in_controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: Column(
        children: [
          _buildTextField(),
          Obx(() => Text('${controller.user.value?.userId}'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.signInSubmit,
        child: const Icon(Icons.login),
      ),
    );
  }

  Widget _buildTextField() {
    return Column(
      children: [
        TextFormField(
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: '이메일'),
        ),
        TextFormField(
          controller: controller.passwordController,
          obscureText: true,
          decoration: const InputDecoration(hintText: '패스워드'),
        ),
      ],
    );
  }
}
