import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_revenda/Home/homeRevendedor.dart';
import 'package:master_revenda/Login/common/theme_helper.dart';
import 'package:master_revenda/Login/pages/login_page_cliente.dart';
import 'package:master_revenda/Login/pages/widgets/header_widget.dart';
import 'package:master_revenda/Veiculos/list.dart';

class EditarRevenda extends StatefulWidget {
  @override
  final QueryDocumentSnapshot<Object?> revenda;

  const EditarRevenda({Key? key, required this.revenda}) : super(key: key);
  State<StatefulWidget> createState() {
    return _EditarRevenda();
  }
}

class _EditarRevenda extends State<EditarRevenda> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nomeController = TextEditingController(text: widget.revenda['nome']);
    final nomeSocialController =
        TextEditingController(text: widget.revenda['nome_social']);
    final cnpjController = TextEditingController(text: widget.revenda['cnpj']);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.home),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.home,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            controller: nomeController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Nome*", "Digite o nome da revenda"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o nome da revenda";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: nomeSocialController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Nome Social*",
                                "Digite o nome social da revenda"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o nome social da revenda";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: cnpjController,
                            decoration: ThemeHelper().textInputDecoration(
                                "CNPJ*", "Digite o cnpj da revenda"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o cnpj da revenda";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Editar".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              var useruid =
                                  await FirebaseAuth.instance.currentUser?.uid;

                                  if(nomeController.text == ""){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("O nome é obrigátorio.")));
                                return;
                              }
                              else if(nomeSocialController.text == ""){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("A placa é inválida.")));
                                return;
                              }
                              else if(cnpjController.text == ""){
                                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("A placa é inválida.")));
                                 return;
                              }
                               else if(cnpjController.text.length != 14){
                                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("cnpj inválido")));
                                 return;
                              }

                              await FirebaseFirestore.instance
                                  .collection('Revenda')
                                  .doc(widget.revenda.id)
                                  .update({
                                "nome": nomeController.text,
                                "nome_social": nomeSocialController.text,
                                "cnpj": cnpjController.text,
                                "userAdmin":
                                    FirebaseAuth.instance.currentUser!.uid
                              });

                              nomeController.clear();
                              nomeSocialController.clear();
                              cnpjController.clear();

                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
