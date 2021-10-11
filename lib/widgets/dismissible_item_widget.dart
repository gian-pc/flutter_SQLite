

import 'package:flutter/material.dart';

class DismissibleItemWidget extends StatelessWidget {
  const DismissibleItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(),
      secondaryBackground: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent,
        ),
        child: Center(
          child: Text(
            "Eliminar",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,

      onDismissed: (DismissDirection direction){
        print("Eliminando...");
      },

      child: ListTile(
        leading: Container(
          width: 50,
          child: Image.network(
              "https://images-na.ssl-images-amazon.com/images/I/51RQv5UxNgL._SX304_BO1,204,203,200_.jpg"),
        ),
        title: Text(
          "La Fiesta del Chivo",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17.0,
          ),
        ),
        subtitle: Text("Mario Vargas Llosa"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10.0)),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10.0)),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}