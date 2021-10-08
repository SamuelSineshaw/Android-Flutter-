

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api/employer_reg_api.dart';
import '../api/jobseeker_reg_api.dart';
import 'package:intl/intl.dart';

class ERFormScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ERFormState();
  }

}
class ERFormState extends State<ERFormScreen>{
  String? _companyName;
  String? _phoneNumber;
  String? _contactPerson;
  String? _companyDescription;
  String? _companyLocation;
  String? _email;
  String?  _postalCode;
  String?  _password;
  String?  _cpassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildcompanyName(){

    return TextFormField(decoration: InputDecoration(labelText: 'company Name'),
      maxLength: 10,keyboardType: TextInputType.text,
      validator: (String? value){
        if(value!=null && value.isEmpty){
          return "company Name is required";
        }
        return null;
      },
      onSaved: (String? value){
        _companyName=value!;
      },
    );
  }

  Widget _buildphoneNumber(){
    return TextFormField(decoration: InputDecoration(labelText: 'phone Number'),
      maxLength: 10,keyboardType: TextInputType.number,
      validator: (String? value){
        if(value!=null && value.isEmpty){
          return " phone Number required";
        }
        return null;
      },
      onSaved: (String? value){
        _phoneNumber=value!;
      },
    );
  }
  Widget _buildcontactPerson(){
    return TextFormField(decoration: InputDecoration(labelText: 'contact Person'),
      maxLength: 10,keyboardType: TextInputType.text,
      validator: (String? value){
        if(value!=null && value.isEmpty){
          return "contact Person is required";
        }
        return null;
      },
      onSaved: (String? value){
        _contactPerson=value!;
      },
    );
  }
  Widget _buildcompanyDescription(){
    return TextFormField(decoration: InputDecoration(labelText: 'company Description'),
      maxLength: 300,
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'company Description is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        _companyDescription = value!;
      },
    );
  }
  Widget _buildcompanyLocation(){
    return TextFormField(decoration: InputDecoration(labelText: 'company Location'),
      maxLength: 100,keyboardType: TextInputType.text,
      validator: (String? value){
        if(value!=null && value.isEmpty){
          return "company Location is required";
        }
        return null;
      },
      onSaved: (String? value){
        _companyLocation=value!;
      },
    );
  }
  Widget _buildemail(){

    return TextFormField(decoration: InputDecoration(labelText: 'Email'),keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if (value!=null && value.isEmpty) {
          return 'Email is Required';
        }
        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value!)) {
          return 'Please enter a valid email Address';
        }
        return null;
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  Widget _buildpostalCode(){
    return TextFormField(decoration: InputDecoration(labelText: 'Postal Code'),
      maxLength: 100,keyboardType: TextInputType.number,
      validator: (String? value){
        if(value!=null && value.isEmpty){
          return "Postal Code is required";
        }
        return null;
      },
      onSaved: (String? value){
        _postalCode=value;
      },
    );
  }

  Widget _buildpassword(){
    return TextFormField( decoration: InputDecoration(labelText: 'Password'),obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value) {
        if (value!=null && value.isEmpty) {
          return 'Password is Required';
        }
        return null;
      },
      onSaved: (String? value){
        _password=value!;
      },
    );
  }
  Widget _buildcpassword(){
    return TextFormField( decoration: InputDecoration(labelText: 'Confirm Password'),obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value) {
        if (value!=null && value.isEmpty) {
          return 'Confirm Password is Required';
        }
        return null;
      },
      onSaved: (String? value){
        _cpassword=value!;
      },
    );
  }


  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(title: Text("SignUP Job Employer"),),body: SingleChildScrollView(
      child: Container( margin: EdgeInsets.all(24), child: Form(key: _formKey, child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ _buildcompanyName(), _buildphoneNumber(), _buildcontactPerson(), _buildcompanyDescription(), _buildcompanyLocation(),
          _buildemail(), _buildpostalCode(), _buildpassword(),_buildcpassword() ,SizedBox(height: 100,),
          ElevatedButton ( child: Text('SignUp',style: TextStyle(color: Colors.black, fontSize: 16),),
            onPressed: () {
              if(!_formKey.currentState!.validate()){
                return;
              }
              _formKey.currentState!.save();


              if(_password==_cpassword){
                print("$_companyName,$_phoneNumber, $_contactPerson,$_companyDescription,$_companyLocation,$_email,$_postalCode,$_password");
                registerEmplyer(_companyName!,_phoneNumber!, _contactPerson!,_companyDescription!,_companyLocation!,_email!,_postalCode!,_password!);
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Account created successfully!")));
              }
              else{
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Unable To create check your password!")));


              }






            },
          )
        ],


      ),),
      ),
    ),
    );

  }
}