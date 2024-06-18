import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potterpedia/models/spell.dart';

class ItemSpell extends StatelessWidget {
  const ItemSpell({super.key, required this.spell});

  final Spell spell;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              spell.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(
              spell.description,
              style: const TextStyle(fontSize: 13),
              textAlign: TextAlign.justify,
            ),

          ]),
        ),
      ),
    );
  }
}
