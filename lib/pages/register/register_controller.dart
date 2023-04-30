import 'package:e_learning_app/common/widgets/index.dart';
import 'package:e_learning_app/common/values/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/register_blocs.dart';

class RegisterController {
  RegisterController({required this.context});

  final BuildContext context;

  Future<void> handleRegisterUser() async {
    final state = context.read<RegisterBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfoMsg(message: "Username tidak boleh kosong", context: context);
      return;
    }
    if (email.isEmpty) {
      toastInfoMsg(message: "Email tidak boleh kosong", context: context);
      return;
    }
    if (password.isEmpty) {
      toastInfoMsg(message: "Password tidak boleh kosong", context: context);
      return;
    }
    if (rePassword.isEmpty) {
      toastInfoMsg(
          message: "Password konfirmasi tidak boleh kosong", context: context);
      return;
    }

    if (password != rePassword) {
      toastInfoMsg(message: "password tidak sama", context: context);
      return;
    }

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfoMsg(
            message: "An link activate has been sent to your register email",
            context: context,
            backgroundColor: kgreen);
        await Future.delayed(const Duration(seconds: 2));

        Navigator.of(context).pop();
      } else {
        toastInfoMsg(message: "is wrong credential", context: context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfoMsg(message: "Kombinasi password lemah !", context: context);
      } else if (e.code == "email-already-in-use") {
        toastInfoMsg(message: "Email ini telah digunakan", context: context);
      } else if (e.code == "invalid-email") {
        toastInfoMsg(
            message: "Format email yang anda masukan salah", context: context);
      }
    }
  }
}
