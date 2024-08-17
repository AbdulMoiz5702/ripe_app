import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/shedule_ride_provider.dart';


class CurrentPickUpScreen extends StatefulWidget {
  const CurrentPickUpScreen({super.key});

  @override
  State<CurrentPickUpScreen> createState() => _CurrentPickUpScreenState();
}

class _CurrentPickUpScreenState extends State<CurrentPickUpScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<ScheduleRideProvider>(context,listen: false).onInIt(context: context);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Scaffold(
      backgroundColor:theme.primaryColor ,
    );
  }
}
