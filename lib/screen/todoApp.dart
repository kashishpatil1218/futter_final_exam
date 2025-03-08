import 'package:flutter/material.dart';
import 'package:futter_final_exam/screen/auth/signIn.dart';
import 'package:futter_final_exam/service/auth_service.dart';

import 'home_page.dart';



class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthService.authService.getCurrentUser() != null ? const TodoHomePage() : const Signin();
  }
}

