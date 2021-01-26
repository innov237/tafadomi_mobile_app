import 'package:flutter/material.dart';
import 'package:tafadomi/core/palettes/colors_palette.dart';
import 'package:tafadomi/pages/home_page.dart';
import 'package:tafadomi/pages/tabs_page.dart';

class OnboardingPage extends StatefulWidget {
  static String routeName = "/onboading";
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var _controller = PageController();
  var initialPage = 0;

  List onboardingList = [
    {
      'image': 'assets/images/cleaning2.png',
      'title': 'Cleaning Services',
      'text': "1 lorent umpsum dolor it hamer",
    },
    {
      'image': 'assets/images/painter.png',
      'title': 'Painting Services',
      'text': "2 lorent umpsum dolor it hamer",
    },
    {
      'image': 'assets/images/beauty2.png',
      'title': 'Beauty at Home',
      'text': "2 lorent umpsum dolor it hamer",
    },
  ];

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        initialPage = _controller.page.round();
      });
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            _appBar(),
            _body(_controller),
            _indicator(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _controller.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              if (initialPage == onboardingList.length - 1) {
                Navigator.pushNamed(context, TabsPage.routeName);
                return;
              }
              _controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
            child: Text(
              "Ship",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(PageController _controller) {
    return Expanded(
      child: PageView.builder(
        controller: _controller,
        itemCount: onboardingList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset(
                    onboardingList[index]['image'],
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  onboardingList[index]['title'],
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  onboardingList[index]['text'],
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _indicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        height: 65.0,
        width: 65.0,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: PaletteColor.secondaryColor,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  if (initialPage == onboardingList.length - 1) {
                    Navigator.pushNamed(context, TabsPage.routeName);
                    return;
                  }
                  _controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                child: Container(
                  width: 65.0,
                  height: 65.0,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black.withOpacity(0.1),
                    valueColor: AlwaysStoppedAnimation(
                      PaletteColor.secondaryColor,
                    ),
                    value: (initialPage + 1) / (onboardingList.length + 1),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
