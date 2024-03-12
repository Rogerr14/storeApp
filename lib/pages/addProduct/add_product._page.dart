import 'package:flutter/material.dart';


class AddProductPage extends StatefulWidget {
  static String name = 'addProductPage';
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final txtTitle = TextEditingController();
  final txtPrice = TextEditingController();
  final txtDescription = TextEditingController();
  final txtCategory = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black26,
        title: const Text(
          'FAKE STORE',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.photo)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Nombre Producto'),
              //CustomTextForm('Nombre Producto', txtTitle, isEmail),
              const SizedBox(
                height: 30,
              ),
              const Text('imagen'),
              const SizedBox(
                height: 300,
                width: 300,
                child: Image(
                  image: AssetImage('assets/image_nf.png'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Precio'),
            //  customTextForm('Precio', txtTitle, isPassword),
              const SizedBox(
                height: 30,
              ),
              const Text('Descripcion'),
              //CustomTextForm('Descripcion',  txtTitle, isEmail),
              const SizedBox(
                height: 30,
              ),
              const Text('Categoria'),
              //CustomTextForm('Categoria', co txtTitle),
              const SizedBox(
                height: 30,
              ),
              OutlinedButton(onPressed: (){}, child: const Text('Agregar Producto')),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
