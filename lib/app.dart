import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managers_app/config/routes/app_routes.dart';
import 'package:state_managers_app/ui/pages/cat_state.dart';
import 'package:state_managers_app/ui/pages/home.dart';
import 'package:weinds/foundations/themes/weinds_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ligthThemeWeincode,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AppRoutes.home:
              return MaterialPageRoute(builder: (_) => const HomePage());
            case AppRoutes.stateCat:
              return MaterialPageRoute(builder: (_) => const CatStatePage());
            default:
              return MaterialPageRoute(builder: (_) => const HomePage());
          }
        },
      ),
    );
  }
}
