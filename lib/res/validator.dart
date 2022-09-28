var regEx = RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
RegExp numReg = RegExp(r".*[0-9].*");
RegExp phoneNumReg = RegExp(r"^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$");
RegExp letterReg = RegExp(r".*[A-Za-z].*");

String? uNameValidatorEn(String? value) {
  if (value!.isEmpty) {
    return 'Enter your user name';
  }
  if (value.length > 15) {
    return 'Exceeded 15 characters';
  }
  return null;
}

String? uNameValidatorAr(String? value) {
  if (value!.isEmpty) {
    return 'أدخل اسم المستخدم الخاص بك';
  }
  if (value.length > 15) {
    return 'تم تجاوز 15 حرفًا';
  }
  return null;
}

String? passwordValidatorEn(String? value) {
  if (value!.isEmpty) {
    return 'Enter your password';
  }
  if (value.length > 8) {
    return 'Exceeded 8 characters';
  }
  return null;
}

String? passwordValidatorAr(String? value) {
  if (value!.isEmpty) {
    return 'ادخل رقمك السري';
  }
  if (value.length > 8) {
    return 'تم تجاوز 8 حرفًا';
  }
  return null;
}

String? emailValidator(String? value) {
  if (!regEx.hasMatch(value!)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? nameValidator(String? value) {
  if (value!.isEmpty) {
    return 'Enter your name';
  }
  if (value.length > 30) {
    return 'Exceeded 30 characters';
  }
  return null;
}

String? nonEmptyValidator(String? value) {
  if (value!.isEmpty) {
    return 'Field can not be empty';
  }
  return null;
}

String? addressValidator(String? value) {
  if (value!.isEmpty) {
    return 'Enter your address';
  }
  if (value.length > 150) {
    return 'Exceeded 150 characters';
  }
  return null;
}

String? nationalIdValidator(String? value) {
  if (value!.isEmpty) {
    return 'Enter your address';
  }
  if (value.length > 30) {
    return 'Exceeded 30 characters';
  }
  return null;
}

String? phoneValidator(String? value) {
  if (!phoneNumReg.hasMatch(value!)) {
    return 'Enter a valid phone number';
  } else if(value.length > 10) {
    return 'Enter a valid phone number';
  }
  return null;
}

String? empNoValidator(String? value) {
  if (!numReg.hasMatch(value!)) {
    return 'Enter a valid national ID';
  } else if(value.length > 10) {
    return 'Enter a valid national ID';
  }
  return null;
}
