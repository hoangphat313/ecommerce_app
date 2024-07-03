class TValidator {
  //empty text validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName thì bắt buộc.';
    }
    return null;
  }

  //
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email thì bắt buộc';
    }
    //regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Sai thông tin email';
    }
    return null;
  }

  //
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mật khẩu thì bắt buộc';
    }
    //check password length
    if (value.length < 6) {
      return 'Mật khẩu phải chứa ít nhất 6 kí tự ';
    }
    //check uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Mật khẩu phải chứa ít nhất 1 ký tự in hoa';
    }
    //check number
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Mật khẩu phải chứa ít nhất 1 sô';
    }
    //check special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Mật khẩu phải chứa ít nhất 1 ký tự đặc biệt';
    }
    return null;
  }

  //
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Số điện thoại thì bắt buộc';
    }

    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Sai định dạng số điện thoại (10 chữ sô)';
    }
    return null;
  }
}
