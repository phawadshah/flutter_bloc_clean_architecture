import 'package:flutter/material.dart';
import 'package:sgm_block/core/services/service_locator.dart';
import 'package:sgm_block/utils/routes/router.dart';
import 'package:sgm_block/utils/theme/theme.dart';

void main() {
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: KTheme.dark,
      routerConfig: KRouter.router,
    );
  }
}
