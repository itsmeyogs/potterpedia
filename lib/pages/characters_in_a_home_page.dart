import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potterpedia/main.dart';
import 'package:provider/provider.dart';

import '../api/potterpedia_api.dart';
import '../nav/nav_drawer.dart';
import '../widgets/item_character.dart';


const List<String> listHouse = <String>['Gryffindor','Slytherin', 'Hufflepuff', 'Ravenclaw'];

class CharactersInAHomePage extends StatefulWidget{
  const CharactersInAHomePage({super.key});

  @override
  State<CharactersInAHomePage> createState() => _CharactersInAHomePageState();
}

class _CharactersInAHomePageState extends State<CharactersInAHomePage> {
  var selectedHouse = listHouse.first;


  @override
  void initState() {
    PotterpediaApi.getCharactersInAHome(selectedHouse);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('images/logo.png', height: 35),
      ),
      drawer: const NavDrawer(),
      body: FutureBuilder(
        future: PotterpediaApi.getCharactersInAHome(selectedHouse),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null) {
            final characters = snapshot.data!;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 8, top: 8, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Characters in a House",
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedHouse,
                            items: listHouse.map((house) => DropdownMenuItem<String>(
                              value: house,
                              child: Text(house, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            )).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedHouse = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  sliver: SliverGrid.count(
                    crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 0.75,
                    children: List.generate(characters.length, (index) {
                      return ItemCharacter(character: characters[index]);
                    }),
                  ),
                ),
              ],
            );
          }
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        },
      ),
    );
  }
}