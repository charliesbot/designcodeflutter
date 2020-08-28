import 'package:flutter/material.dart';
import 'package:hume/components/home_screen_navbar.dart';
import 'package:hume/components/list/explore_course_list.dart';
import 'package:hume/components/list/recent_course_list.dart';
import 'package:hume/screens/sidebar_screen.dart';
import 'package:hume/screens/continue_watching_screen.dart';
import 'package:hume/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Animation<Offset> sidebarAnimation;
  Animation<double> fadeAnimation;
  AnimationController sidebarAnimationController;
  bool sidebarHidden = true;

  @override
  void initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 250,
      ),
    );
    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    sidebarAnimationController.dispose();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  HomeScreenNavBar(triggerAnimation: () {
                    setState(() {
                      sidebarHidden = !sidebarHidden;
                    });

                    sidebarAnimationController.forward();
                  }),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Recents", style: kLargeTitleStyle),
                        SizedBox(height: 5),
                        Text("23 courses, more comming", style: kSubtitleStyle),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  RecentCourseList(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 25,
                      bottom: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Explore",
                          style: kTitle1Style,
                        )
                      ],
                    ),
                  ),
                  ExploreCourseList(),
                ],
              ),
            ),
            ContinueWatchingScreen(),
            IgnorePointer(
              ignoring: sidebarHidden,
              child: Stack(
                children: [
                  FadeTransition(
                    opacity: fadeAnimation,
                    child: GestureDetector(
                      onTap: () {
                        sidebarAnimationController.reverse();
                        setState(() {
                          sidebarHidden = !sidebarHidden;
                        });
                      },
                      child: Container(
                        color: Color.fromRGBO(36, 48, 41, 0.4),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: sidebarAnimation,
                    child: SafeArea(
                      child: SidebarScreen(),
                      bottom: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
