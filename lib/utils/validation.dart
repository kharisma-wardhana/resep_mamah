part of 'utils.dart';

String validatePassword(String password) {
  if (password.isEmpty) {
    return "Password can't be empty";
  }
  if (!(password.length > 5) && password.isNotEmpty) {
    return "Password should contain more than 5 characters";
  }
  return null;
}

String validateEmail(String email) {
  if (email.isEmpty) {
    return "Email can't be empty";
  }
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if (!emailValid) {
    return "Please input valid email";
  }
  return null;
}
