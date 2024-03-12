String? isEmail(String? value) {
  final regExp = RegExp(r'^[^@]+@[^@]+\.[a-zA-Z]{2,}$');
  
  if (value!.isEmpty) {
    return 'Campo Vacio';
  }
  if (regExp.hasMatch(value)) {
    return null;
  } else {
    return 'Correo no valido';
  }

}

String? isPassword(String? value) {
  if (value!.isEmpty) {
    return 'Campo Vacio';
  }
  return null;
}
