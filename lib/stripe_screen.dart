//
//
// import 'package:flutter_stripe/flutter_stripe.dart';
//
// class StripeScreen {
//
//   Future<void> makePaymentWithStoredCard() async {
//     try {
//       // Retrieve the stored card token
//       final storedCardToken = await retrieveCardToken();
//       if (storedCardToken != null) {
//         // Use the stored card token to create a PaymentIntent
//         final paymentIntent = await Stripe.instance.confirmPayment(
//         paymentIntentClientSecret:   'client_secret_from_your_server', // Replace with your PaymentIntent client secret
//           data: PaymentMethodParams.cardFromToken(
//             paymentMethodData: PaymentMethodDataCardFromToken(
//               token: storedCardToken,
//               billingDetails: BillingDetails(
//                 email: 'email@example.com',
//               ),
//             ),
//           ),
//         );
//
//         // Handle successful payment
//         print('Payment successful: $paymentIntent');
//       } else {
//         print('No stored card token found');
//       }
//     } catch (e) {
//       // Handle error
//       print('Error: $e');
//     }
//   }
//
//
// }