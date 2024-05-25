import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//todo: change esto a notas por uid
class FirestoreService {
// * get collection of notes
  final CollectionReference notas =
      FirebaseFirestore.instance.collection('notas');
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('Users');

// * Get current user
  User? user = FirebaseAuth.instance.currentUser;

  // get the notas collection for the current user
  //user id

  CollectionReference get notasCollection {
    return _usersCollection.doc(user!.uid).collection('Mynotas');
  }

// * Create: nueva nota
  Future<void> addNota(String nota) async {
    // DocumentSnapshot<Object?>? data = await _usersCollection.doc(id).get();
    await notasCollection.add({
      'nota': nota,
      'createdAt': FieldValue.serverTimestamp(),
      'localtime': Timestamp.now(),
    });
  }

// * Read: get notas
  Stream<QuerySnapshot> getNotasStream() {
    final notasStream =
        notasCollection.orderBy('createdAt', descending: true).snapshots();

    return notasStream;
  }

// * Update: update nota given a note id

  Future<void> updateNota(String docID, String nota) async {
    await notasCollection.doc(docID).update({
      'nota': nota,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

// * Delete: delete nota given a note id

  Future<void> deleteNota(String docID) async {
    await notas.doc(docID).delete();
  }
}
