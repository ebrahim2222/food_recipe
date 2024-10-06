class Validator {
  Validator._();

  static bool isValidEmail(String? email) {
    const emailRegExpString = r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
        r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';
    if (email!.isEmpty) return false;
    if (RegExp(emailRegExpString).hasMatch(email)) return false;
    return true;
  }

  static bool isNotValidPhone(String? phone) {
    String pattern = r'^(05)(5|0|3|6|4|9|1|8|7)([0-9]{7})$';
    if (phone!.isEmpty) {
      return true;
    } else if (RegExp(pattern).hasMatch(phone)) {
      return false;
    }

    return true;
  }

  static bool isPasswordsMatch(String? pass, String? confirmedPass) {
    return pass != confirmedPass;
  }

  static bool isValidUserName(String? userName) {
    return userName!.length >= 3;
  }

  static bool isPasswordValid(String? password) {
    if (password!.isEmpty) {
      return false;
    } else if (password.length < 4) {
      return false;
    }
    return true;
  }
}
