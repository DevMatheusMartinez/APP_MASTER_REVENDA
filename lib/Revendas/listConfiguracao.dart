import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:master_revenda/Revendas/Revenda.dart';
import 'package:master_revenda/Revendas/editarRevenda.dart';
import 'package:master_revenda/Revendas/form.dart';
import 'package:master_revenda/Revendas/lista.dart';

import 'package:flutter/material.dart';
import 'package:master_revenda/Veiculos/view.dart';
import 'package:master_revenda/Veiculos/viewEditCar.dart';
import 'package:master_revenda/main.dart';

class ListConfiguracao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Revenda")
                    .where('uidAdmin',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
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
                              leading: Image.asset("assets/iconLoja.png"),
                              title: Text("Editar Revenda"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditarRevenda(
                                              revenda: documents,
                                            )));
                              }));
                    }).toList(),
                  );
                })));
  }
}
