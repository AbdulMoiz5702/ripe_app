import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/views/on_boarding/on_borading_screen.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'call_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();



// Assuming your existing imports

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedName = prefs.getString('name');
  String? savedId = prefs.getString('id');
  String? savedInviteId = prefs.getString('inviteId');
  // Conditionally decide where to navigate
  Widget initialRoute = savedName != null && savedId != null && savedInviteId != null
      ? CallScreen(callerName: savedName, userId: savedId, inviteId: savedInviteId)
      : MyHomePage(title: 'Flutter Demo Home Page');
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );
    runApp(MyApp(navigatorKey: navigatorKey, initialRoute: initialRoute));
  });
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget initialRoute;
  const MyApp({required this.navigatorKey, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
        theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        primary: Colors.deepPurple,
        secondary: Colors.deepPurpleAccent,
    ),
    scaffoldBackgroundColor: Colors.white, ),

    home: OnboardingScreen(),
    );
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
              decoration: InputDecoration(
                hintText: 'Enter Name ',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: id,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter your id ',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: inviteId,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
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
              child: Text('Proceed for the calling'),
            ),
          ],
        ),
      ),
    );
  }
}

