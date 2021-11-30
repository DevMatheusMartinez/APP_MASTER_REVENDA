import 'package:flutter/material.dart';

class FormMensagem extends StatelessWidget {
  Widget fieldName() {
    return TextFormField(decoration: InputDecoration(labelText: 'Nome:'));
  }

  Widget fieldEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'E-mail:'),
      maxLines: 8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensagem'),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: null)],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [fieldName(), fieldEmail()],
          ),
        ),
      ),
    );
  }
}
