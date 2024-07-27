import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        width: MediaQuery.sizeOf(context).width * .7,
        child: const Text(
          'Register Now',
          // 'Login',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            // color: Color.fromARGB(255, 110, 200, 239),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
