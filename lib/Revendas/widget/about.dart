import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> revenda;
  const About({Key? key, required this.revenda}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sobre',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            revenda['descricao'],
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }
}
