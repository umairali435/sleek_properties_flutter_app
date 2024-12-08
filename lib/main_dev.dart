import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_properties_flutter/app.dart';
import 'package:sleek_properties_flutter/common/enums/env_enums.dart';
import 'package:sleek_properties_flutter/common/settings/logger_customizations/custom_logger.dart';
import 'package:sleek_properties_flutter/common/theme/theme_utils.dart';
import 'package:sleek_properties_flutter/common/utils/dep_injection.dart';
import 'package:flutter/material.dart';
import 'package:sleek_properties_flutter/presentation/home/bloc/home_bloc.dart';

Future<void> main() async {
  ThemeUtils.changeSystemUIOverlayStyle();
  final log = CustomLogger(className: 'main');
  try {
    log.i('Testing info logs');
    log.d('Testing debug logs');
    log.e('Testing error logs');
    log.w('Testing WTF logs');
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator(Env.dev);
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
        ],
        child: const MyApp(
          title: 'Test - Sleek',
          showDebugBanner: true,
        ),
      ),
    );
  } catch (e, s) {
    log.d("$e");
    log.d("$s");
  }
}
