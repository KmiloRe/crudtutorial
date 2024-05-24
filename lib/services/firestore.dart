import 'package:cloud_firestore/cloud_firestore.dart';

//todo: change esto a notas por uid
class FirestoreService {
//get collection of notes
  final CollectionReference notas =
      FirebaseFirestore.instance.collection('notas');

// * Create: nueva nota
  Future<void> addNota(String nota) async {
    await notas.add({
      'nota': nota,
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

  Future<void> updateNota(String docID, String nota) async {
    await notas.doc(docID).update({
      'nota': nota,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

// * Delete: delete nota given a note id

  Future<void> deleteNota(String docID) async {
    await notas.doc(docID).delete();
  }
}
