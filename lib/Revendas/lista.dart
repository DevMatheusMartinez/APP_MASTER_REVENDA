import 'dart:developer';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:master_revenda/Home/homeVehicles.dart';
import 'package:master_revenda/Revendas/Revenda.dart';
import 'package:master_revenda/Revendas/form.dart';
import 'package:master_revenda/Revendas/lista.dart';

import 'package:flutter/material.dart';
import 'package:master_revenda/main.dart';
import 'package:flutter/foundation.dart';

class RevendaListPage extends StatefulWidget {
  @override
  RevendaList createState() => RevendaList();
}

class RevendaList extends State<RevendaListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Revenda")
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
                              title: Text(documents['nome']),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeVehicles(revenda: documents)));
                              }));
                    }).toList(),
                  );
                })));
  }
}
