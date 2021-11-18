import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_revenda/Login/common/theme_helper.dart';
import 'package:master_revenda/Login/pages/login_page_cliente.dart';
import 'package:master_revenda/Login/pages/widgets/header_widget.dart';

class CriarContrato extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> veiculo;
  final String uidRevenda;

  const CriarContrato(
      {Key? key, required this.uidRevenda, required this.veiculo})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CriarContrato();
  }
}

class _CriarContrato extends State<CriarContrato> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final dataNascimentoController = TextEditingController();
  final cpfCnpjController = TextEditingController();
  final rgController = TextEditingController();
  final rgOrgController = TextEditingController();
  final rgUfController = TextEditingController();
  final rgDateController = TextEditingController();
  final nacionalidadeController = TextEditingController();
  final naturalidadeController = TextEditingController();
  final naturalidadeUfController = TextEditingController();
  final emailController = TextEditingController();
  final estadoCivilController = TextEditingController();

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
                            controller: nomeController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Nome completo*", "Digite o nome completo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o nome completo";
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
                            controller: dataNascimentoController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Data de nascimento*",
                                "Digite a data de nascimento"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite a data de nascimento";
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
                            controller: cpfCnpjController,
                            decoration: ThemeHelper().textInputDecoration(
                                "CPF_CNPJ*", "Digite o cpf/cnpj"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o cpf/cnpj";
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
                            controller: rgController,
                            decoration: ThemeHelper()
                                .textInputDecoration("RG*", "Digite o RG"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o RG";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: rgOrgController,
                            decoration: ThemeHelper().textInputDecoration(
                                "RG ORG*", "Digite o RG ORG"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o RG ORG";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: rgUfController,
                            decoration: ThemeHelper().textInputDecoration(
                                "RG Estado*", "Digite o estado do RG"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o estado RG";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: rgDateController,
                            decoration: ThemeHelper().textInputDecoration(
                                "RG Data*", "Digite a data do RG"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite a data do RG";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: emailController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Data do email*", "Digite o email"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o email";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: nacionalidadeController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Nacionalidade*", "Digite a nacionalidade"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite a nacionalidade";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: naturalidadeController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Naturalidade*", "Digite a naturalidade"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite a naturalidade";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: naturalidadeUfController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Naturalidade estado*",
                                "Digite o estado da naturalidade"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o estado da naturalidade";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: estadoCivilController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Estado Civil*", "Digite o estado civil"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite o estado civil";
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
                                "Enviar informações para contrato"
                                    .toUpperCase(),
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
                                  .collection('cliente_contrato')
                                  .doc()
                                  .set({
                                "nome_completo": nomeController.text,
                                "data_nascimento":
                                    dataNascimentoController.text,
                                "cpf_cnpj": cpfCnpjController.text,
                                "rg": rgController.text,
                                "rg_org": rgOrgController.text,
                                "rg_estado": rgUfController.text,
                                "rg_data": rgDateController.text,
                                "email": emailController.text,
                                "nacionalidade": nacionalidadeController.text,
                                "naturalidade": naturalidadeController.text,
                                "naturalidadeUf": naturalidadeUfController.text,
                                "estado_civil": estadoCivilController.text,
                                "revendaUid": widget.uidRevenda,
                                "cambio": widget.veiculo['cambio'],
                                "chassi": widget.veiculo['chassi'],
                                "combustivel": widget.veiculo['combustivel'],
                                "cor": widget.veiculo['cor'],
                                "crlv": widget.veiculo["crlv"],
                                "fabricante": widget.veiculo["fabricante"],
                                "km": widget.veiculo["km"],
                                "modelo": widget.veiculo["modelo"],
                                "motor": widget.veiculo["motor"],
                                "placa": widget.veiculo["placa"],
                                "portas": widget.veiculo["portas"],
                                "proprietario": widget.veiculo["proprietario"],
                                "proprietario_doc":
                                    widget.veiculo["proprietario_doc"],
                                "renavam": widget.veiculo["renavam"],
                                "sobre": widget.veiculo["sobre"],
                                "tipo": widget.veiculo["tipo"],
                              });

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
