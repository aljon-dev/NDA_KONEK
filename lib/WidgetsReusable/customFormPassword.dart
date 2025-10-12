import 'package:flutter/material.dart';

Widget CustomFormPasswordField({
  required String title,
  required TextEditingController controllerName,
  required String hintText,
  required TextInputType type,
  required Icon prefixIcon,
}) {
  // Local state for password visibility
  final ValueNotifier<bool> isShowPassword = ValueNotifier<bool>(false);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      const SizedBox(height: 5),
      ValueListenableBuilder<bool>(
        valueListenable: isShowPassword,
        builder: (context, value, _) {
          return TextFormField(
            controller: controllerName,
            keyboardType: type,
            obscureText: !value,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              hintText: hintText,
              suffixIcon: IconButton(
                onPressed: () {
                  isShowPassword.value = !value;
                },
                icon: Icon(
                  value ? Icons.visibility : Icons.visibility_off,
                ),
              ),
               border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        
              ),
            ),
          );
        },
      ),
    ],
  );
}
