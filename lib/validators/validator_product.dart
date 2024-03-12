String? validarVacio(String? valor) {
  if (valor!.trim().isEmpty) {
    return 'Campo Vacio';
  }

  if (valor.length < 3) {
    return 'Ingrese dato valido';
  }

  return null;
}

String? validarNum(String? valor) {
  if (valor!.trim().isEmpty) {
    return 'Campo Vacio';
  }

  if (double.tryParse(valor) != null) {
    return null;
  } else {
    return 'ingrese un numero';
  }
}
