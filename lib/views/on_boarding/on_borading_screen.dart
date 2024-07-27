import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/consts/images_path.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';
import 'package:ride_app/views/role_selection_screen/select_role.dart';
import '../../resubale_widgets/CustomButton.dart';
import 'lines_indicator.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<Widget> _buildPages() {
    return [
      const OnboardingPage(
        imagePath:calender,
        title: 'Worem ipsum dolor si amnet,',
        title2: 'consectutor adipiscing',
        description: 'Porem ipsum dolor sit amet, consectetur adipiscing',
        description2: 'elit. Nunc vulputate libero et velit.',
      ),
      const OnboardingPage(
        imagePath:message,
        title: 'Worem ipsum dolor si amnet,',
        title2: 'consectutor adipiscing',
        description: 'Porem ipsum dolor sit amet, consectetur adipiscing',
        description2: 'elit. Nunc vulputate libero et velit.',
      ),
      const OnboardingPage(
        imagePath: bookMark,
        title: 'Worem ipsum dolor si amnet,',
        title2: 'consectutor adipiscing',
        description: 'Porem ipsum dolor sit amet, consectetur adipiscing',
        description2: 'elit. Nunc vulputate libero et velit.',
      ),
      const OnboardingPage(
        imagePath:card,
        title: 'Worem ipsum dolor si amnet,',
        title2: 'consectutor adipiscing',
        description: 'Porem ipsum dolor sit amet, consectetur adipiscing',
        description2: 'elit. Nunc vulputate libero et velit.',
      ),
    ];
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: 130,
            child: RichText(
                text:  TextSpan(children: [
              TextSpan(
                  text: 'Logo',
                  style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
              TextSpan(
                  text: 'ipsum',
                  style: TextStyle(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 22))
            ])),
          ),
          Positioned(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _buildPages(),
            ),
          ),
          Positioned(
            top: 130.0,
            left: 0.0,
            right: 0.0,
            child: LineIndicator(
              itemCount: 4,
              currentIndex: _currentIndex,
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentIndex < 3
                    ? GestureDetector(
                  onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (conetxt)=> const SelectRole()));
                  },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                            child: normalText(title: 'Skip', color: theme.primaryColor,weight: FontWeight.w400)))
                    : const SizedBox(
                        height: 1,
                        width: 1,
                      ),
                Row(
                  children: [
                    _currentIndex < 3 ? CustomButton(
                      borderRadius: 30,
                      width: 0.3,
                      onTap: () {
                        if (_currentIndex < 3) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        } else {
                         Navigator.push(context, CupertinoPageRoute(builder: (conetxt)=> const SelectRole()));
                        }
                      },
                      title: _currentIndex < 3 ? 'Next' : 'Register',
                    ) : RegisterButton(title: 'Register', onTap: (){
                      if (_currentIndex < 3) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        Navigator.push(context, CupertinoPageRoute(builder: (conetxt)=> const SelectRole()));
                      }
                    }) ,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
