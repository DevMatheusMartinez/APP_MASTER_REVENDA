import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:master_revenda/Revendas/formMensagem.dart';
import 'package:master_revenda/Veiculos/specific_card.dart';
import 'package:master_revenda/Veiculos/utils.dart';

class CarDetail extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> veiculo;

  const CarDetail({Key? key, required this.veiculo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.bookmark,
                  size: 30, color: Theme.of(context).accentColor)),
          IconButton(onPressed: null, icon: Icon(Icons.share, size: 30)),
        ],
      ),
      body: Column(
        children: [
          Text(veiculo['fabricante'] + " " + veiculo['modelo'],
              style: MainHeading),
          Hero(tag: 'title', child: Image.asset("carro_header.jpeg")),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpecificsCard(
                name: 'Combustivel',
                price: 0,
                name2: veiculo['cambio'],
              ),
              SpecificsCard(
                name: 'Fabricante',
                price: 0,
                name2: veiculo['fabricante'],
              ),
              SpecificsCard(
                name: 'Ano',
                price: 0,
                name2: veiculo['ano'],
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpecificsCard(
                name: 'cor',
                name2: veiculo['cor'],
                price: 0,
              ),
              SpecificsCard(name: 'KM', name2: veiculo['km'], price: 0),
              SpecificsCard(name: "portas", name2: "", price: veiculo['portas'])
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Sobre o veiculo',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(veiculo['sobre']),
          SizedBox(height: 20),
          TextButton(
            child: Text('Conversar com o vendedor'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.teal,
              onSurface: Colors.grey,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FormMensagem()));
            },
          ),
          SizedBox(height: 20),
          TextButton(
            child: Text('Agendar videochamada'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.teal,
              onSurface: Colors.grey,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FormMensagem()));
            },
          )
        ],
      ),
    );
  }
}
