import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (FirebaseAuth.instance.currentUser != null) {
      resolver.next(true);
    } else {
      router.push(AuthGateRoute());
    }
  }
}
