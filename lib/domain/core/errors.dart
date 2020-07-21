import 'package:notes_firebase_app/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanations =
        'Encountered a ValueFailure at an unrecoverable point. Terminating';
    return Error.safeToString('$explanations. Failure was: $valueFailure');
  }
}
