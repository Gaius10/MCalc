import 'package:flutter/material.dart';

// Apresentar Lista de Workspaces salvos
class WorkspacesRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: "Outras Ações",
          onPressed: null,
        ),
        title: Text("MCalc - Matrix Calculator"),
      ),
      body: ItemsList(List<ListItem>.generate(
        3,
        (i) => i == 0
            ? HeadingItem("Meus Workspaces")
            : MessageItem("Workspace $i", "Descrição"),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: FloatingActionButton(
              heroTag: 'quickButton',
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.calculate,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              tooltip: "Contas rápidas",
              onPressed: null,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: FloatingActionButton(
              heroTag: 'addButton',
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              tooltip: "Adicionar Espaço de Trabalho",
              onPressed: () {
                Navigator.pushNamed(context, '/addWorkspace');
              },
            ),
          )
        ]),
      ),
    );
  }
}

// Obter workspaces salvos (inicialmente pseudoaleatorios para testes)
// Esta classe é temporaria, será reconstruída em outro arquivo para acesso ao
// banco de dados.
class ItemsList extends StatelessWidget {
  ItemsList(this.items);

  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return ListTile(
          title: Container(
            child: Row(
              children: <Widget>[
                Expanded(child: item.buildTitle(context)),
              ],
            ),
          ),
          subtitle: item.buildSubTitle(context),
          trailing: (index != 0)
              ? IconButton(
                  icon: Icon(Icons.delete, color: Colors.red[300]),
                  iconSize: 30,
                  tooltip: 'Remover espaço de trabalho',
                  onPressed: null,
                )
              : Text(''),
        );
      },
    );
  }
}

/**
 * Página inicial: Lista de workspaaces
 */
abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubTitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Center(
      child: Text(
        heading,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildSubTitle(BuildContext context) => null;
}

class MessageItem implements ListItem {
  final String title;
  final String subtitle;

  MessageItem(this.title, this.subtitle);

  Widget buildTitle(BuildContext context) => Text(title);
  Widget buildSubTitle(BuildContext context) => Text(subtitle);
}
