import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/shedule_ride_provider.dart';
import '../../resubale_widgets/custom_leading.dart';
import '../../resubale_widgets/rider_offer_card.dart';


class RouteDetailsDetailsScreen extends StatefulWidget {
  const RouteDetailsDetailsScreen({super.key});

  @override
  State<RouteDetailsDetailsScreen> createState() => _RouteDetailsDetailsScreenState();
}

class _RouteDetailsDetailsScreenState extends State<RouteDetailsDetailsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ScheduleRideProvider>(context,listen: false).onRouteDetailsInit(context: context);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeading(
          isHome: true,
        ),
        actions: [
          NotificationButton(onTap: () {},)
        ],
      ),
      backgroundColor: theme.primaryColor,
      body: Stack(
        fit:StackFit.expand,
        children: [

        ],
      ),
    );
  }
}
