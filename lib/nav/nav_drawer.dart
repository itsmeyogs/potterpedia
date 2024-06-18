import 'package:flutter/material.dart';
import 'package:potterpedia/main.dart';
import 'package:potterpedia/pages/all_spells_page.dart';
import 'package:potterpedia/pages/characters_in_a_home_page.dart';
import 'package:potterpedia/pages/hogwarts_staff_page.dart';
import 'package:potterpedia/pages/hogwarts_students_page.dart';
import 'package:potterpedia/pages/home_page.dart';
import 'package:provider/provider.dart';


class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedItem = context.watch<NavState>().selectedNav;
    var selectedTileColor = Colors.grey.withOpacity(0.5);
    var selectedColor = Colors.black;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Image.asset('images/logo.png')),
          ListTile(
            selected: selectedItem == 0 ? true : false,
            selectedTileColor: selectedTileColor,
            selectedColor: selectedColor,
            leading: const Icon(Icons.people_alt_outlined),
            title: Text("All Characters", style: TextStyle(fontSize: 15,fontWeight: selectedItem==0? FontWeight.bold:FontWeight.normal),),
            onTap: () {
              context.read<NavState>().setNav(0);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const HomePage()));
            },
          ),
          ListTile(
              selected: selectedItem == 1 ? true : false,
              selectedTileColor: selectedTileColor,
              selectedColor: selectedColor,
              leading: const Icon(Icons.book_outlined),
              title: Text("All Spells", style: TextStyle(fontSize: 15,fontWeight: selectedItem==1? FontWeight.bold:FontWeight.normal)),
              onTap: () {
                context.read<NavState>().setNav(1);
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const AllSpellsPage()));
              }),
          ListTile(
              selected: selectedItem == 2 ? true : false,
              selectedTileColor: selectedTileColor,
              selectedColor: selectedColor,
              leading: const Icon(Icons.school_outlined),
              title: Text("Hogwarts Students", style: TextStyle(fontSize: 15,fontWeight: selectedItem==2? FontWeight.bold:FontWeight.normal)),
              onTap: () {
                context.read<NavState>().setNav(2);
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const HogwartsStudentsPage()));
              }),
          ListTile(
              selected: selectedItem == 3 ? true : false,
              selectedTileColor: selectedTileColor,
              selectedColor: selectedColor,
              leading: const Icon(Icons.account_box_outlined),
              title: Text("Hogwarts Staff", style: TextStyle(fontSize: 15,fontWeight: selectedItem==3? FontWeight.bold:FontWeight.normal)),
              onTap: () {
                context.read<NavState>().setNav(3);
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const HogwartsStaffPage()));
              }),
          ListTile(
              selected: selectedItem == 4 ? true : false,
              selectedTileColor: selectedTileColor,
              selectedColor: selectedColor,
              leading: const Icon(Icons.home_work_outlined),
              title: Text("Characters in a House", style: TextStyle(fontSize: 15,fontWeight: selectedItem==4? FontWeight.bold:FontWeight.normal)),
              onTap: () {
                context.read<NavState>().setNav(4);
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const CharactersInAHomePage()));
              })
        ],
      ),
    );
  }
}
