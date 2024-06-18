import 'package:flutter/material.dart';
import 'package:potterpedia/main.dart';
import 'package:potterpedia/widgets/item_spell.dart';
import 'package:provider/provider.dart';

import '../api/potterpedia_api.dart';
import '../nav/nav_drawer.dart';

class AllSpellsPage extends StatefulWidget {
  const AllSpellsPage({super.key});

  @override
  State<AllSpellsPage> createState() => _AllSpellsPageState();
}

class _AllSpellsPageState extends State<AllSpellsPage> {
  @override
  void initState() {
    PotterpediaApi.getAllSpells();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('images/logo.png', height: 35),
      ),
      drawer: const NavDrawer(),
      body: FutureBuilder(
        future: PotterpediaApi.getAllSpells(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null) {
            final spells = snapshot.data!;
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12, top: 8, bottom: 8),
                    child: Text(
                      "All Spells",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverPadding(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    sliver: SliverList.builder(
                        itemCount: spells.length,
                        itemBuilder: (context, index) {
                          return ItemSpell(spell: spells[index]);
                        })),
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
