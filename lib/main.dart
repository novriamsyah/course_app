import 'package:e_learning_app/common/routes/routes.dart';
import 'package:e_learning_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await GlobalApp.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375.0, 812.0),
        builder: (context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Course App',
          onGenerateRoute: AppPages.generateRouteSettings,
          // home: HomePage(),

          // routes: {
          //   "/login": (context) => const LoginPage(),
          //   "/register": (context) => const RegisterPage(),
          // },
        ),
      ),
    );
  }
}
