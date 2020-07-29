import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_firebase_app/domain/auth/i_auth_facade.dart';
import 'package:notes_firebase_app/domain/core/errors.dart';
import 'package:notes_firebase_app/injection.dart';

extension FirestoreX on Firestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());

    return Firestore.instance.collection('user').document(user.id.getORCrash());
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteCollection => collection('notes');
}
