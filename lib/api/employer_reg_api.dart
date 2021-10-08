

import 'dart:convert';

import 'package:http/http.dart' as http;


Future<dynamic>? registerEmplyer(
String _companyName,
String _phoneNumber,
String _contactPerson,
String _companyDescription,
String _companyLocation,
String _email,
String  _postalCode,
String  _password,) async {
  final response= await http.post( Uri.parse('https://abyssinia-job-api.herokuapp.com/api/employer/create'),
    headers: <String,String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String,String>{
      'companyName': _companyName,
      'phoneNumber': _phoneNumber,
      'contactPerson': _contactPerson,
      'companyDescription': _companyDescription,
      'companyLocation': _companyLocation,
      'email': _email,
      'postalCode':_postalCode,
      'password': _password
    }),
  );


  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    final data = jsonDecode(response.body);
    print(data);
    return data;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to register Job.');
  }


}
