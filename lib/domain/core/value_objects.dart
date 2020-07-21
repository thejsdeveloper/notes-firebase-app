import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:notes_firebase_app/domain/core/errors.dart';

import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value(value: $value)';

  bool isValid() => value.isRight();

  /// Thows [UnexpectedValueError] conatining the [ValueFailure]

  T getORCrash() {
    // id = identity - same as writing (right) => right
    return value.fold(
      (f) => throw UnexpectedValueError(f),
      id,
    );
  }
}
