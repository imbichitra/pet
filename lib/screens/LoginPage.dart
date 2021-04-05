import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool visibility = true;
  bool isSubmit = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(maxHeight: size.height, maxWidth: size.width),
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Image.asset("images/pet.png"),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFFE2E2E2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.mukta(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value.length == 0) {
                                return 'Please enter Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              labelText: "Email",
                              labelStyle: GoogleFonts.mukta(
                                  color: Color(0xff703BB1).withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
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
                            obscureText: visibility,
                            controller: _passwordController,
                            validator: (value) {
                              if (value.length == 0) {
                                return 'Please enter Password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                labelText: "Password",
                                labelStyle: GoogleFonts.mukta(
                                    color: Color(0xff703BB1).withOpacity(0.7),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        visibility = !visibility;
                                      });
                                    },
                                    child: Icon(visibility
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                focusedBorder: new OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff703BB1)),
                                ),
                                focusedErrorBorder: new OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.redAccent),
                                ),
                                errorBorder: new OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.redAccent),
                                )),
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
                        ],
                      ),
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
}
