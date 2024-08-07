import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/pessenger_ride_process_provider.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';


class PessengerRiderComing extends StatefulWidget {
  const PessengerRiderComing({super.key});

  @override
  State<PessengerRiderComing> createState() => _PessengerRiderComingState();
}

class _PessengerRiderComingState extends State<PessengerRiderComing> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var controller =  Provider.of<PessengerRideProcessProvider>(context,listen: false);
    controller.onPessengerRiderComingBottomSheetInit(context: context);
    controller.changeChangeValue();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: CustomLeading(),
        actions: [
          NotificationButton(onTap: (){}),
        ],
      ),
    );
  }
}
