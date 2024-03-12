  import 'dart:io';

  import 'package:flutter/material.dart';
  import 'package:image_picker/image_picker.dart';
  import 'package:provider/provider.dart';

  import 'package:store_app/providers/addproduct_provider.dart';
  import 'package:store_app/validators/validator_product.dart';

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

    final _scaffoldKey = GlobalKey<FormState>();
    File? _image;

    Future getImage(ImageSource source) async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    }

    @override
    void initState() {
      // TODO: implement initState
      
      super.initState();
    }

    @override
    void dispose() {
      txtTitle.dispose();
      txtPrice.dispose();
      txtDescription.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      final addProductProvider =
          Provider.of<AddProductProvider>(context, listen: false);
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black26,
          title: const Text(
            'FAKE STORE',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () => getImage(ImageSource.gallery),
                icon: const Icon(Icons.photo)),
            IconButton(
                onPressed: () => getImage(ImageSource.camera),
                icon: const Icon(Icons.camera_alt)),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _scaffoldKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Nombre Producto:'),
                  _customTextForm(validarVacio,
                      hintText: 'Producto', textController: txtTitle),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('imagen'),
                  (_image == null)
                      ? const SizedBox(
                          height: 300,
                          width: 300,
                          child: Image(
                            image: AssetImage('assets/image_nf.png'),
                          ),
                        )
                      : SizedBox(
                          height: 300,
                          width: 300,
                          child: Image.file(_image!),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Precio'),
                  _customTextForm(validarNum,
                      textInputType: TextInputType.number,
                      hintText: 'Precio',
                      textController: txtPrice),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Descripcion'),
                  _customTextForm(validarVacio,
                      hintText: 'Descripcion', textController: txtDescription),
                  const SizedBox(
                    height: 30,
                  ),
                  _addButton(addProductProvider),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    _addButton(AddProductProvider addProductProvider) {
      return OutlinedButton(
          onPressed: () {
            if (_scaffoldKey.currentState!.validate()) {
              print(txtTitle.text);
              addProductProvider.addProduct(
                  txtTitle.text, _image, txtPrice.text, txtDescription.text);
            }
          },
          child: const Text('Agregar Producto'));
    }

    Widget _customTextForm(
      String? Function(String?) validator, {
      TextInputType textInputType = TextInputType.text,
      required String hintText,
      required TextEditingController textController,
    }) {
      final focusNode = FocusNode();
      return SizedBox(
          width: 300,
          height: 75,
          child: TextFormField(
              controller: textController,
              validator: validator,
              focusNode: focusNode,
              keyboardType: textInputType,
              onTapOutside: (event) => focusNode.unfocus(),
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: const EdgeInsets.all(15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              )));
    }
  }
