import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:post_architecture_seed/data_providers/local/auth_local_provider.dart';
import 'package:post_architecture_seed/data_providers/remote/auth_remote_provider.dart';
import 'package:post_architecture_seed/repositories/auth_repository.dart';
import 'package:post_architecture_seed/usecases/sign_in_usecase.dart';
import 'package:post_architecture_seed/views/pages/sign_in_controller.dart';
import 'package:post_architecture_seed/views/pages/sign_in_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    // todo: 바인딩은 나중에..
    Get.put(AuthLocalProvider());
    Get.put(AuthRemoteProvider());
    Get.put(AuthRepository());
    Get.put(SignInController(SignInUseCase()));

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SignInPage(),
    );
  }
}
