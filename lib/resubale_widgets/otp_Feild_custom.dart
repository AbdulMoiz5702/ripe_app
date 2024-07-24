import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';

class CustomOtpField extends StatefulWidget {
  const CustomOtpField({super.key});

  @override
  _CustomOtpFieldState createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(6, (index) {
          return Container(
            alignment: Alignment.topCenter,
            width: 40,  // Increased width to make the circles more prominent
            height: 40,  // Added height to ensure the container is circular
            child: TextFormField(
              enabled: true,
              cursorColor: Colors.black45,
              controller: _controllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                counterText: '',
                enabledBorder:  OutlineInputBorder(
                  borderSide: const BorderSide(color: otpColor,),
                  borderRadius: BorderRadius.circular(25.0), // Circular border
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: otpColor,width: 2),
                  borderRadius: BorderRadius.circular(25.0), // Circular border
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black,width: 2),
                  borderRadius: BorderRadius.circular(25.0),  // Circular border
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (index < 5) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).unfocus();
                    // Submit the OTP or move to the next step
                  }
                }
              },
            ),
          );
        }),
      ),
    );
  }
}
