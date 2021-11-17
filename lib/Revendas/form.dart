import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:master_revenda/Revendas/widget/about.dart';
import 'package:master_revenda/Revendas/widget/content_intro.dart';
import 'package:master_revenda/Revendas/widget/detail_app_bar.dart';
import 'package:master_revenda/Revendas/widget/house_info.dart';
import 'package:master_revenda/Veiculos/list.dart';

class RevendaForm extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> revenda;

  const RevendaForm({Key? key, required this.revenda}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailAppBar(revenda: revenda),
        SizedBox(height: 20),
        About(revenda: revenda),
        SizedBox(height: 25),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VeiculoList(revenda: revenda)));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  primary: Theme.of(context).primaryColor,
                ),
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text('Entrar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)))))
      ],
    )));

    // return Scaffold(
    //   appBar: AppBar(title: Text(revenda['nome'])),
    // );
  }
}
