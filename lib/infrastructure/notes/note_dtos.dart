import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_firebase_app/domain/core/value_objects.dart';
import 'package:notes_firebase_app/domain/notes/note.dart';
import 'package:notes_firebase_app/domain/notes/todo_item.dart';
import 'package:notes_firebase_app/domain/notes/value_object.dart';

part 'note_dtos.freezed.dart';
part 'note_dtos.g.dart';

@freezed
abstract class NoteDto implements _$NoteDto {
  const NoteDto._();

  const factory NoteDto({
    @JsonKey(ignore: true) String id,
    @required String body,
    @required int color,
    @required List<TodoItemDto> todos,
    @required @ServerTimestapmConverter() FieldValue serverTimeStamp,
  }) = _NoteDto;

  factory NoteDto.fromDomain(Note note) {
    return NoteDto(
      id: note.id.getORCrash(),
      body: note.body.getORCrash(),
      color: note.color.getORCrash().value,
      todos: note.todos
          .getORCrash()
          .map((todoItem) => TodoItemDto.fromDomain(todoItem))
          .asList(),
      serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueString(id),
      body: NoteBody(body),
      color: NoteColor(Color(color)),
      todos: List3(todos.map((dto) => dto.toDomain()).toImmutableList()),
    );
  }

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteDtoFromJson(json);

  factory NoteDto.fromFirestore(DocumentSnapshot document) =>
      NoteDto.fromJson(document.data).copyWith(id: document.documentID);
}

class ServerTimestapmConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestapmConverter();

  @override
  FieldValue fromJson(Object jsojsojson) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(Object fieldValue) => fieldValue;
}

@freezed
abstract class TodoItemDto implements _$TodoItemDto {
  const TodoItemDto._();

  const factory TodoItemDto({
    @required String id,
    @required String name,
    @required bool done,
  }) = _TodoItemDto;

  factory TodoItemDto.fromDomain(TodoItem todoItem) {
    return TodoItemDto(
      id: todoItem.id.getORCrash(),
      name: todoItem.name.getORCrash(),
      done: todoItem.done,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
      name: TodoName(name),
      id: UniqueId.fromUniqueString(id),
      done: done,
    );
  }

  factory TodoItemDto.fromJson(Map<String, dynamic> json) =>
      _$TodoItemDtoFromJson(json);
}
