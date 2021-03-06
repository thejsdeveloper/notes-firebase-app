import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase_app/application/auth/auth_bloc.dart';
import 'package:notes_firebase_app/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            print('I am authenticated');
            // ExtendedNavigator.of(context).pushSplashPage();
          },
          unAuthenticated: (_) {
            ExtendedNavigator.of(context).pushSignInPage();
          },
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
