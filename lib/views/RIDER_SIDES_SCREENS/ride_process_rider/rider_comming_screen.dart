import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/Rider_ride_process_provider.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';



class RiderCommingScreen extends StatefulWidget {
  const RiderCommingScreen({super.key});

  @override
  State<RiderCommingScreen> createState() => _RiderCommingScreenState();
}

class _RiderCommingScreenState extends State<RiderCommingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<RiderRideProcessProvider>(context,listen: false).onRiderCommingInit(context: context);
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
          NotificationButton(onTap: (){})
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
