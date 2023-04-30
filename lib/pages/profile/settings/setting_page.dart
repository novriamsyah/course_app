import 'package:e_learning_app/common/routes/routes.dart';
import 'package:e_learning_app/common/values/constant.dart';
import 'package:e_learning_app/common/values/contant_value.dart';
import 'package:e_learning_app/global.dart';
import 'package:e_learning_app/pages/application/bloc/application_blocs.dart';
import 'package:e_learning_app/pages/application/bloc/application_events.dart';
import 'package:e_learning_app/pages/profile/settings/bloc/setting_states.dart';
import 'package:e_learning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:e_learning_app/pages/profile/settings/widgets/appbar_custom.dart';
import 'package:e_learning_app/pages/profile/settings/widgets/custom_button_logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void onPressLogout() {
    context.read<ApplicationBloc>().add(const TriggerPageEvent(0));

    GlobalApp.storageServices
        .setLogout(ConstanValueApp.STORAGE_USER_LOGGED_TOKEN);

    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: appbarCustom(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return SizedBox(
              child: Column(
                children: [
                  CustomButtonLogout(
                    context: context,
                    onPressed: onPressLogout,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
