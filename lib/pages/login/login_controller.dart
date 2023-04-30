import 'package:e_learning_app/common/values/contant_value.dart';
import 'package:e_learning_app/global.dart';
import 'package:e_learning_app/pages/login/bloc/login_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/index.dart';

class LoginController {
  const LoginController({required this.context});

  final BuildContext context;

  Future<void> handleLogin(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<LoginBloc>(context).state
        final state = context.read<LoginBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfoMsg(message: "Email tidak boleh kosong", context: context);
          return;
        }

        if (password.isEmpty) {
          toastInfoMsg(
              message: "Password tidak boleh kosong", context: context);
          return;
        }

        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          if (credential.user == null) {
            toastInfoMsg(
                message: "kredensial kamu masukan tidak ditemukan",
                context: context);
            return;
          }

          if (!credential.user!.emailVerified) {
            toastInfoMsg(
                message: "Mohon aktivasi akun email kamu !", context: context);
            return;
          }

          var user = credential.user;

          if (user != null) {
            //we got verified user from Firebase
            GlobalApp.storageServices.setCheckLogin(
                ConstanValueApp.STORAGE_USER_LOGGED_TOKEN, "logged");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            //we have error getting from Firebase
            toastInfoMsg(
                message: "akun kamu tidak ditemukan", context: context);
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            toastInfoMsg(
                message: "Maaf, user tidak ditemukan", context: context);
          } else if (e.code == "wrong-password") {
            toastInfoMsg(message: "Password anda salah", context: context);
          } else if (e.code == "invalid-email") {
            toastInfoMsg(
                message: "Format email yang anda masukan salah",
                context: context);
          }
        }
      }
    } catch (e) {}
  }
}
