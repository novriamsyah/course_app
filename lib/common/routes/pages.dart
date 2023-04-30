import 'package:e_learning_app/common/routes/names.dart';
import 'package:e_learning_app/global.dart';
import 'package:e_learning_app/pages/application/bloc/application_blocs.dart';
import 'package:e_learning_app/pages/application/application_page.dart';
import 'package:e_learning_app/pages/home/bloc/home_blocs.dart';
import 'package:e_learning_app/pages/home/home_page.dart';
import 'package:e_learning_app/pages/login/bloc/login_blocs.dart';
import 'package:e_learning_app/pages/login/login_page.dart';
import 'package:e_learning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:e_learning_app/pages/profile/settings/setting_page.dart';
import 'package:e_learning_app/pages/register/bloc/register_blocs.dart';
import 'package:e_learning_app/pages/register/register_page.dart';
import 'package:e_learning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:e_learning_app/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        routes: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        routes: AppRoutes.SIGN_IN,
        page: const LoginPage(),
        bloc: BlocProvider(
          create: (_) => LoginBloc(),
        ),
      ),
      PageEntity(
        routes: AppRoutes.SIGN_UP,
        page: const RegisterPage(),
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      PageEntity(
        routes: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => ApplicationBloc(),
        ),
      ),
      PageEntity(
        routes: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => HomeBloc(),
        ),
      ),
      PageEntity(
        routes: AppRoutes.SETTING_PAGE,
        page: const SettingPage(),
        bloc: BlocProvider(
          create: (_) => SettingBloc(),
        ),
      ),
    ];
  }

  //return all BlocProvider in use
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entry screen as we click on the navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route home matching when navigator get triggred
      var result = routes().where((element) => element.routes == settings.name);
      if (result.isNotEmpty) {
        //cek apakah sudah pernah klik get started
        //kalau sudah gak perlu nampilin onboarding lagi
        bool deviceFirstOpen =
            GlobalApp.storageServices.getDeviceFirstOpen(); // true or false

        if (result.first.routes == AppRoutes.INITIAL && deviceFirstOpen) {
          //cek apakah sudah pernah klik log in
          bool isLogged = GlobalApp.storageServices.getStorageUserLogged();
          if (isLogged) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          //if condition true redirect to login page
          return MaterialPageRoute(
              builder: (_) => const LoginPage(), settings: settings);
        }

        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const LoginPage(), settings: settings);
  }
}

class PageEntity {
  String routes;
  Widget page;
  dynamic bloc;

  PageEntity({required this.routes, required this.page, this.bloc});
}
