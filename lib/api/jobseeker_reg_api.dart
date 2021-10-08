

import 'dart:convert';

import 'package:http/http.dart' as http;


Future<dynamic>? registerJobSeeker(
    String _fName,
    String _mName,
    String _lName,
    String _pNumber,
    String _email,
    String _eBackground,
    String _address,
    String  _experiance,
    String  _dateOfBirth,
    String _password) async {
  final response= await http.post( Uri.parse('https://abyssinia-job-api.herokuapp.com/api/jobseeker/create'),
    headers: <String,String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String,String>{
      'firstName': _fName,
      'middleName': _mName,
      'lastName': _lName,
      'phoneNumber': _pNumber,
      'email': _email,
      'educationalBackground': _eBackground,
      'experience':_experiance,
      'address': _address,
      'dateOfBirth': _dateOfBirth,
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
    throw Exception('Failed to create an account.');
  }


}
