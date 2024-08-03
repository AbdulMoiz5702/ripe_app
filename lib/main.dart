import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/aler_dialog_providers.dart';
import 'package:ride_app/controllers/auth_provider.dart';
import 'package:ride_app/controllers/chat_provider.dart';
import 'package:ride_app/controllers/role_selection_provider.dart';
import 'package:ride_app/controllers/shedule_ride_provider.dart';
import 'package:ride_app/controllers/zego_cloud_provider.dart';
import 'package:ride_app/firebase_options.dart';
import 'package:ride_app/views/account_resterications/timer_remaining_to_account_restore.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'call_screen.dart';
import 'controllers/become_driver_controller.dart';
import 'controllers/bottom_screen_provider.dart';
import 'controllers/custom_leading_feild_provider.dart';
import 'controllers/notiication_provider.dart';
import 'controllers/quiz_controller.dart';
import 'controllers/rider_ride_request_provider.dart';
import 'controllers/theme_provider.dart';
import 'services/custom_theme.dart';



final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  ZegoUIKit().initLog().then((value) {ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI([ZegoUIKitSignalingPlugin()],);});
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScheduleRideProvider()),
        ChangeNotifierProvider(create: (_) => RoleSelectionProvider()),
        ChangeNotifierProvider(create: (_) => AlertDialogProviders()),
        ChangeNotifierProvider(create: (_) => ZegoCloudProvider()),
        ChangeNotifierProvider(create: (_) => BecomeDriverProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => BottomScreenProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => CustomLeadingFieldProvider()),
        ChangeNotifierProvider(create: (_) => RiderRideRequestProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => QuizController()),
      ],
      child: MyApp(navigatorKey: navigatorKey,),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  //final Widget initialRoute;
  const MyApp({super.key, required this.navigatorKey, });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context,provider,_){
      return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          theme: lightTheme(), // Apply light theme
          darkTheme: darkTheme(), // Apply dark theme
          themeMode: provider.themeMode, // Use theme mode from provider
          home:  TimerRemainingToAccountRestore(),
          );
      });
    }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var name = TextEditingController();
  var id = TextEditingController();
  var inviteId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                hintText: 'Enter Name ',
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: id,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter your id ',
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: inviteId,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Other person id',
              ),
            ),
            TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('name', name.text.toString());
                await prefs.setString('id', id.text.trim());
                await prefs.setString('inviteId', inviteId.text.trim());

                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => CallScreen(
                    callerName: name.text.toString(),
                    userId: id.text.trim(),
                    inviteId: inviteId.text.trim(),
                  )),
                );
              },
              child: const Text('Proceed for the calling'),
            ),
          ],
        ),
      ),
    );
  }
}

