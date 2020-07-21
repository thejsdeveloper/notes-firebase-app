import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'auth_failure.dart';
import 'value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password passwprd,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password passwprd,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
