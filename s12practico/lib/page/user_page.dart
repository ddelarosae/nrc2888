import '../model/user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';

class UserPage extends StatefulWidget {
  final User? user;
  const UserPage({Key? key, this.user}) : super(key: key);

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

    if (widget.user != null) {
      final user = widget.user!;

      controllerName.text = user.name;
      controllerAge.text = user.age.toString();
      controllerDate.text = DateFormat('yyyy-MM-dd').format(user.birthday);
    }
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerAge.dispose();
    controllerDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.user != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? controllerName.text : 'agregar usuario'),
        actions: [
          if (isEditing)
            IconButton(
                onPressed: () {
                  deleteUser(widget.user!);
                  final snackBar = SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      'Eliminado ${controllerName.text} de Firebase',
                      style: const TextStyle(fontSize: 24),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.delete)),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              controller: controllerName,
              decoration: decoration('nombre'),
              validator: (text) =>
                  text != null && text.isEmpty ? 'entrada no valida' : null,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: controllerAge,
              decoration: decoration('Edad'),
              validator: (text) => text != null && int.tryParse(text) == null
                  ? 'entrada no valida'
                  : null,
            ),
            const SizedBox(
              height: 24,
            ),
            DateTimeField(
              initialValue: widget.user?.birthday,
              controller: controllerDate,
              decoration: decoration('fecha de nacimiento'),
              validator: (datetime) =>
                  datetime == null ? 'entrada no valida' : null,
              format: DateFormat('yyyy-MM-dd'),
              onShowPicker: (context, currentValue) => showDatePicker(
                  context: context,
                  firstDate: DateTime(1950),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100)),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              child: Text(isEditing ? 'Guardar' : 'Crear'),
              onPressed: () {
                final isValid = formKey.currentState!.validate();
                if (isValid) {
                  final user = User(
                    id: widget.user?.id ?? '',
                    name: controllerName.text,
                    age: int.parse(controllerAge.text),
                    birthday: DateTime.parse(controllerDate.text),
                  );

                  if (isEditing) {
                    updateUser(user);
                  } else {
                    createUser(user);
                  }
                  final action = isEditing ? 'Se edito' : 'Se agrego';
                  final snackBar = SnackBar(
                    backgroundColor: Colors.amber,
                    content: Text('$action ${controllerName.text} en Firebase',
                        style: const TextStyle(fontSize: 24)),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pop(context);
                }
              },
              //child: const Text('enviar')
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      );

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json); //esta funcion crea el usuario
  }

  Future updateUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);
    //user.id = docUser.id;
    final json = user.toJson();
    await docUser.update(json); //esta funcion actualiza el usuario
  }

  Future deleteUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);
    //user.id = docUser.id;
    //final json = user.toJson();
    await docUser.delete(); //esta funcion elimina el usuario
  }
}
