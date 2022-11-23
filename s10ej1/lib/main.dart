import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:s10ej1/repository/DataRepository.dart';
import 'package:s10ej1/utils/pets_icons.dart';
import 'package:s10ej1/petDetails.dart';
import 'package:s10ej1/models/pets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Veterinaria NRC2288',
        theme: ThemeData(
          primarySwatch: Colors.lime,
        ),
        home: HomeList());
  }
}

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class_HomeListState extends State<HomeList> {
  final DataRepository repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return _buildHome(context);
  }

  Widget _buildHome(BuildContext context){
    return Scaffold(appBar: AppBar(
      title: const Text("Mascotas"),
    ),
    body: StreamBuilder<QuerySnapshot>(
      stream: repository.getStream(),
      builder: (context, snapshot){
        if(!snapshot.hasData) return const LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      }
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      _addPet();
    },
    tooltip: 'Agregar Mascota',
    child: Icon(Icons.add_box),
    ),
    );
  }
  
  void _addPet(){
    AlertDialogWidget dialogWidget = AlertDialogWidget();
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Agregar mascota'),
          content: dialogWidget,
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Pet newPet = Pet(dialogWidget.petName, type: dialogWidget.character);
                repository.addPet(newPet);
                Navigator.of(context).pop();
              },
              child: const Text('Agregar')
            ),
          ],
        );
      });
  }
}