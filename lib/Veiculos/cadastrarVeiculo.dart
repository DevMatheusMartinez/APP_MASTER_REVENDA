import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_revenda/Login/common/theme_helper.dart';
import 'package:master_revenda/Login/pages/login_page_cliente.dart';
import 'package:master_revenda/Login/pages/widgets/header_widget.dart';

class CadastrarVeiculo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CadastrarVeiculo();
  }
}

class _CadastrarVeiculo extends State<CadastrarVeiculo> {
  final _formKey = GlobalKey<FormState>();
  final placaController = TextEditingController();
  final renavamController = TextEditingController();
  final tipoController = TextEditingController();
  final combustivelController = TextEditingController();
  final fabricanteController = TextEditingController();
  final crlvController = TextEditingController();
  final modeloController = TextEditingController();
  final kmController = TextEditingController();
  final proprietarioController = TextEditingController();
  final proprietarioCpfCnpjController = TextEditingController();
  final corController = TextEditingController();
  final chassiController = TextEditingController();
  final motorController = TextEditingController();
  final descricaoController = TextEditingController();
  final portasController = TextEditingController();
  final cambioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.directions_car),
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
                                  Icons.directions_car,
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
                            controller: placaController,
                            decoration: ThemeHelper()
                                .textInputDecoration("Placa*", "Placa"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite a placa do veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                            controller: renavamController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Renavam*", "Digite o renavam do veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o renavam";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                            controller: tipoController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Tipo*", "Digite o tipo de veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o tipo de veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        Container(
                          child: TextFormField(
                            controller: combustivelController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Combustivel*",
                                "Digite o combustivel de veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o combustivel do veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: fabricanteController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Fabricante*",
                                "Digite o fabricante do veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o fabricante do veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: crlvController,
                            decoration: ThemeHelper().textInputDecoration(
                                "CRLV*", "Digite o CRLV do veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o CRLV do veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: modeloController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Modelo*", "Digite o modelo do veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o modelo do veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: kmController,
                            decoration: ThemeHelper().textInputDecoration(
                                "KM*", "Digite o km do veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o km do veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: corController,
                            decoration: ThemeHelper().textInputDecoration(
                                "cor*", "Digite a cor do veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite a cor do veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: proprietarioController,
                            decoration: ThemeHelper().textInputDecoration(
                                "proprietario*",
                                "Digite o proprietario do veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o proprietário do veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: proprietarioCpfCnpjController,
                            decoration: ThemeHelper().textInputDecoration(
                                "cpf/cnpj proprietario*",
                                "Digite o cpf/cnpj do proprietario do veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o cpf/cnpj do proprietário do veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: chassiController,
                            decoration: ThemeHelper().textInputDecoration(
                                "chassi*", "Digite o chassi do veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o chassi do veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: motorController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Motor*", "Digite o motor do veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o motor do veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: portasController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Portas*",
                                "Digite a quantidade de portas do veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite a quantidade de portas do veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: cambioController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Cambio*", "Digite o cambio veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o cambio do veiculo";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: descricaoController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Descrição*", "Digite a descrição do veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite a descrição do veiculo";
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
                                "Cadastrar".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              print('Antes');

                              var useruid =
                                  await FirebaseAuth.instance.currentUser?.uid;

                              await FirebaseFirestore.instance
                                  .collection('veiculos')
                                  .doc()
                                  .set({
                                "placa": placaController.text,
                                "renavam": renavamController.text,
                                "tipo": tipoController.text,
                                "combustivel": combustivelController.text,
                                "fabricante": fabricanteController.text,
                                "crlv": crlvController.text,
                                "modelo": modeloController.text,
                                "km": kmController.text,
                                "proprietario": proprietarioController.text,
                                "proprietario_doc":
                                    proprietarioCpfCnpjController.text,
                                "cor": corController.text,
                                "chassi": chassiController.text,
                                "motor": motorController.text,
                                "sobre": descricaoController.text,
                                "portas": portasController.text,
                                "cambio": cambioController.text,
                                "userUid":
                                    FirebaseAuth.instance.currentUser!.uid
                              });

                              placaController.clear();
                              renavamController.clear();
                              tipoController.clear();
                              combustivelController.clear();
                              fabricanteController.clear();
                              crlvController.clear();
                              modeloController.clear();
                              kmController.clear();
                              proprietarioController.clear();
                              proprietarioCpfCnpjController.clear();
                              corController.clear();
                              chassiController.clear();
                              motorController.clear();
                              descricaoController.clear();
                              portasController.clear();
                              cambioController.clear();
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
