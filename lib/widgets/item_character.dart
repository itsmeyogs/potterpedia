import 'package:flutter/material.dart';
import 'package:potterpedia/pages/detail_page.dart';

import '../models/character.dart';


class ItemCharacter extends StatelessWidget{
  const ItemCharacter({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    var nameStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> DetailPage(character: character)));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: character.image!="" ?
                Image.network(
                  character.image,
                  fit: BoxFit.fill,
                ):
                    Image.asset('images/no_available.png', fit: BoxFit.fill,)
                ,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: orientation==Orientation.portrait?size.width/2.1:size.width/4.2,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(character.name, textAlign: TextAlign.center, style: nameStyle),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}