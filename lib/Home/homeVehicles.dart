import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:master_revenda/Home/home.dart';
import 'package:master_revenda/Login/pages/button/button.dart';
import 'package:master_revenda/Login/pages/button/buttontapped.dart';
import 'package:master_revenda/Login/pages/login_page_cliente.dart';
import 'package:master_revenda/Revendas/form.dart';
import 'package:master_revenda/Revendas/lista.dart';
import 'package:master_revenda/Veiculos/list.dart';

class HomeVehicles extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> revenda;
  const HomeVehicles({Key? key, required this.revenda}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

     var icons1 = Icons.home;
    var icons2 = Icons.airplay_sharp;
    var icons3 = Icons.favorite;
    var icons4 = Icons.message;

    bool buttonPressed1 = false;
    bool buttonPressed2 = false;
    bool buttonPressed3 = false;
    bool buttonPressed4 = false;

    void _letsPress1() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage()),);
    }

    void _letsPress2() async {
            await FirebaseAuth.instance.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
              const LoginPage()),);
    }

    void _letsPress3() {
    }

    void _letsPress4() {
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: height * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/carro_header.jpeg"),
                          fit: BoxFit.cover)),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(1.0),
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                  ),
                ),
                Positioned(
                  bottom: 90,
                  left: 20,
                  child: RichText(
                    text: TextSpan(
                        text: "",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                        children: [
                          TextSpan(
                              text: revenda['nome'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24))
                        ]),
                  ),
                )
              ],
            ),
            Transform.translate(
              offset: Offset(0.0, -(height * 0.3 - height * 0.26)),
              child: Container(
                width: width,
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: DefaultTabController(
                    length: 1,
                    child: Column(
                      children: <Widget>[
                        TabBar(
                          labelColor: Colors.black,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          unselectedLabelColor: Colors.grey[400],
                          unselectedLabelStyle: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          tabs: <Widget>[
                            Tab(
                              child: Text("Veiculos"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                        ),
                        Container(
                          height: height * 0.6,
                          child: TabBarView(
                            children: <Widget>[
                              VeiculoList(revenda: revenda),
                            ],
                          ),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                          // FIRST BUTTON
                                          onTap: _letsPress1,
                                          child: buttonPressed1
                                              ? ButtonTapped(
                                                  icon: icons1,
                                                )
                                              : MyButton(
                                                  icon: icons1,
                                                )),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                          // SECOND BUTTON
                                          onTap: _letsPress2,
                                          child: buttonPressed2
                                              ? ButtonTapped(
                                                  icon: icons2,
                                                )
                                              : MyButton(
                                                  icon: icons2,
                                                )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
