import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs y Forms')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              TextFormField(
                  autofocus: false,
                  textCapitalization: TextCapitalization.words,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null) return 'Valor requerido';
                    return value.length < 3 ? 'requiere minimo 3 letras' : null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      hintText: 'Nombre del Usuario',
                      labelText: 'Nombre',
                      helperText: 'Solo letreas',
                      counterText: '3 Caracteres',
                      //prefixIcon: Icon(Icons.verified_user_outlined),
                      suffixIcon: Icon(Icons.supervised_user_circle_sharp),
                      icon: Icon(Icons.assignment_ind_outlined),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.green,
                      )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10)))))
            ],
          ),
        ),
      ),
    );
  }
}
