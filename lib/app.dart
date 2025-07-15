import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managers_app/config/providers/cat_provider.dart';
import 'package:state_managers_app/config/providers/shopping_list_provider.dart';
import 'package:state_managers_app/config/routes/app_routes.dart';
import 'package:state_managers_app/ui/pages/cat_state.dart';
import 'package:state_managers_app/ui/pages/home.dart';
import 'package:weinds/foundations/themes/weinds_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CatProvider()),
        ChangeNotifierProvider(create: (_) => ShoppingListProvider()),
      ],
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
