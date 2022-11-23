import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:s10firebase_android/model/user.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:intl/intl.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerAge;
  late TextEditingController controllerDate;

  @override
  void initState() {
    super.initState();

    controllerName = TextEditingController();
    controllerAge = TextEditingController();
    controllerDate = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Agregar usuario'),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              TextFormField(
                  controller: controllerName,
                  decoration: decoration('Nombre: '),
                  validator: (text) => text != null && text.isEmpty
                      ? 'No puede dejarse vacio'
                      : null),
              const SizedBox(height: 24),
              TextFormField(
                  controller: controllerAge,
                  decoration: decoration('Edad: '),
                  keyboardType: TextInputType.number,
                  validator: (text) =>
                      text != null && int.tryParse(text) == null
                          ? 'No puede recibir texto'
                          : null),
              const SizedBox(height: 24),
              DateTimeField(
                controller: controllerDate,
                decoration: decoration('Cumpleaños: '),
                validator: (datetime) =>
                    datetime == null ? 'Revisar informacion' : null,
                format: DateFormat('yyyy-MM-dd'),
                onShowPicker: (context, currentValue) => showDatePicker(
                  context: context,
                  initialDate: currentValue ?? DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                child: Text('Crear'),
                onPressed: () {
                  final isValid = formKey.currentState!.validate();

                  if (isValid) {
                    final user = User(
                      name: controllerName.text,
                      age: int.parse(controllerAge.text),
                      birthday: DateTime.parse(controllerDate.text),
                    );
                    createUser(user);

                    final snackBar = SnackBar(
                      backgroundColor: Colors.cyan,
                      content: Text(
                        'Agregado ${controllerName} a Firebase',
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      );
  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      );

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;

    final json = user.toJson();
    await docUser.set(json);
  }
}
