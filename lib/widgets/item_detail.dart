import 'package:flutter/cupertino.dart';

class ItemDetail extends StatelessWidget{
  const ItemDetail({super.key, required this.name, required this.value});

  final String name;
  final String value;

 @override
  Widget build(BuildContext context) {
   var size = MediaQuery.of(context).size;

   return Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       SizedBox(width: size.width/3,child: Padding(
         padding: const EdgeInsets.only(left: 16),
         child: Text(name),
       )),
       const Text(":"),
       SizedBox(width: size.width/3,child: Padding(
         padding: const EdgeInsets.only(left: 8.0),
         child: Text(value),
       ))
     ],
   );
  }
}