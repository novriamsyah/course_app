import 'package:e_learning_app/pages/register/bloc/register_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/login/bloc/login_blocs.dart';
import 'pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy:
              false, // untuk menentukan urutan pertama dijalankan / initial app
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ];
}
