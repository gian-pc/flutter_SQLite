import 'package:flutter/material.dart';

class InputDialogWidget extends StatelessWidget {

  String hint;
  IconData icon;

  InputDialogWidget({required this.icon, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: this.hint,
        prefixIcon: Icon(this.icon, color: Color(0xff898989),),
        filled: true,
        fillColor: Color(0xffececec),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
            color: Color(0xffececec),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
            color: Color(0xffececece),
          ),
        ),
      ),
    );
  }
}