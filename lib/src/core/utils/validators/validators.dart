String? nameValidate(String? value) {
  if (value == '') return 'Cannot be empty!';
  return null;
}

String? emailValidate(String? value) {
  if (RegExp(r'^[.a-zA-Z0-9]+@([a-z]*\.+)*?[a-z]{2,3}$')
      .hasMatch(value ?? '')) {
    return null;
  }
  if (value == '') return 'Cannot be empty!';
  return 'Invalid email';
}

String? phoneValidate(String? value) {
  if (RegExp(r'^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s-]?\d{3}[\s-]?\d{4}$')
      .hasMatch(value ?? '')) {
    return null;
  }
  if (value == '') return 'Cannot be empty!';
  return 'Invalid Phone Number';
}

String? passValidate(String? value) {
  if (value == '') return 'Cannot be empty!';
  if ((value?.length ?? 0) < 6) {
    return 'Password length must be atleast 6';
  }
  return null;
}
