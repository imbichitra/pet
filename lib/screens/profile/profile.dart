import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<FormState> _formKey = GlobalKey();
  bool isSubmit = false;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.3),
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Column(
              children: [
                // Stack(
                //   children: [
                //     Container(
                //       width: double.infinity,
                //       height: 400,
                //       decoration: BoxDecoration(
                //         color: Color(0xFF976FEA),
                //         borderRadius: BorderRadius.only(
                //           bottomLeft: Radius.circular(20),
                //           bottomRight: Radius.circular(20)
                //         )
                //       ),
                //     ),
                //     Positioned(
                //       top: 0,
                //       left: 0,
                //       right: 0,
                //       child: Container(
                //         height: 300,
                //         decoration: BoxDecoration(
                //           color: Color(0xFFFCFCFC),
                //           borderRadius: BorderRadius.only(
                //             bottomRight: Radius.circular(20),
                //             bottomLeft: Radius.circular(20)
                //           )
                //         ),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Container(
                //               width: 120,
                //               height: 120,
                //               decoration: BoxDecoration(
                //                 color: Colors.green.withOpacity(0.3),
                //                 shape: BoxShape.circle
                //
                //               ),
                //               child: Center(child: Text("A",style: TextStyle(fontSize: 50,color: Colors.black),)),
                //             ),
                //             Text(
                //               "Bichitra",
                //               style: GoogleFonts.mukta(
                //                   fontSize: 30, fontWeight: FontWeight.bold),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     Positioned(
                //       top: 310,
                //       left: 0,
                //       right: 0,
                //       child:Container(
                //         width: MediaQuery.of(context).size.width,
                //         height: 160,
                //         child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //           mainAxisSize: MainAxisSize.max,
                //           children: [
                //             Column(
                //               children: [
                //                 Text(
                //                   "25",
                //                   style: GoogleFonts.mukta(
                //                       fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),
                //                 ),
                //                 Text(
                //                 "Pets",
                //                 style: GoogleFonts.mukta(
                //                     fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),
                //                 )
                //
                //               ],
                //             ),
                //
                //             Text("Sds"),                          ],
                //         ),
                //       )
                //     ),
                //   ],
                // )
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                      color: Color(0xFF976FEA),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                      )
                  ),
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)
                              )
                          ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50,),
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.3),
                                  shape: BoxShape.circle

                              ),
                              child: Center(child: Text("A",style: TextStyle(fontSize: 50,color: Colors.black),)),
                            ),
                            Text(
                              "Bichitra",
                              style: GoogleFonts.mukta(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "25",
                                  style: GoogleFonts.mukta(
                                      fontSize: 20, color:Colors.white,fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "PETS",
                                  style: GoogleFonts.mukta(
                                      fontSize: 20, color:Colors.white,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "25",
                                  style: GoogleFonts.mukta(
                                      fontSize: 20, color:Colors.white,fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "DEVICES",
                                  style: GoogleFonts.mukta(
                                      fontSize: 20,color:Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: _formContent(context),
                      ),
                    ),
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }

  Widget _formContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text("Address",style: GoogleFonts.mukta(fontSize: 15,color: Colors.grey),),
             GestureDetector(
               onTap: (){
                 setState(() {
                   visible = !visible;
                 });
               },
               child: Text("Edit",style: GoogleFonts.mukta(fontSize: 15,color: Colors.grey),),
             )
           ],
        ),

        TextFormField(
          enabled: visible,
          validator: (value) {
            if (value.length == 0) {
              return 'Please enter Email';
            }
            return null;
          },
          decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.subtitle1,
              labelText: 'Address Line1',
              border: border,
              enabledBorder: enableBorder,
              focusedBorder: focusedBorder,
              disabledBorder: disableBorder,
              errorBorder: errorBorder,
              isDense: true,
              ),
        ),

        TextFormField(
          enabled: visible,
          validator: (value) {
            if (value.length == 0) {
              return 'Please enter Email';
            }
            return null;
          },
          decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.subtitle1,
              labelText: 'Address Line2',
              border: border,
              enabledBorder: enableBorder,
              focusedBorder: focusedBorder,
              disabledBorder: disableBorder,
              errorBorder: errorBorder,
              isDense: true,
              ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            
            Expanded(
              child: TextFormField(
                enabled: visible,
                validator: (value) {
                  if (value.length == 0) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  labelText: 'City',
                  border: border,
                  enabledBorder: enableBorder,
                  focusedBorder: focusedBorder,
                  disabledBorder: disableBorder,
                  errorBorder: errorBorder,
                  isDense: true,
                ),
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: TextFormField(
                enabled: visible,
                validator: (value) {
                  if (value.length == 0) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  labelText: 'State',
                  border: border,
                  enabledBorder: enableBorder,
                  focusedBorder: focusedBorder,
                  disabledBorder: disableBorder,
                  errorBorder: errorBorder,
                  isDense: true,
                ),
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            Expanded(
              child: TextFormField(
                enabled: visible,
                validator: (value) {
                  if (value.length == 0) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  labelText: 'Country',
                  border: border,
                  enabledBorder: enableBorder,
                  focusedBorder: focusedBorder,
                  disabledBorder: disableBorder,
                  errorBorder: errorBorder,
                  isDense: true,
                ),
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: TextFormField(
                enabled: visible,
                validator: (value) {
                  if (value.length == 0) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  labelText: 'Pin',
                  border: border,
                  enabledBorder: enableBorder,
                  focusedBorder: focusedBorder,
                  disabledBorder: disableBorder,
                  errorBorder: errorBorder,
                  isDense: true,
                ),
              ),
            ),
          ],
        ),

        Visibility(
          visible: visible,
            child: SizedBox(height: 30,)
        ),

        Visibility(
          visible: visible,
          child: Center(
            child: isSubmit
                ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                  Color(0xff703BB1)),
            )
                : TextButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
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
                      "Sign In",
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
        ),
      ],
    );
  }
}
