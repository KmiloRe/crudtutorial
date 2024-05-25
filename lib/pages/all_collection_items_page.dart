import 'package:crudtutorial/widgets/my_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mycollection extends StatefulWidget {
  const Mycollection({super.key});

  @override
  State<Mycollection> createState() => _MycollectionState();
}

class _MycollectionState extends State<Mycollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        drawer: const MyDrawer(),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('My Collection'),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: GridB(),
                ),
              ],
            ),
          ),
        ));
  }
}

class GridB extends StatefulWidget {
  const GridB({super.key});

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
//todo: vista de admin donde cree nuevos items (debera subir imagen y campos de texto)
  //*collection (title: String, año: String, fabricante: String, image: url)

  final List<Map<String, dynamic>> gridMap = [
    //cabe aclarar que no tenemos licensias de las imagenes mostradas

    {
      "title": "Pablo Loaiza ",
      "price": "id 000195443",
      "images": "assets/logoByHam.png",
      "mail": "pablo.loaiza@upb.edu.co",
    },
    {
      "title": "Camilo Restrepo ",
      "price": "000195443",
      "images": "assets/logoByHam.png",
      "mail": "camilo.restrepor@upb.edu.co",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 310,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                //Image(image: AssetImage('assets/bb.jpg')),
                //Image de internet (pegando url)
                /* 
                 Image.network(
                  "${gridMap.elementAt(index)['images']}",
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                */
                //Imagen local
                child: Image(
                  //image: AssetImage("${gridMap.elementAt(index)['images']}"),
                  image: AssetImage("assets/logoByHam.png"),

                  height: 170,
                  width: 170,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${gridMap.elementAt(index)['title']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "${gridMap.elementAt(index)['price']}",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    // Text(
                    //   "${gridMap.elementAt(index)['mail']}",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w700,
                    //     color: Colors.grey.shade500,
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.heart,
                            //CupertinoIcons.heart_solid,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
