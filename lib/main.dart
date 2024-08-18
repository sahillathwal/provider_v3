import 'package:flutter/material.dart';
import 'package:provider_arc/provider_setup.dart';
import 'package:provider_arc/ui/router.dart' as route;
import 'package:provider/provider.dart';

import 'core/constants/app_contstants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePaths.login,
        onGenerateRoute: route.Router.generateRoute,
      ),
    );
  }
}
