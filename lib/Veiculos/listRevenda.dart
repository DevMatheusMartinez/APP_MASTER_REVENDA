import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:master_revenda/Revendas/Revenda.dart';
import 'package:master_revenda/Revendas/form.dart';
import 'package:master_revenda/Revendas/lista.dart';

import 'package:flutter/material.dart';
import 'package:master_revenda/Veiculos/view.dart';
import 'package:master_revenda/main.dart';

class VeiculoList extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> revenda;

  const VeiculoList({Key? key, required this.revenda}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: StreamBuilder(
                stream: revenda.reference.collection('Veiculo').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    children: snapshot.data!.docs.map((documents) {
                      return Container(
                          color: Colors.white,
                          child: ListTile(
                              leading: Image.asset("assets/carro_header.jpeg"),
                              title: Text(documents['fabricante'] +
                                  " " +
                                  documents['modelo']),
                              subtitle: Text(documents['combustivel'] +
                                  " " +
                                  documents['portas'].toString() +
                                  " portas " +
                                  documents['cambio']),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CarDetail(
                                              uidRevenda: revenda.id,
                                              veiculo: documents,
                                            )));
                              }));
                    }).toList(),
                  );
                })));
  }
}
