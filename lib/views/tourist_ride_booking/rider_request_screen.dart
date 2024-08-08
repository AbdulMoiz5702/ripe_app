import 'package:flutter/material.dart';
import '../../resubale_widgets/rider_offer_card.dart';
import 'bottom_sheet/search_for_rider_bottom.dart';

class RiderRequestScreen extends StatelessWidget {
  const RiderRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: theme.primaryColor,
      body: Stack(
        fit : StackFit.expand,
        alignment: Alignment.center,
        children: [
          Column(
            children: List.generate(3, (index) {
              return RideOfferCard();
            }),
          ),
          const SearchForRiderBottom(),
        ],
      ),
    );
  }
}
