import 'dart:developer';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:master_revenda/Clientes/ContratoView.dart';
import 'package:master_revenda/Home/homeVehicles.dart';
import 'package:master_revenda/Revendas/Revenda.dart';
import 'package:master_revenda/Revendas/form.dart';
import 'package:master_revenda/Revendas/lista.dart';

import 'package:flutter/material.dart';
import 'package:master_revenda/main.dart';
import 'package:flutter/foundation.dart';

class ListaContratoCliente extends StatefulWidget {
  @override
  _ListaContratoCliente createState() => _ListaContratoCliente();
}

class _ListaContratoCliente extends State<ListaContratoCliente> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("cliente_contrato")
                    .where('revendaUid',
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
                              leading: Image.asset("assets/clienteIcon.png"),
                              title: Text(documents['nome_completo']),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ContratoView(
                                              contrato: documents,
                                            )));
                              }));
                    }).toList(),
                  );
                })));
  }
}
