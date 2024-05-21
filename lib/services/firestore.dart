import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
//get collection of notes
  final CollectionReference notas =
      FirebaseFirestore.instance.collection('notas');

// * Create: nueva nota
  Future<void> addNota(String title) async {
    await notas.add({
      'title': title,
      'createdAt': FieldValue.serverTimestamp(),
      'localtime': Timestamp.now(),
    });
  }

// * Read: get notas
  Stream<QuerySnapshot> getNotasStream() {
    final notasStream =
        notas.orderBy('createdAt', descending: true).snapshots();

    return notasStream;
  }

// * Update: update nota given a note id

// * Delete: delete nota given a note id
}
