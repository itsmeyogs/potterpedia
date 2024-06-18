import 'package:flutter/cupertino.dart';
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
                      SizedBox(width: size.width/3,child: Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Text("Alternate Names"),
                      )),
                      Text(":"),
                      SizedBox(
                        width: size.width/3,
                        child: character.alternateNames.isNotEmpty? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: character.alternateNames.map((item)=>Text(item)).toList(),
                        ): Text("-"),
                      ),
                    ],
                  ),
                  Divider(),
                  ItemDetail(name: "Species", value: character.species),
                  Divider(),
                  ItemDetail(name: "Gender", value: character.gender),
                  Divider(),
                  ItemDetail(name: "House", value: character.house),
                  Divider(),
                  ItemDetail(name: "Date Of Birth", value: character.dateOfBirth!=null? character.dateOfBirth!:"-"),
                  Divider(),
                  ItemDetail(name: "Wizard", value: character.wizard?"Yes":"No"),
                  Divider(),
                  ItemDetail(name: "Ancestry", value: character.ancestry),
                  Divider(),
                  ItemDetail(name: "Eye Colour", value: character.eyeColour),
                  Divider(),
                  ItemDetail(name: "Hair Colour", value: character.hairColour),
                  Divider(),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide())
                        ),
                        child: Text("Wand"),
                      ),
                      ItemDetail(name: "Wood", value: character.wand.wood),
                      ItemDetail(name: "Core", value: character.wand.core),
                      ItemDetail(name: "Length", value: character.wand.length!=null? "${character.wand.length!} inch" :"-")
                    ],
                  ),
                  Divider(),
                  ItemDetail(name: "Patronus", value: character.patronus),
                  Divider(),
                  ItemDetail(name: "Hogwarts Student", value: character.hogwartsStudent? "Yes":"No"),
                  Divider(),
                  ItemDetail(name: "Hogwarts Staff", value: character.hogwartsStaff?"Yes":"No"),
                  Divider(),
                  ItemDetail(name: "Actor", value: character.actor),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: size.width/3,child: Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Text("Alternate Actors"),
                      )),
                      Text(":"),
                      SizedBox(
                        width: size.width/3,
                        child: character.alternateActors.isNotEmpty? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: character.alternateActors.map((item)=>Text(item)).toList(),
                        ): Text("-"),
                      ),
                    ],
                  ),
                  Divider(),
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
