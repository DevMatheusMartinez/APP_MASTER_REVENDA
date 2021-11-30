import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_revenda/Login/common/theme_helper.dart';
import 'package:master_revenda/Login/pages/login_page_cliente.dart';
import 'package:master_revenda/Login/pages/widgets/header_widget.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:flutter/foundation.dart';
import 'package:printing/printing.dart';
import 'package:master_revenda/Home/homeRevendedor.dart';


class CriarContrato extends StatefulWidget {
  @override
  final QueryDocumentSnapshot<Object?> contrato;

  const CriarContrato({Key? key, required this.contrato}) : super(key: key);
  State<StatefulWidget> createState() {
    return _CriarContrato();
  }
}

class _CriarContrato extends State<CriarContrato> {
  final _formKey = GlobalKey<FormState>();
  final documentacaoController = TextEditingController();
  final observacoesController = TextEditingController();
  final termosController = TextEditingController();

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
                            controller: documentacaoController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Documentacao*",
                                "Digite as documentações do veiculo"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Digite a documentacao";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: observacoesController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Observações",
                                "digite as observações que achar necessario"),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: termosController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Termos", "digite os termos da venda"),
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

                              if(documentacaoController.text == ""){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("A documentação é obrigátoria.")));
                                return;
                              }
                              else if(termosController.text == ""){
                                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("O termo é obrigatorio.")));
                                 return;
                              }
                              _titleText(String text) {
                                return pw.Padding(
                                    padding: pw.EdgeInsets.only(top: 8),
                                    child: pw.Text(text,
                                        style: pw.TextStyle(
                                            fontSize: 14,
                                            fontWeight: pw.FontWeight.bold)));
                              }

                              pw.Widget _buildHeader(pw.Context context) {
                                return pw.Container(
                                    color: PdfColors.blue,
                                    height: 150,
                                    child: pw.Padding(
                                        padding: pw.EdgeInsets.all(16),
                                        child: pw.Row(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.center,
                                            mainAxisAlignment: pw
                                                .MainAxisAlignment.spaceBetween,
                                            children: [
                                              pw.Column(
                                                  mainAxisAlignment: pw
                                                      .MainAxisAlignment.center,
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    pw.Padding(
                                                        padding:
                                                            pw.EdgeInsets.all(
                                                                8),
                                                        child: pw.PdfLogo()),
                                                    pw.Text('Contrato de venda',
                                                        style: pw.TextStyle(
                                                            fontSize: 22,
                                                            color: PdfColors
                                                                .white))
                                                  ]),
                                              pw.Column(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    pw.CrossAxisAlignment.end,
                                                children: [
                                                  pw.Text(widget.contrato['nome_completo']  ,
                                                      style: pw.TextStyle(
                                                          fontSize: 22,
                                                          color:
                                                              PdfColors.white)),
                                                  pw.Text(
                                                      widget.contrato['cpf_cnpj'],
                                                      style: pw.TextStyle(
                                                          color:
                                                              PdfColors.white)),
                                                  pw.Text(widget.contrato['rg'],
                                                      style: pw.TextStyle(
                                                          color:
                                                              PdfColors.white)),
                                                ],
                                              )
                                            ])));
                              }

                              pw.Widget _buildContentClient() {
                                return pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          _titleText('Cliente'),
                                          pw.Text(widget.contrato['nome_completo']),
                                          _titleText('CPF'),
                                          pw.Text(widget.contrato['cpf_cnpj']),
                                          _titleText('Data de nascimento'),
                                          pw.Text(widget.contrato['data_nascimento']),
                                          _titleText('Email'),
                                          pw.Text(widget.contrato['email']),
                                          _titleText('Estado civil'),
                                          pw.Text(widget.contrato['estado_civil']),
                                          _titleText('Nacionalidade'),
                                          pw.Text(widget.contrato['nacionalidade']),
                                           _titleText('Naturalidade'),
                                          pw.Text(widget.contrato['naturalidade']),
                                           _titleText('RG'),
                                          pw.Text(widget.contrato['rg']),
                                          _titleText('Data do RG'),
                                          pw.Text(widget.contrato['rg_data']),
                                          _titleText('Estado do RG'),
                                          pw.Text(widget.contrato['rg_estado']),
                                          _titleText('orgão do rg'),
                                          pw.Text(widget.contrato['rg_org']),
                                        ],
                                      ),
                                      pw.Column(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.end,
                                          children: [
                                            _titleText('Veiculo'),
                                            pw.Text(widget.contrato['fabricante'] + " " +widget.contrato['modelo']),
                                            _titleText('Cambio'),
                                            pw.Text(widget.contrato['cambio']),
                                            _titleText('Combustivel'),
                                            pw.Text(widget.contrato['combustivel']),
                                            _titleText('Cor'),
                                            pw.Text(widget.contrato['cor']),
                                            _titleText('Fabricante'),
                                            pw.Text(widget.contrato['fabricante']),
                                            _titleText('Modelo'),
                                            pw.Text(widget.contrato['modelo']),
                                            _titleText('Placa'),
                                            pw.Text(widget.contrato['placa']),
                                            _titleText('Portas'),
                                            pw.Text(widget.contrato['portas']),
                                            _titleText('Tipo'),
                                            pw.Text(widget.contrato['tipo']),
                                            _titleText('Documentacao'),
                                            pw.Text(documentacaoController.text),
                                            _titleText('Observações'),
                                            pw.Text(observacoesController.text),
                                            _titleText('Termos'),
                                            pw.Text(termosController.text),
                                          ])
                                    ]);
                              }

                              List<pw.Widget> _buildContent(
                                  pw.Context context) {
                                return [
                                  pw.Padding(
                                      padding: pw.EdgeInsets.only(
                                          top: 30, left: 25, right: 25),
                                      child: _buildContentClient())
                                ];
                              }

                              final pw.Document doc = pw.Document();
                              doc.addPage(pw.MultiPage(
                                pageTheme:
                                    pw.PageTheme(margin: pw.EdgeInsets.zero),
                                header: _buildHeader,
                                build: (context) => _buildContent(context),
                              ));

                              await Printing.layoutPdf(
                                  onLayout: (PdfPageFormat formart) async =>
                                      doc.save());
                                      
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePageRevendedor()
                                      )
                              );
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
