class SignUp {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? cnic;
  final String? phoneNo;
  SignUp({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.cnic,
    this.phoneNo,
  });
  factory SignUp.fromJson(Map<String, dynamic> data) {
    return SignUp(
      firstName: data['first_name'],
      lastName: data['last_name'],
      email: data['email'],
      password: data['password'],
      cnic: data["cnic"],
      phoneNo: data["phone_number"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'customer_cnic': cnic,
      'customer_phone_no': phoneNo,
    };
  }
}
