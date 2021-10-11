import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo3_sqflite/widgets/dismissible_item_widget.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  showAddModal(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Agregar Libro"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/images/add.svg', height: 120,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Libro",
                  prefixIcon: Icon(Icons.book),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Autor",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.black38),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Aceptar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddModal(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff212121),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mis Libros",
                style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: 48.0,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.0),
              DismissibleItemWidget(),
              DismissibleItemWidget(),
              DismissibleItemWidget(),
              DismissibleItemWidget(),
              DismissibleItemWidget(),
              DismissibleItemWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
