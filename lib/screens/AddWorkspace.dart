import 'package:flutter/material.dart';

/**
 * Adicionar workspaces
 */
class AddWorkspaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          tooltip: 'Voltar',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Adicionar espaço de trabalho'),
      ),
      body: CreateWorkspaceForm(),
    );
  }
}

class CreateWorkspaceForm extends StatefulWidget {
  @override
  _CreateWorkspaceFormState createState() => _CreateWorkspaceFormState();
}

class _CreateWorkspaceFormState extends State<CreateWorkspaceForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: TextFormField(
              decoration:
                  InputDecoration(hintText: 'Nome do espaço de trabalho'),
              cursorHeight: 20,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor, digite algum texto.';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: TextFormField(
              decoration: InputDecoration(hintText: 'Descrição (opcional)'),
              cursorHeight: 20,
              validator: (value) {
                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                )),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Adicionar'),
            ),
          ),
        ],
      ),
    );
  }
}
