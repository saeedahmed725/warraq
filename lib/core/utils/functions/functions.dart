class AppFunctions {
  AppFunctions._();

  static String toArabicNumbers(String value) {
    return value
        .replaceAll('0', '٠')
        .replaceAll('1', '١')
        .replaceAll('2', '٢')
        .replaceAll('3', '٣')
        .replaceAll('4', '٤')
        .replaceAll('5', '٥')
        .replaceAll('6', '٦')
        .replaceAll('7', '٧')
        .replaceAll('8', '٨')
        .replaceAll('9', '٩');
  }

  /// Text Validation
  static String? validateName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value?.isEmpty ?? true) {
      return "Name is required";
    } else if (!regExp.hasMatch(value ?? '')) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  static String? validateMobile(String? value) {
    String pattern = r'(^\+?[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value?.isEmpty ?? true) {
      return "Mobile phone number is required";
    } else if (!regExp.hasMatch(value ?? '')) {
      return "Mobile phone number must contain only digits";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if ((value?.length ?? 0) > 8) {
      return 'يجب ألا تكون كلمة المرور أقل من 8 أحرف';
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value ?? '')) {
      return 'أدخل بريد إلكتروني صالح';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return 'Password doesn\'t match';
    } else if (confirmPassword?.isEmpty ?? true) {
      return 'Confirm password is required';
    } else {
      return null;
    }
  }
}
