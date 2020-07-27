import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_firebase_app/domain/notes/note.dart';
import 'package:notes_firebase_app/domain/notes/note_failure.dart';

abstract class INoteRepository {
  // watch notes
  // watch uncompleted notes
  // CUD
  Stream<Either<NoteFailure, KtList<Note>>> watchAll();
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();
  Future<Either<NoteFailure, Unit>> create(Note note);
  Future<Either<NoteFailure, Unit>> update(Note note);
  Future<Either<NoteFailure, Unit>> delete(Note note);
}
