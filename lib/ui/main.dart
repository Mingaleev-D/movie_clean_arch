import 'package:flutter/material.dart';
import 'package:movie_clean_arch/ui/config/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/router/app_router.dart';
import 'screens/screens.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
    );
  }
}
