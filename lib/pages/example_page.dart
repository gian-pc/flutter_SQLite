
import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {


  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {

  String message = "Mantequilla el último de los mexicanos.";
  late String title;
  String stringFutureName = "x";

  @override
  initState(){
    super.initState();
    title= "Batman";
    getData();
  }

  String obtenerTitulo(){
    return "Mantequilla forever";
  }

  getData()async{
    // stringFutureName=await getFutureName();
    //     // setState(() {
    //     //
    //     // });
    //     // print(stringFutureName);

    // getFutureName().then((value) {
    //   stringFutureName = value;
    //   setState(() {
    //
    //   });
    // });
  }

  Future<String>getFutureName()async{
    return await Future.delayed(Duration(seconds: 5),(){
      return "Gian Carlos";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Example"),
          ),
          body: Center(
            child: FutureBuilder(
              future: getFutureName(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  return Text(snapshot.data);
                }else if(snapshot.hasError){
                  return Text("Ocurrio un Error");
                }
                return CircularProgressIndicator();



              },
            ),
          ),
        );
  }
}
