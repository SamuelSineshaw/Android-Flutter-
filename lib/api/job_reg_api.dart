

import 'dart:convert';

import 'package:http/http.dart' as http;


Future<dynamic>? registerJob(
String _jobTitle,
String _jobDescription,
String _jobRequirement,
String _category,
String _companyName,
String _companyLocation,
String _postDate,
String _expireDate,
String _salary) async {
  final response= await http.post( Uri.parse('https://abyssinia-job-api.herokuapp.com/api/job/create'),
    headers: <String,String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String,String>{
      'jobTitle': _jobTitle,
      'jobDescription': _jobDescription,
      'jobRequirement': _jobRequirement,
      'category': _category,
      'companyName': _companyName,
      'companyLocation': _companyLocation,
      'postDate':_postDate,
      'expireDate': _expireDate,
      'salary': _salary
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
