import 'package:flutter/material.dart';
import 'package:potterpedia/models/character.dart';
import 'package:potterpedia/widgets/item_detail.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Detail Character",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black.withOpacity(0.1),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: size.width / 1.5,
                  child: Image.network(
                    character.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              child: Container(
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      colors: [Color(0xFF000000), Color(0xFF808080)],
                      center: Alignment.center,
                      radius: 5.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      character.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: size.width/3,child: const Padding(
                        padding: EdgeInsets.only(left: 23),
                        child: Text("Alternate Names"),
                      )),
                      const Text(":"),
                      SizedBox(
                        width: size.width/3,
                        child: character.alternateNames.isNotEmpty? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: character.alternateNames.map((item)=>Text(item)).toList(),
                        ): const Text("-"),
                      ),
                    ],
                  ),
                  const Divider(),
                  ItemDetail(name: "Species", value: character.species),
                  const Divider(),
                  ItemDetail(name: "Gender", value: character.gender),
                  const Divider(),
                  ItemDetail(name: "House", value: character.house),
                  const Divider(),
                  ItemDetail(name: "Date Of Birth", value: character.dateOfBirth!=null? character.dateOfBirth!:"-"),
                  const Divider(),
                  ItemDetail(name: "Wizard", value: character.wizard?"Yes":"No"),
                  const Divider(),
                  ItemDetail(name: "Ancestry", value: character.ancestry),
                  const Divider(),
                  ItemDetail(name: "Eye Colour", value: character.eyeColour),
                  const Divider(),
                  ItemDetail(name: "Hair Colour", value: character.hairColour),
                  const Divider(),
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide())
                        ),
                        child: const Text("Wand"),
                      ),
                      ItemDetail(name: "Wood", value: character.wand.wood),
                      ItemDetail(name: "Core", value: character.wand.core),
                      ItemDetail(name: "Length", value: character.wand.length!=null? "${character.wand.length!} inch" :"-")
                    ],
                  ),
                  const Divider(),
                  ItemDetail(name: "Patronus", value: character.patronus),
                  const Divider(),
                  ItemDetail(name: "Hogwarts Student", value: character.hogwartsStudent? "Yes":"No"),
                  const Divider(),
                  ItemDetail(name: "Hogwarts Staff", value: character.hogwartsStaff?"Yes":"No"),
                  const Divider(),
                  ItemDetail(name: "Actor", value: character.actor),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: size.width/3,child: const Padding(
                        padding: EdgeInsets.only(left: 23),
                        child: Text("Alternate Actors"),
                      )),
                      const Text(":"),
                      SizedBox(
                        width: size.width/3,
                        child: character.alternateActors.isNotEmpty? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: character.alternateActors.map((item)=>Text(item)).toList(),
                        ): const Text("-"),
                      ),
                    ],
                  ),
                  const Divider(),
                  ItemDetail(name: "Alive", value: character.alive?"Yes":"No"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
