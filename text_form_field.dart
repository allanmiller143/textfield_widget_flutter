// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFormField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Icon icon;
  final Color? color; // Cor opcional
  final bool obscureText; // obscureText opcional

  const MyFormField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.icon,
    this.color, // Cor opcional
    this.obscureText = false, // Valor padrão para obscureText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RxBool showPassword = false.obs; // Usando RxBool do GetX

    return GetBuilder<EmailFormFieldController>(
      init: EmailFormFieldController(), // Inicializa o controlador
      builder: (emailController) => Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: color ?? Color.fromARGB(0, 255, 255, 255), // Cor padrão se color for nulo
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: const Color.fromARGB(255, 255, 255, 255),width: 0.5),
            ),
            child: TextFormField(
              controller: controller,
              obscureText: showPassword.value ? false : obscureText,
              style: TextStyle(color: color ?? Colors.white), // Cor padrão se color for nulo
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  color: color ?? Colors.white, // Cor padrão se color for nulo
                  fontWeight: FontWeight.w300,
                ),
                prefixIcon: icon,
                prefixIconColor: color ?? Colors.white, // Cor padrão se color for nulo
                suffixIcon: obscureText
                    ? IconButton(
                        onPressed: () {
                          showPassword.toggle(); // Alternar o valor de showPassword
                          emailController.updateState(); // Atualizar o estado do widget
                        },
                        icon: 
                            Icon(
                              showPassword.value ? Icons.visibility : Icons.visibility_off,
                              color: color ?? Colors.white, // Cor padrão se color for nulo
                            )):null,
                      
                suffixIconColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmailFormFieldController extends GetxController {
  void updateState() {
    update(); // Notifica os observadores sobre a atualização do estado
  }
}
