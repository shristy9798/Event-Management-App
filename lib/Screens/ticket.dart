import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Ticket(),));
}
class Ticket extends StatelessWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "My Tickets",
          style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold),
        )
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 8, right: 8),
          children: [
            // SizedBox(height:10,
            // ),
          Container(
              width: 100.0,
              height: 600.0,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/tiket.png'),
                      fit: BoxFit.cover)))
      ]
      ),
    );
  }
}
