class valdiate {
  String patternEmail = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.com$';
  String pattern_password =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  bool? isValidEmail;
  bool? isValidpassword;

  bool valdiateemail({required String? email}) {
    isValidEmail = RegExp(patternEmail).hasMatch(email!);
    return isValidEmail!;
  }

  bool valdiatepassword({required String? password}) {
    isValidpassword = RegExp(pattern_password).hasMatch(password!);
    return isValidpassword!;
  }
}
