import 'package:flutter/material.dart';

class CustemText extends StatelessWidget {
  const CustemText(
      {super.key,
      this.lab = "",
      this.hint,
      this.valider,
      this.clavier,
      this.onsaved});
  final String lab;
  final String? hint;
  final TextInputType? clavier;
  final String? Function(String?)? valider;
  final String? Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(color: Colors.blueGrey, fontSize: 20),
        keyboardType: clavier,
        decoration: InputDecoration(
            label: Text(lab),
            //label: ElevatedButton(onPressed: () {}, child: Text("rrrrrr")),
            //labelText: lab,
            labelStyle: TextStyle(color: Colors.blue),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.blue),
            fillColor: Colors.yellow,
            filled: true,
            prefixIcon: Icon(Icons.add),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(45))),
        validator: valider,
        onSaved: onsaved,
      ),
    );
  }
}
