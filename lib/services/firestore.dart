import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//todo: change esto a notas por uid
class FirestoreService {
  //current logged in user

  // * Get current user
  User? user = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get();
  }

// * get collection of notes
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('posts');
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('Users');

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
    await notasCollection.doc(docID).delete();
  }

//todo  Posts de mi grupo:

//* Create: nuevo post en grupo
  Future<void> addPost(String post) async {
    // DocumentSnapshot<Object?>? data = await _usersCollection.doc(id).get();
    await posts.add({
      'nota': post,

      //? 4jose: Que es el ! ???
      'owner': user!.uid,
      'createdAt': FieldValue.serverTimestamp(),
      'localtime': Timestamp.now(),
    });
  }

//* Read: get posts de mi grupo

  Stream<QuerySnapshot> getPostsStream() {
    final notasStream =
        posts.orderBy('createdAt', descending: true).snapshots();

    return notasStream;
  }

//* Update: update post en grupo

  Future<void> updatePost(String docID, String nota) async {
    await posts.doc(docID).update({
      'nota': nota,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

//* Delete: delete post en grupo
//todo: Security rule, solo el creador del post puede borrarlo
  Future<void> deletePost(String docID, String owner) async {
    // if(user!.uid == owner){

    // }
    await posts.doc(docID).delete();
  }
}
