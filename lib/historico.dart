// ignore_for_file: prefer_const_constructor
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:Minha_Gazoza/Home.dart';
import 'package:Minha_Gazoza/layout.dart';
import 'Database/BancoDados.dart';
import 'models/ClienteModel.dart';
import 'telaCalculo.dart';
import 'main.dart';

const Color darkBlue = Color.fromARGB(255, 255, 255, 255);

class MyTable extends StatefulWidget {
  final List<DataRow>? dadosTabela;

  @override
  const MyTable({
    required this.dadosTabela,
  });

  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  List<Map> listalocal = [];
  //funcoes
  carregarLista() async {
    listalocal = await BancoDados.listartabelas();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: carregarLista(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Text("No connection");
              } else {
                return form(context);
              }
          }
        });
  }

  Widget form(context) {
    ScrollController listscroll = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("HISTÓRICO"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Layout()));
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.builder(
                controller: listscroll,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listalocal.length,
                itemBuilder: (context, index) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.blue[900],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      'DATA:',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(listalocal[index]["data"]),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      'ENDEREÇO:',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(listalocal[index]["nomePosto"]),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                child: Row(
                              children: [
                                Text(
                                  'Quilometragem anterior:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text('Km'),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  (listalocal[index]["kmAnterior"].toString()),
                                ),
                              ],
                            )),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                child: Row(
                              children: [
                                Text(
                                  'Quilometragem atual:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text('Km'),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  (listalocal[index]["kmAtual"].toString()),
                                ),
                              ],
                            )),
                            const Divider(
                              height: 20,
                              thickness: 5,
                              indent: 0,
                              endIndent: 230,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                child: Row(
                              children: [
                                Text(
                                  'Preço total do abastecimento:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text("R\$"),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  (listalocal[index]["precoAbastecido"]
                                      .toString()),
                                ),
                              ],
                            )),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                child: Row(
                              children: [
                                Text(
                                  'Preço por litro:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text("R\$"),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  (listalocal[index]["precoLitro"].toString()),
                                ),
                              ],
                            )),
                            const Divider(
                              height: 20,
                              thickness: 5,
                              indent: 0,
                              endIndent: 230,
                              color: Colors.white,
                            ),
                            Container(
                                child: Row(
                              children: [
                                Text(
                                  'Litros abastecidos:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  (listalocal[index]["quantidadeLitros"]
                                      .toString()),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Litros',
                                )
                              ],
                            )),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                child: Row(
                              children: [
                                Text(
                                  'Quilômetros rodados:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text('Km'),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  (listalocal[index]["kmRodado"].toString()),
                                )
                              ],
                            )),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                child: Row(
                              children: [
                                Text(
                                  'KM Gasto por litro:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text('Km/L'),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  (listalocal[index]["precoKm"].toString()),
                                ),
                              ],
                            )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                    ),
                                    onPressed: () async {
                                      int a = listalocal[index]["id"];
                                      var retorno =
                                          await BancoDados.deleteMemo(a);
                                      setState(() {});
                                    },
                                    child: Text('Deletar')),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
