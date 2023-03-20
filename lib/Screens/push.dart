  import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

import '../components/custom_button.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    
    home: events(),));
}
class events extends StatefulWidget {
  const events({Key? key}) : super(key: key);

  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {
  

  File? _image;
  firebase_storage.FirebaseStorage storage=firebase_storage.FirebaseStorage.instance;
  final picker=ImagePicker();
  Future getImageGallery() async{
    final pickedFile=await picker.pickImage(source: ImageSource.gallery, imageQuality:70);
    setState((){
      if(pickedFile!=null){
        _image=File(pickedFile.path);
      }
    });
  }
  bool prr = false;
  bool granted=false;
  final id=DateTime.now().millisecondsSinceEpoch.toString();
  final databaseRef= FirebaseDatabase.instance.ref('Events');
  
  String? _nameerror = null;
  String? _caterror = null;
  String? _adderror = null;
  String? _orerror = null;
  String? _prerror = null;
  String? _dateerror = null;
  String? _sterror = null;
  String? _enderror = null;
  final TextEditingController _description = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _organise = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time1 = TextEditingController();
  final TextEditingController _eventDuration = TextEditingController();
  String level = "unpaid";
  bool shouldPop = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        !shouldPop;
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "Create Event",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(

                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: _image !=null ? Image.file(_image!.absolute):DottedBorder(
                      color: Colors.grey,//color of dotted/dash line
                    strokeWidth: 3,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(25),
                    dashPattern: const [10,6],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(25)),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,

                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(
                                  child: IconButton(
                                      splashColor: Colors.white,
                                      hoverColor: Colors.white,
                                      onPressed: (){
                                        getImageGallery();
                                      },
                                      icon: const Icon(Icons.add,size: 35,))),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Add image"),
                      ],
                    ),
                  ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Event Name",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                   errorText: _nameerror,
                    hintText: "Enter event name",
                    labelStyle: const TextStyle(
                        fontSize: 30, color: Color.fromARGB(31, 66, 65, 65)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Event Category",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _category,
                decoration: InputDecoration(
                     errorText: _caterror,
                    hintText: "Eg.: Cultural,Sports etc",
                    labelStyle: TextStyle(
                        fontSize: 30, color: Color.fromARGB(31, 66, 65, 65)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Venue Address",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _address,
                decoration: InputDecoration(
                    errorText: _adderror,
                    hintText: "Enter address",
                    labelStyle: const TextStyle(
                        fontSize: 30, color: Color.fromARGB(31, 66, 65, 65)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Organised by",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _organise,
                decoration: InputDecoration(
                     errorText: _orerror,
                    hintText: "Enter clubs or organisation name",
                    labelStyle: const TextStyle(
                        fontSize: 30, color: Color.fromARGB(31, 66, 65, 65)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Event Type",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: EdgeInsets.zero,
                child: Row(
                  children: [
                    Radio(
                        value: "unPaid",
                        groupValue: level,
                        onChanged: (value) {
                          setState(() {
                            prr= false;
                            level = value.toString();
                          });
                        }),
                    const Text("Unpaid",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 60,
                        right: 10,
                      ),
                      child: Radio(
                          value: "Paid",
                          groupValue: level,
                          onChanged: (value) {
                            setState(() {
                              prr = true;
                              level = value.toString();
                            });
                          }),
                    ),
                    const Text("Paid",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            Container(
              child: prr?
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Price",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold),
                ),
              ):const SizedBox(),
            ),
            Container(
              child: prr?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _price,
                  decoration: InputDecoration(
                    errorText: _prerror,
                      hintText: "Enter price",
                      labelStyle: const TextStyle(
                          fontSize: 30, color: Color.fromARGB(31, 66, 65, 65)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ):
              const SizedBox(

              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Date",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _date,
                decoration: InputDecoration(
                   errorText: _dateerror,
                    hintText: "Select date",
                    labelStyle: const TextStyle(
                        fontSize: 30, color: Color.fromARGB(31, 66, 65, 65)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                // keyboardType: TextInputType.datetime,
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Time",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _time1,
                decoration: InputDecoration(
                       errorText: _sterror,
                    hintText: "Start time",
                    labelStyle: const TextStyle(
                        fontSize: 30, color: Color.fromARGB(31, 66, 65, 65)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                // keyboardType: TextInputType.datetime,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Event Duration",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                      controller: _eventDuration,
                      decoration: InputDecoration(
                           errorText: _enderror,
                          hintText: "Event Duration",
                          labelStyle: const TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(31, 66, 65, 65)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      // keyboardType: TextInputType.datetime,
                    ),
            ),

            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Description",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                        controller: _description,
                        decoration: InputDecoration(
                            hintText: "About the event",
                            labelStyle: const TextStyle(
                                fontSize: 30, color: Color.fromARGB(31, 66, 65, 65)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),

                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    
                    
                    // const Padding(
                    //   padding: EdgeInsets.all(8.0),
                    //   child: Text(
                    //     "Description",
                    //     style: TextStyle(
                    //         fontSize: 18,
                    //         color: Colors.black,
                    //         fontFamily: "Roboto",
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: TextField(
                    //     controller: _description,
                    //     decoration: InputDecoration(
                    //         hintText: "About the event",
                    //         labelStyle: const TextStyle(
                    //             fontSize: 30, color: Color.fromARGB(31, 66, 65, 65)),
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(20))),

                    //   ),
                    // ),

                    
                    const SizedBox(
                      height: 10,
                    ),
                    
                    Container(
                        margin: EdgeInsets.zero,
                        child: Row(
                          children: [
                            const Text("Leave will be granted ?",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                )),
                            const Spacer(),
                            Checkbox(value: granted, onChanged: (value){
                              setState(() {
                                granted = value!;
                              });
                            })
                          ],
                        )),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: CustomButton(
                        text: "Submit",
                          onPress:()async{
                            if(prr==false)
                            {
                              _price.text='0';
                            }
                            if(_name.text.isNotEmpty && _category.text.isNotEmpty && _address.text.isNotEmpty && _organise.text.isNotEmpty && _price.text.isNotEmpty &&  _date.text.isNotEmpty && _date.text.length <= 10 && _time1.text.isNotEmpty && _eventDuration.text.isNotEmpty ){
                              firebase_storage.Reference ref=firebase_storage.FirebaseStorage.instance.ref('/Poster Image/ $id');
                              firebase_storage.UploadTask uploadTask = ref.putFile(_image!.absolute);

                              await Future.value(uploadTask);
                              var newUrl = await ref.getDownloadURL();


                              databaseRef.child(id).set({
                                'id':id,
                                'Poster': newUrl.toString(),
                                'Event name' : _name.text.toString(),
                                'Event Category' : _category.text.toString(),
                                'Venue Address' : _address.text.toString(),
                                'Organized by': _organise.text.toString(),
                                'Event Type': _price.text.toString(),
                                'Date': _date.text.toString(),
                                'Time': _time1.text.toString(),
                                'Event Duration': _eventDuration.text.toString(),
                                'Description' : _description.text.toString(),

                              });
                              setState(() {
                                _name.clear();
                                _category.clear();
                                _address.clear();
                                _description.clear();
                                _price.clear();
                                _eventDuration.clear();
                                _time1.clear();
                                _date.clear();
                                _organise.clear();


                              });
                            }
                            else{
                              setState(() {
                                if (_name.text.isEmpty) {
                                  _nameerror = "Enter atleast 3 character";
                                } else {
                                  _nameerror = null;
                                }
                                if (_category.text.isEmpty) {
                                  _caterror = "Enter atleast 3 character";
                                } else {
                                  _caterror = null;
                                }
                                if (_address.text.isEmpty) {
                                  _adderror = "Enter atleast 3 character";
                                } else {
                                  _adderror = null;
                                }
                                if (_organise.text.isEmpty) {
                                  _orerror = "Enter atleast 3 character";
                                } else {
                                  _orerror = null;
                                }
                                if (_price.text.isEmpty) {
                                  _prerror = "Enter amount";
                                } else {
                                  _prerror = null;
                                }
                                if (_date.text.isEmpty) {
                                  _dateerror = "Enter date";
                                } else {
                                  _dateerror = null;
                                }
                                if (_date.text.length > 10) {
                                  _dateerror = "Enter valid date";
                                } else {
                                  _dateerror = null;
                                }
                                if (_time1.text.isEmpty) {
                                  _sterror = "Enter valid time";
                                } else {
                                  _sterror = null;
                                }
                                if (_eventDuration.text.isEmpty) {
                                  _enderror = "Enter valid time";
                                } else {
                                  _enderror = null;
                                }
                              });
                            }
                          },

                      ),
                    ),
                    // ElevatedButton(
                    //     onPressed: ()async{
                    //       if(prr==false)
                    //       {
                    //         _price.text='0';
                    //       }
                    //       if(_name.text.isNotEmpty && _category.text.isNotEmpty && _address.text.isNotEmpty && _organise.text.isNotEmpty && _price.text.isNotEmpty &&  _date.text.isNotEmpty && _date.text.length <= 10 && _time1.text.isNotEmpty && _eventDuration.text.isNotEmpty ){
                    //       firebase_storage.Reference ref=firebase_storage.FirebaseStorage.instance.ref('/Poster Image/ $id');
                    //       firebase_storage.UploadTask uploadTask = ref.putFile(_image!.absolute);
                    //
                    //       await Future.value(uploadTask);
                    //       var newUrl = await ref.getDownloadURL();
                    //
                    //
                    //       databaseRef.child(id).set({
                    //         'id':id,
                    //         'Poster': newUrl.toString(),
                    //         'Event name' : _name.text.toString(),
                    //         'Event Category' : _category.text.toString(),
                    //         'Venue Address' : _address.text.toString(),
                    //         'Organized by': _organise.text.toString(),
                    //         'Event Type': _price.text.toString(),
                    //         'Date': _date.text.toString(),
                    //         'Time': _time1.text.toString(),
                    //         'Event Duration': _eventDuration.text.toString(),
                    //         'Description' : _description.text.toString(),
                    //
                    //       });
                    //       setState(() {
                    //         _name.clear();
                    //         _category.clear();
                    //         _address.clear();
                    //         _description.clear();
                    //         _price.clear();
                    //         _eventDuration.clear();
                    //         _time1.clear();
                    //         _date.clear();
                    //         _organise.clear();
                    //
                    //
                    //       });
                    //       }
                    //       else{
                    //         setState(() {
                    //           if (_name.text.isEmpty) {
                    //         _nameerror = "Enter atleast 3 character";
                    //       } else {
                    //         _nameerror = null;
                    //       }
                    //       if (_category.text.isEmpty) {
                    //         _caterror = "Enter atleast 3 character";
                    //       } else {
                    //         _caterror = null;
                    //       }
                    //       if (_address.text.isEmpty) {
                    //         _adderror = "Enter atleast 3 character";
                    //       } else {
                    //         _adderror = null;
                    //       }
                    //       if (_organise.text.isEmpty) {
                    //         _orerror = "Enter atleast 3 character";
                    //       } else {
                    //         _orerror = null;
                    //       }
                    //       if (_price.text.isEmpty) {
                    //         _prerror = "Enter amount";
                    //       } else {
                    //         _prerror = null;
                    //       }
                    //       if (_date.text.isEmpty) {
                    //         _dateerror = "Enter date";
                    //       } else {
                    //         _dateerror = null;
                    //       }
                    //       if (_date.text.length > 10) {
                    //         _dateerror = "Enter valid date";
                    //       } else {
                    //         _dateerror = null;
                    //       }
                    //       if (_time1.text.isEmpty) {
                    //         _sterror = "Enter valid time";
                    //       } else {
                    //         _sterror = null;
                    //       }
                    //       if (_eventDuration.text.isEmpty) {
                    //         _enderror = "Enter valid time";
                    //       } else {
                    //         _enderror = null;
                    //       }
                    //         });
                    //       }
                    //       },
                    //     child: const Text(
                    //       "Submit",
                    //       style: TextStyle(
                    //           fontSize: 22,
                    //           fontFamily: "Roboto",
                    //           fontWeight: FontWeight.bold),
                    //     )
                    //     )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}