
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abyssinia_job/progressBar.dart';
import 'package:http/http.dart' as http;
import '../model/Login_model.dart';
import 'employer_registeration.dart';
import 'jobseeker_registration.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List maindata = [];
  List filtereddata = [];


  bool hidePassword = true;
  String? _category;
  bool isApiCallProcess = false;
  String? dropdownValue;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  get key => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        child: _uiSetup(context),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: key,
        valueColor: this.key
    );
  }
  
  users() async {
    var response = await Dio().get('https://abyssinia-job-api.herokuapp.com/api/jobseeker/list');
    print(response);
    maindata =response.data;
    print(maindata);
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme
          .of(context)
          .accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme
                        .of(context)
                        .primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme
                              .of(context)
                              .hintColor
                              .withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Text(
                          "Login",
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline2,
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,

                          validator: (input) =>
                          !input!.contains('@')
                              ? "Email Id should be valid"
                              : null,
                          decoration: new InputDecoration(
                            hintText: "Email Address",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme
                                        .of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme
                                        .of(context)
                                        .accentColor)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme
                                  .of(context)
                                  .accentColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style:
                          TextStyle(color: Theme
                              .of(context)
                              .accentColor),
                          keyboardType: TextInputType.text,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme
                                        .of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme
                                        .of(context)
                                        .accentColor)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme
                                  .of(context)
                                  .accentColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Theme
                                  .of(context)
                                  .accentColor
                                  .withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),

                        TextButton(


                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.teal),
                          ),

                          onPressed: () {
                            users();

                           //String name =filtereddata[1];

                          },
                        ),
                        SizedBox(height: 15),

                        DropdownButton<String>(
                          hint: Text("Sign up as"),
                          isExpanded: true,
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              _category = newValue;
                            });
                          },
                          items: <String>['Employer', 'Job Seeker']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        TextButton(


                          child: Text(
                            "Sign UP",
                            style: TextStyle(color: Colors.teal),
                          ),

                          onPressed: () {

                            if(_category=="Employer"){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ERFormScreen()),
                              );
                            }
                            else{
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => JSRFormScreen()),
                              );

                            }


                          },


                        )

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}