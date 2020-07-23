import 'package:auto_route/auto_route_annotations.dart';
import 'package:notes_firebase_app/presentation/sign_in/sign_in_page.dart';
import 'package:notes_firebase_app/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
  ],
  generateNavigationHelperExtension: true,
)
class $Router {}
