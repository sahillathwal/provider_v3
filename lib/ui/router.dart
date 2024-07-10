import 'package:flutter/material.dart';
import 'package:provider_arc/core/constants/app_contstants.dart';
import 'package:provider_arc/core/models/post.dart';
import 'package:provider_arc/ui/views/home_view.dart';
import 'package:provider_arc/ui/views/login_view.dart';
import 'package:provider_arc/ui/views/post_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutePaths.post:
        var post = settings.arguments as Post;
        return MaterialPageRoute(
            builder: (_) => PostView(
                  post: post,
                  key: null,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
