import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  final bool isPassword;
  final TextEditingController controller;
  final String title;
   final String Function(String?)? validator;
   const CustomTextForm(
      this.title,
      this.controller,
      this.validator,{
      super.key,
      this.isPassword =false, 
      });

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => setState(() {    }),

      child: SizedBox(
        width: 300,
        height: 50,
        child: TextFormField(
          
          obscureText: widget.isPassword,
          controller: widget.controller,
          validator: (value) => widget.validator!(value) ,
          
          decoration: InputDecoration(
            
            contentPadding: const EdgeInsets.all(15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: widget.title,
          ),
        ),
      ),
    );
  }
}
