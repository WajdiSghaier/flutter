import 'package:flutter/material.dart';

class CustumBoutton extends StatelessWidget {
  const CustumBoutton({super.key, this.titreboutton = "", this.onpressed});
  final String titreboutton;
  final void Function()? onpressed;
  //final formkey =

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Text(titreboutton),
    );
  }
}
