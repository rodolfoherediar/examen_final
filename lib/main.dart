import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main()=> runApp(Final());

class Final extends StatelessWidget {
  const Final({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rodolfo",
      debugShowCheckedModeBanner: false,
      home: Inicio()
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  TextEditingController numerocontroller = TextEditingController();
  TextEditingController respuestacontroller = TextEditingController();
  TextEditingController imagecontroller = TextEditingController();
  operacion(String x){
    setState(() {
      imagecontroller.text=x;
      respuestacontroller.text = x;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Operaciones Rodolfo"),
         backgroundColor: Colors.black45,
       ),
       body: Container(
         
         child: Column(
           children: [
             Container(
               child: TextFormField(
                 controller: numerocontroller,
                 decoration: InputDecoration(
                   labelText: "Ingresa el numero",
                 ),
               ),
             ),
             
             SizedBox(
               height: 40.0,
             ),
             Container(
                child: TextFormField(
                  controller: respuestacontroller,
                  decoration: InputDecoration(
                    labelText: "Su resultado",
                  ),
                ) ,
             ),
             Image.network("https://image.freepik.com/vector-gratis/numeros-cartel-imagen_1639-6453.jpg"),
             FlatButton(
               onPressed: ()
               {
                 _operacion(int.parse(numerocontroller.text));
               },
              child: Text("Ingresar"))
           ],
         ),
       ),
    );
  }
  Future<void> _operacion(int numero) async{
  String url = "https://final2020.azurewebsites.net/api/Operaciones?numero=" + numero.toString();
  final response=await http.get(url,
    headers: {"Accept": "aplication/json"});
  operacion(response.body);
} 
}
