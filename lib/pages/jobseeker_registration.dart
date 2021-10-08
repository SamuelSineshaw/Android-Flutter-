

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api/jobseeker_reg_api.dart';
import 'package:intl/intl.dart';

   class JSRFormScreen extends StatefulWidget{
     @override
        State<StatefulWidget> createState() {
          return JSRFormState();
        }

}
   class JSRFormState extends State<JSRFormScreen>{
     String? _fName;
     String? _mName;
     String? _lName;
     String? _pNumber;
     String? _email;
     String? _eBackground;
     String? _address;
     String?  _experiance;
     String? _dateOfBirth;
     String? _password;
     String? _cPassword;
     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

      Widget _buildFName(){

        return TextFormField(decoration: InputDecoration(labelText: 'First Name'),
          maxLength: 10,keyboardType: TextInputType.text,
          validator: (String? value){
          if(value!=null && value.isEmpty){
            return "First Name is required";
          }
          return null;
          },
          onSaved: (String? value){
            _fName=value!;
          },
        );
      }

     Widget _buildMName(){

       return TextFormField(decoration: InputDecoration(labelText: 'Middle Name'),
         maxLength: 10,keyboardType: TextInputType.text,
         validator: (String? value){
           if(value!=null && value.isEmpty){
             return "Middle Name is required";
           }
           return null;
         },
         onSaved: (String? value){
           _mName=value!;
         },
       );
     }
     Widget _buildLName(){
       return TextFormField(decoration: InputDecoration(labelText: 'Last Name'),
         maxLength: 10,keyboardType: TextInputType.text,
         validator: (String? value){
           if(value!=null && value.isEmpty){
             return "Last Name is required";
           }
           return null;
         },
         onSaved: (String? value){
           _lName=value!;
         },
       );
     }
     Widget _buildPNumber(){
       return TextFormField(decoration: InputDecoration(labelText: 'phone number'),
         maxLength: 13,
         keyboardType: TextInputType.phone,
         validator: (String? value) {
           if (value!.isEmpty) {
             return 'Phone number is Required';
           }
           return null;
         },
         onSaved: (String? value) {
           _pNumber = value!;
         },
       );
     }
     Widget _buildEmai(){

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
     Widget _buildEBackground(){
       return TextFormField(decoration: InputDecoration(labelText: 'Education Background'),
         maxLength: 100,keyboardType: TextInputType.text,
         validator: (String? value){
           if(value!=null && value.isEmpty){
             return "Educational background is required";
           }
           return null;
         },
         onSaved: (String? value){
           _eBackground=value!;
         },
       );
     }
     Widget _buildAddress(){

       return TextFormField(decoration: InputDecoration(labelText: 'Address'),
         maxLength: 20,keyboardType: TextInputType.text,
         validator: (String? value){
           if(value!=null && value.isEmpty){
             return "Address is required";
           }
           return null;
         },
         onSaved: (String? value){
           _address=value!;
         },
       );
     }
     Widget _buildExperiance(){
       return TextFormField(decoration: InputDecoration(labelText: 'Experiance'),
         maxLength: 100,keyboardType: TextInputType.number,
         validator: (String? value){
           if(value!=null && value.isEmpty){
             return "Experiance is required";
           }
           return null;
         },
         onSaved: (String? value){
           _experiance=value;
         },
       );
     }
     Widget _buildDateOfBirth(){
       return Container(
         height: 80,
         child: CupertinoDatePicker(
           mode: CupertinoDatePickerMode.date,
           initialDateTime: DateTime(1990, 1, 1),
           onDateTimeChanged: (DateTime newDateTime) {
             DateTime now = newDateTime;
             String formattedDate = DateFormat('yyyy-MM-dd').format(now);
             _dateOfBirth=DateFormat('yyyy-MM-dd').format(now);
           },
         ),
       );
     }
       Widget _buildPassword(){
         return TextFormField(decoration: InputDecoration(labelText: 'Password'),obscureText: true,
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
       Widget _buildCPassword(){
              return TextFormField( decoration: InputDecoration(labelText: 'Confirm Password'),obscureText: true,
             keyboardType: TextInputType.visiblePassword,
             validator: (String? value) {
               if (value!=null && value.isEmpty) {
                 return 'Confirm Password is Required';
               }
               return null;
             },
           onSaved: (String? value){
             _cPassword=value!;
               },
             );
            }


       Widget build(BuildContext context) {
             return Scaffold(   appBar: AppBar(title: Text("SignUP Job Seeker"),)  ,body: SingleChildScrollView(
             child: Container( margin: EdgeInsets.all(24), child: Form(key: _formKey, child: Column(mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[ _buildFName(), _buildMName(), _buildLName(), _buildPNumber(), _buildEmai(),
                   _buildEBackground(), _buildAddress(), _buildExperiance(), _buildDateOfBirth(), _buildPassword(),
                   _buildCPassword(), SizedBox(height: 100,),
                    ElevatedButton ( child: Text('SignUp',style: TextStyle(color: Colors.black, fontSize: 16),),
                   onPressed: () {
                        if(!_formKey.currentState!.validate()){
                          return;
                        }
                        _formKey.currentState!.save();


                        if(_password==_cPassword){
                          print(_dateOfBirth);
                         registerJobSeeker(_fName!,_mName!, _lName!,_pNumber!,_email!,_eBackground!,_address!,_experiance!,_dateOfBirth!,_password!);
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