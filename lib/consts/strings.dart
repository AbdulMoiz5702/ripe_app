

import 'package:ride_app/consts/images_path.dart';
import 'package:flutter/material.dart';

import '../models/quiz_model.dart';

var servicesName = [
  'Ride',
  'Explore City',
  'Hire Driver',
];



var inviteLargeOne = [
  'Tourist',
  'Find a driver',
];

var inviteLargeSecond = [
  'driver',
  'friends',
];

var inviteSmallOne = [
  'Explore if you’re',
  'Get yourself a ',
];


var inviteSmallSecond = [
  'new to the city.',
  'personal driver.',
];

var inviteImages = [
  parkSvg,
  steeringWheelsSVG,
];

var names = [
  'Abdul Moiz',
  'Ishaq Farid',
  'Luqman Ali',
  'Movadat Kazmi',
  'Abdul Moiz',
  'Ishaq Farid',
  'Luqman Ali',
  'Movadat Kazmi',
];

var rating = [
   2.2,
  2.7,
  2.5,
  2.4,
  2.2,
  2.7,
  2.5,
  2.4,
];

var reviews = [
  24,
  76,
  5,
  43,
  24,
  76,
  5,
  43,
];

var role = [
  null,
  'Local Guide',
  null,
  'Local Guide',
  null,
  'Local Guide',
  null,
  'Local Guide',
];

var icons = [
  null,
  lightningSVG,
  null,
  diamondSVG,
  null,
  diamondSVG,
  null,
  lightningSVG,
];

var images = [
  car,
  wagon,
  car,
  wagon,
  car,
  wagon,
  car,
  wagon,
];

var vechile = [
  'https://wallpapers.com/images/featured/mclaren-js7crb2zb9wbk7zk.jpg',
  'https://wallpapers.com/images/featured/mclaren-js7crb2zb9wbk7zk.jpg',
  'https://wallpapers.com/images/featured/mclaren-js7crb2zb9wbk7zk.jpg',
  'https://wallpapers.com/images/featured/mclaren-js7crb2zb9wbk7zk.jpg',
  'https://wallpapers.com/images/featured/mclaren-js7crb2zb9wbk7zk.jpg',
  'https://wallpapers.com/images/featured/mclaren-js7crb2zb9wbk7zk.jpg',
  'https://wallpapers.com/images/featured/mclaren-js7crb2zb9wbk7zk.jpg',
];

var yourAccount = [
  cardSVG,
  favoriteSVG,
  passwordSVG,
];

var yourAccountText = [
  'Payment & wallet',
  'Saved address',
  'Password',
];

var yourActivity= [
  rideHistorySVG,
  favoriteSVG,
];

var yourActivityText = [
  'Ride History',
  'Favorite drivers',
];

var yourSupport= [
  helpSVG,
  startSVG,
];

var yourSupportText = [
  'Help',
  'Rate the app',
];

var yourPreferenceText = [
  'Biometric Login',
  'Languages',
  'Current City',
  'Theme',
];

var yourPreference= [
  bioMetricSVG,
  languagesSVG,
  currentLocationSVG,
  themeSVG,
];


var exploreScreen = [
  'Attractions',
  'Shopping',
  'Airport',
  'Cate & Restaurant',
  'Airport',
];

var exploreScreenIcons = [
  parkSvg,
  airplaneTakeoff,
  handBagSvg,
  hamBurger,
  airplaneTakeoff,
];


var creditCardSheetIcon = [
  creditCardSvg,
  payPalSvg,
];

var creditCardSheetText = [
  'Credit card',
  'Paypal',
];

var compatetorsIcons = [
  uberLogoSvg,
  brandLogoSvg,
  ylaSvg
];

var selectTheme = [
  'Device theme (Default)',
  'Light theme',
  'Dark theme',
];


var paymentCards = [
  visaCardSVG,
  masterCardSVG,
  amexCardSVG,
];
var paymentoptionsImages = [
  payPalSvg,
  creditCardSvg,
  applepaySVG,
  googlePaySVG
];

var paymentoptionsText = [
  'Paypal',
  'Cards',
  'Apple Pay',
  'Google Pay'
];

var monthlyEarning = [
  {'Month': 'Feb 2024', 'earning': '2,000'},
  {'Month': 'Feb 2024', 'earning': '2,000'},
  {'Month': 'Mar 2024', 'earning': '2,500'},
  {'Month': 'Apr 2024', 'earning': '3,000'},
  {'Month': 'Feb 2024', 'earning': '2,000'},
  {'Month': 'Mar 2024', 'earning': '2,500'},
  {'Month': 'Apr 2024', 'earning': '3,000'},
];


List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    question: 'How physically tired do you feel right now?',
    options: ['Not tired at all','Slightly tired', 'Moderately tired','Very tired'],
    correctAnswerIndex: 1,
  ),
  QuizQuestion(
    question: 'How would you describe your emotional state at this moment?',
    options: ['Calm and relaxed', 'Anxious or stressed', 'Irritated or angry','Depressed or sad'],
    correctAnswerIndex: 2,
  ),
  QuizQuestion(
    question: 'How well can you concentrate on your surroundings while driving?',
    options: ['Very well', 'Somewhat well', 'Not very well','Poorly'],
    correctAnswerIndex: 2,
  ),
  QuizQuestion(
    question: 'Imagine a sudden obstacle appears on the road. How confident are you in your ability to react quickly?',
    options: ['Very confident', 'Somewhat confident', 'Somewhat confident','Somewhat confident'],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'Are you experiencing any physical discomfort (e.g., headache, back pain, etc.) right now?',
    options: ['No discomfort', 'Mild discomfort', 'Moderate discomfort','Severe discomfort'],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'How well did you sleep last night?',
    options: ['Very well', 'Very well', 'Not well','Didn’t sleep at all'],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'On a scale of 1 to 10, how stressed do you feel currently?',
    options: ['1 (Not stressed)', '3', '6','10 (Extremely stressed)'],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'Have you taken any medication or substances (including alcohol) in the last 24 hours?',
    options: ['None', 'Over-the-counter medication', 'Prescription medication','Alcohol or recreational drugs'],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'How would you rate your overall well-being right now?',
    options: ['Excellent', 'Good', 'Fair','Poor'],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'How aware are you of your surroundings while driving?',
    options: ['Extremely aware', 'Reasonably aware', 'FairSomewhat aware','Not aware at all'],
    correctAnswerIndex: 0,
  ),

];


var repostIssue = [
  'Lost item in the ride',
  'Driver didn\'t drop me at my location',
  'Payment not received ',
  'Passenger was rude',
  'Any other issue',
];

var riderCancel = [
  'Driver didn\'t show up',
  'Waited for the driver for too long',
  'Wrong address ',
  'Driver was rude',
  'Driver asked to cancel',
  'Other issue',
];


var repostIssueUser = [
  'Lost item in the ride',
  'Driver didn\'t drop me at my location',
  'Any other issue',
];

final List<String> tagsTip = [
  '0', '5', '10', '15', '20', 'Custom',
];


var building = [
  Icons.business_outlined,
  Icons.home_outlined,
  Icons.food_bank_outlined,
  Icons.water_damage_outlined,
];

var flagList = [
  arabia,
  bangladesh,
  china,
  france,
  italy,
  iran,
  japan,
  pakistan,
  spain,
  uk,
  usa,
];


var flagListTile = [
  'Arabic',
  'Bengali',
  'Chinese',
  'French',
  'Italian',
  'Persian',
  'Japanese',
  'Urdu',
  'Spanish',
  'English',
  'English',
];

var flagListSubTile = [
  'العربية',
  'বাংলা',
  '',
  'Français',
  'Italiano',
  'فارسی',
  '',
  'اردو',
  'Español',
  'United Kingdom',
  'USA',
];


var defaultCityList = [
  'New York City, New York',
  'Los Angeles, California',
  'Chicago, Illinois',
  'Houston, Texas',
  'Phoenix, Arizona',
  'Philadelphia, Pennsylvania',
  'San Antonio, Texas',
  'San Diego, California',
  'Dallas, Texas',
  'San Jose, California',
];

var helpAndSupportList = [
  'All',
  'Rides',
  'Pay',
  'Drivers',
  'Emergency',
  'Payments',
  'Cards',
];


var allQuestionsList = [
  'What payment methods are accepted?',
  'Can I schedule a ride in advance?',
  'What safety features are in place?',
  'What safety features are in place?',
  'What if I left something in the car?',
  'How do I become a driver?',
];

var bottomIconList = [
  houseSvg,
  calenderSvg,
  calenderSvg,
  bellSimpleSvg,
  userSvg,
];


var bottomTextList = [
  'Home',
  'Schedule',
  'Book Ride',
  'Notifications',
  'Profile',
];


