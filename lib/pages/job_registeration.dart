import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../api/job_reg_api.dart';



class JobRegFormScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return JobRegState();
  }

}
class JobRegState extends State<JobRegFormScreen>{
  String? _jobTitle;
  String? _jobDescription;
  String? _jobRequirement;
  String? _category;
  String? _companyName;
  String? _companyLocation;
  String? _postDate;
  String? _expireDate;
  String? _salary;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Widget _buildjobTitle(){

    return TextFormField(decoration: InputDecoration(labelText:'job Title'),
      maxLength: 10,keyboardType: TextInputType.text,
      validator: (String? value){
        if(value!=null && value.isEmpty){
          return "jobTitle is required";
        }
        return null;
      },
      onSaved: (String? value){
        _jobTitle=value!;
      },
    );
  }

  Widget _buildjobDescription(){

    return TextFormField(decoration: InputDecoration(labelText: 'job Description'),
      maxLength: 10,keyboardType: TextInputType.text,
      validator: (String? value){
        if(value!=null && value.isEmpty){
          return "job Description is required";
        }
        return null;
      },
      onSaved: (String? value){
        _jobDescription=value!;
      },
    );
  }
  Widget _buildjobRequirement(){
    return TextFormField(decoration: InputDecoration(labelText: 'job Requirement'),
      maxLength: 10,keyboardType: TextInputType.text,
      validator: (String? value){
        if(value!=null && value.isEmpty){
          return "job Requirement is required";
        }
        return null;
      },
      onSaved: (String? value){
        _jobRequirement=value!;
      },
    );
  }

  String? dropdownValue;
  Widget _buildcatagory() {
    return DropdownButton<String>(
      hint: Text("Select Catagory"),
      isExpanded: true,
      value:dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          _category=newValue;
        });
      },
      items: <String>['Computer Science', 'Engineering', 'Health', 'Social Science']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildcompanyName(){
    return TextFormField(decoration: InputDecoration(labelText: 'company Name'),
      maxLength: 100,keyboardType: TextInputType.text,
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

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);


  Widget _buildpostDate(){
    return TextFormField(decoration: InputDecoration(labelText: 'Post Date'),
      maxLength: 100, initialValue: formatted,
      onSaved: (String? value){
        _postDate=value!;
      },
    );
  }

  Widget _buildexpireDate(){
    return Container(
      height: 80,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: DateTime(2021, 1, 1),
        onDateTimeChanged: (DateTime newDateTime) {
          DateTime now = newDateTime;
          String formattedDate = DateFormat('yyyy-MM-dd').format(now);
          _expireDate=DateFormat('yyyy-MM-dd').format(now);
        },
      ),
    );
  }
  Widget _buildsalary(){

    return TextFormField(decoration: InputDecoration(labelText: 'salary'),
      maxLength: 20,keyboardType: TextInputType.number,
      validator: (String? value){
        if(value!=null && value.isEmpty){
          return "salary is required";
        }
        return null;
      },
      onSaved: (String? value){
        _salary=value!;
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(title: Text("SignUP Job"),),body: SingleChildScrollView(
      child: Container( margin: EdgeInsets.all(24), child: Form(key: _formKey, child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ _buildjobTitle(), _buildjobDescription(), _buildjobRequirement(),_buildcatagory(), _buildcompanyName(),
          _buildcompanyLocation(), _buildpostDate(), _buildexpireDate(), _buildsalary(),
          SizedBox(height: 100,),
          ElevatedButton ( child: Text('SignUp',style: TextStyle(color: Colors.blue, fontSize: 16),),
            onPressed: () {
              if(!_formKey.currentState!.validate()){
                return;
              }
              _formKey.currentState!.save();


              if(_expireDate!.compareTo(_postDate!)>0){
                print("$_jobTitle,$_jobDescription,$_jobRequirement,$_category,$_companyName,$_companyLocation,$_postDate,$_expireDate,$_salary");
                registerJob(_jobTitle!,_jobDescription!,_jobRequirement!,_category!,_companyName!,_companyLocation!,_postDate!,_expireDate!,_salary!);
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

