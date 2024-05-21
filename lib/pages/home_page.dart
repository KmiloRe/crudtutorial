import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudtutorial/services/firestore.dart';
import 'package:flutter/material.dart';

//firesotre service
final FirestoreService firestoreService = FirestoreService();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final TextEditingController textontroller = TextEditingController();

  //open dialog box
  void openNoteBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textontroller,
              ),
              actions: [
                //button to guardar
                ElevatedButton(
                    onPressed: () {
                      if (docID == null) {
                        //add nota
                        FirestoreService().addNota(textontroller.text);
                      } else {
                        //update nota
                        firestoreService.updateNota(docID, textontroller.text);
                      }

                      //clear text controller
                      textontroller.clear();
                      //close dialog box
                      Navigator.pop(context);
                      // Navigator.of(context).pop();
                    },
                    child: const Text('Añadir')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openNoteBox();
          // Navigate to the AddNotePage
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getNotasStream(),
          builder: ((context, snapshot) {
            //if hay datos, get all
            if (snapshot.hasData) {
              List notasList = snapshot.data!.docs;
              //mostrar como lista
              return ListView.builder(
                itemCount: notasList.length,
                itemBuilder: (context, index) {
                  //get each individual doc
                  DocumentSnapshot document = notasList[index];
                  String docID = document.id;

                  //get nota from each doc
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  String notatexto = data['nota'];

                  //display as a list tile
                  return ListTile(
                    title: Text(notatexto),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //update
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            //delete nota
                            // firestoreService.updateNota(docID, 'fd');
                            openNoteBox(docID: docID);
                          },
                        ),
                        //delete
                        IconButton(
                          icon: const Icon(Icons.highlight_remove_sharp),
                          onPressed: () => firestoreService.deleteNota(docID),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            //if no data, return nothing
            else {
              //show text widget
              return const Text('No hay notas');
            }
          })),
    );
  }
}
