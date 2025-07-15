import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managers_app/config/providers/bloc/shopping_bloc.dart';
import 'package:state_managers_app/config/providers/cubit/cat_cubit.dart';
import 'package:state_managers_app/config/routes/app_routes.dart';
import 'package:state_managers_app/ui/pages/cat_state.dart';
import 'package:state_managers_app/ui/pages/home.dart';
import 'package:weinds/foundations/themes/weinds_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShoppingBloc()),
        BlocProvider(create: (context) => CatCubit()),
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
