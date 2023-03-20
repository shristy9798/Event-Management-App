
import 'package:event_management_app/AdminHomePage/eventCards.dart';
import 'package:event_management_app/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/About.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  final auth=FirebaseAuth.instance;
  final ref=FirebaseDatabase.instance.ref('Events');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text("Events",style: TextStyle(color: Colors.black,fontSize: 25),),
          actions: [
            Builder(
              builder: ((context) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>const NotificationPage()));
                        },
                        icon: const Icon(
                          Icons.notifications,
                          size: 30,
                          color: Colors.grey,
                        )
                    ),
                  )),
            )
          ],
        ),
        body: ListView(

          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,15,15,8),
                  child: CupertinoSearchTextField(

                    borderRadius: BorderRadius.circular(15),

                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
             Padding(
              padding: const EdgeInsets.fromLTRB(15,0,10,15),
              child: Row(
                children: [
                  const Text("Featured Events",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  const Spacer(),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => cards()),
                      );
                    },
                      child: const Text("View all",style: TextStyle(fontSize: 15,color: Colors.grey,),)
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15,0,0,0),
              child: SizedBox(
                height: 500,
                width: MediaQuery. of(context). size. width,

                child: FirebaseAnimatedList(
                    query: ref,
                    itemBuilder:(context, snapshot, animation,index)
                    {
                      final character= Image.network(snapshot.child('Poster').value.toString(),fit: BoxFit.fitWidth,);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: InkWell(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(35),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2,
                                        spreadRadius: 0,
                                        offset: Offset(0, 1)),
                                  ]),
                              height: 130,
                              child: Row(
                                children: [

                                  Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white24,//color:Color(0xff7f88ea),//color:Color.fromRGBO(239, 207, 160, 1.0),//Color(0xff7f88ea),
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20)),//(index%2==0)?const BorderRadius.only(topRight: Radius.circular(50)):const BorderRadius.only(bottomLeft: Radius.circular(50)),
                                      ),
                                      width: 150,
                                      height: 150,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: character)
                                  ),

                                  Container(
                                    height: 150,
                                    width:MediaQuery. of(context).size.width-166,
                                    decoration: const BoxDecoration(
                                      color: Colors.white24,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),//(index%2==0)?const BorderRadius.only(topRight: Radius.circular(50)):const BorderRadius.only(bottomLeft: Radius.circular(50)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        //const Text("Title: ",style: TextStyle(fontSize: 25),),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text(
                                            snapshot.child('Event name').value.toString(),
                                            style: const TextStyle(color: Colors.black,fontSize: 22),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.location_on_outlined),
                                              Text(snapshot.child('Venue Address').value.toString()),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              )
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutScreen()));
                          },
                        ),
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
