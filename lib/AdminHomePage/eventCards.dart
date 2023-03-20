

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class cards extends StatefulWidget {
   cards({Key? key}) : super(key: key);

  @override
  State<cards> createState() => _cardsState();
}

class _cardsState extends State<cards> {

  final scrollController = ScrollController();
  void onListen(){
    setState(() {

    });
  }

  final auth=FirebaseAuth.instance;
  final ref=FirebaseDatabase.instance.ref('Events');

  final _color=[
    const Color.fromRGBO(158, 231, 255, 1.0),
    const Color.fromRGBO(207, 255, 83, 1.0),
    const Color.fromRGBO(24, 201, 255, 1.0),
    const Color.fromRGBO(133, 221, 155, 1.0),
    const Color.fromRGBO(232, 181, 255, 1.0),
    const Color.fromRGBO(239, 207, 160, 1.0),
    const Color.fromRGBO(60, 142, 215, 1.0),

  ];
@override
  void initState() {
  scrollController.addListener(onListen);
    super.initState();
  }
  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: FirebaseAnimatedList(
                    controller: scrollController,
                      query: ref,
                      itemBuilder:(context, snapshot, animation,index)
                      {

                        final character= Image.network(snapshot.child('Poster').value.toString(),fit: BoxFit.fitWidth,);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Container(
                            height: 150,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 150,
                                        width:MediaQuery. of(context).size.width-166,
                                        decoration: const BoxDecoration(
                                          color: Color.fromRGBO(239, 207, 160, 1.0),//Color(0xff7f88ea),
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),//(index%2==0)?const BorderRadius.only(topRight: Radius.circular(50)):const BorderRadius.only(bottomLeft: Radius.circular(50)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Title: ",style: TextStyle(fontSize: 25),),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Text(
                                                snapshot.child('Event name').value.toString(),
                                                style: const TextStyle(color: Colors.black,fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 150,
                                          height: 150,
                                          child: character
                                      ),
                                    ],
                                  )
                            ),
                        );
                      }
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Titile"),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
//
//
//
// ],
// ),
// Container(
// ,
// ],
// ),
// ListTile(
// title: Text(snapshot.child('Event name').value.toString()),
// );
//
// CustomScrollView(
// slivers: <Widget>[
// SliverList(
// delegate: SliverChildBuilderDelegate(
// (context,index){
// final character= Image.network(snapshot.child('Poster').value.toString());
// return Card(
// color: Colors.grey.shade300,
// child: SizedBox(
// height: 150,
// child: Row(
// children: [
// Expanded(
// child: Text(
// snapshot.child('Event name').value.toString(),
// style: TextStyle(color: Colors.black,fontSize: 25),
// )
// )
// ],
// ),
// ),
// );
// }
// ))
// ],
// );