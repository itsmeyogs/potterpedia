import 'package:flutter/material.dart';
import 'package:potterpedia/api/potterpedia_api.dart';

import '../nav/nav_drawer.dart';
import '../widgets/item_character.dart';

class HogwartsStudentsPage extends StatefulWidget {
  const HogwartsStudentsPage({super.key});

  @override
  State<HogwartsStudentsPage> createState() => _HogwartsStudentsPageState();
}

class _HogwartsStudentsPageState extends State<HogwartsStudentsPage> {
  @override
  void initState() {
    PotterpediaApi.getHogwartsStudents();
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
        future: PotterpediaApi.getHogwartsStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null) {
            final characters = snapshot.data!;
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12, top: 8, bottom: 8),
                    child: Text(
                      "Hogwarts Students",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
