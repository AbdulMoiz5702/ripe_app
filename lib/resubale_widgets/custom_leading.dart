import 'package:flutter/material.dart';


class CustomLeading extends StatelessWidget {
  const CustomLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){ Navigator.pop(context); },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child:const Center(child: Icon(Icons.arrow_back,color: Colors.black,),),
      ),
    );
  }
}
