import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_tracker/models/Pet.dart';
import 'package:pet_tracker/state/device/DeviceProvider.dart';
import 'package:pet_tracker/state/pet/PetProvider.dart';
import 'package:provider/provider.dart';

class AddPet extends StatefulWidget {
  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  GlobalKey<FormState> _formKey = GlobalKey();
  bool isSubmit = false;
  Pet pet = new Pet("","","");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Pet"),
        backgroundColor: Color(0xff703BB1), // status bar color
        brightness: Brightness.dark, 
      ),
      body: SingleChildScrollView(
        child: Container(
          
          color: Colors.white,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          
                          TextFormField(
                            onSaved: (value)=> pet.name=value,
                            validator: (value) {
                              if (value.length == 0) {
                                return 'Please enter Pet Name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              labelText: "Pet Name",
                              labelStyle: GoogleFonts.mukta(
                                  color: Color(0xff703BB1).withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: new OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff703BB1)),
                              ),
                              focusedErrorBorder: new OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            onSaved: (value)=> pet.category=value,
                            validator: (value) {
                              if (value.length == 0) {
                                return 'Please enter Pet Category';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              labelText: "Pet Category",
                              labelStyle: GoogleFonts.mukta(
                                  color: Color(0xff703BB1).withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: new OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff703BB1)),
                              ),
                              focusedErrorBorder: new OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                          onSaved: (value)=> pet.breedType=value,
                            validator: (value) {
                              if (value.length == 0) {
                                return 'Please enter Breed Type';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              labelText: "Breed Type",
                              labelStyle: GoogleFonts.mukta(
                                  color: Color(0xff703BB1).withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: new OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff703BB1)),
                              ),
                              focusedErrorBorder: new OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: isSubmit
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(
                                        Color(0xff703BB1)),
                                  )
                                : TextButton(
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                                        Provider.of<PetProvider>(context,listen: false).addDevice(pet);
                                        Navigator.of(context).pop();
                                        // setState(() {
                                        //   isSubmit = true;
                                        // });
                                      }
                                    },
                                    child: Material(
                                      elevation: 10,
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xff703BB1),
                                                Color(0xff703BB1)
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            "Add",
                                            style: GoogleFonts.mukta(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 21),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}