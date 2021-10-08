
class post {
  int ?id;
  String ?firstName;
  String ?middleName;
  String ?lastName;
  String ?phoneNumber;
  String ?email;
  String ?educationalBackground;
  int ?experience;
  String ?address;
  String ?dateOfBirth;
  String ?password;

  post(
      { this.id,
        this.firstName,
        this.middleName,
        this.lastName,
        this.phoneNumber,
        this.email,
        this.educationalBackground,
        this.experience,
        this.address,
        this.dateOfBirth,
        this.password});

  post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    educationalBackground = json['educationalBackground'];
    experience = json['experience'];
    address = json['address'];
    dateOfBirth = json['dateOfBirth'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['educationalBackground'] = this.educationalBackground;
    data['experience'] = this.experience;
    data['address'] = this.address;
    data['dateOfBirth'] = this.dateOfBirth;
    data['password'] = this.password;
    return data;
  }
}