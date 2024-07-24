import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/views/auth_screen/Signup/Step7.dart';
import '../../../consts/images_path.dart';
import '../../../resubale_widgets/Bg_widget.dart';
import '../../../resubale_widgets/CustomButton.dart';
import '../../../resubale_widgets/Custom_Sized.dart';
import '../../../alert_dialogs/custom_alert_dialog.dart';
import '../../../resubale_widgets/custom_leading.dart';
import '../../../resubale_widgets/text_widgets.dart';

class Step6 extends StatefulWidget {
  const Step6({super.key});

  @override
  State<Step6> createState() => _Step6State();
}

class _Step6State extends State<Step6> {

  void _showCustomAlertDialog(BuildContext context) {
    Future.delayed(const Duration(seconds: 1),(){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomAlertDialog();
        },
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showCustomAlertDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: const CustomLeading(),
          backgroundColor: Colors.transparent,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.75,
            width: MediaQuery.sizeOf(context).width * 1,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: 'Logo',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          TextSpan(
                              text: 'ipsum',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18))
                        ])),
                    const CustomSized(
                      height: 0.01,
                    ),
                    largeText(title: 'Account created successfully.',),
                    const CustomSized(
                      height: 0.01,
                    ),
                    smallText(
                      title: 'Your account has been created successfully. You’re ready to use the app now.',),
                    const CustomSized(
                      height: 0.02,
                    ),
                    Center(
                      child: Image(
                        alignment: Alignment.center,
                        image: const AssetImage(accountCreated),
                        isAntiAlias: true,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        fit:BoxFit.cover,
                      ),
                    ),
                    const CustomSized(height: 0.12,),
                    CustomButton(
                      onBoard: false,
                      title: 'Book a ride',
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const Step7(
                                )));
                      },
                      borderRadius: 30,
                      width: 1,
                      height: 0.07,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
