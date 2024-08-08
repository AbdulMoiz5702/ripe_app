import 'package:flutter/material.dart';
import 'package:ride_app/views/rider_side_screens/request_screen/bookings/ride_details_screen.dart';
import 'booking_card.dart';


class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        cacheExtent: 0,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index){
      return LocationCard(date: '7 May, 2024, ', time: '3:39PM', price: 20, distance: 20, locations: [
        'H2VV+96R, 7 Main Peshawar Rd, Saddar, Rawalpindi, Punjab 46000, Pakistan',
        'Askari 11, Rawalpindi, Punjab 46000, Pakistan',
        'Liaquat Bagh, Rawalpindi, Punjab 46000, Pakistan',
      ], onTap: () {  
        Navigator.push(context, MaterialPageRoute(builder: (context)=> RideDetailsScreen()));
      },);
    });
  }
}
