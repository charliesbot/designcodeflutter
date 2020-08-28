import 'package:flutter/material.dart';
import 'package:hume/constants.dart';
import 'package:hume/model/course.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ContinueWatchingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(34.0),
      ),
      color: kCardPopupBackgroundColor,
      minHeight: 85,
      maxHeight: MediaQuery.of(context).size.height * 0.75,
      boxShadow: [
        BoxShadow(
          color: kShadowColor,
          offset: Offset(0, -12),
          blurRadius: 32,
        ),
      ],
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 12,
                bottom: 16,
              ),
              child: Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: Color(0xFFC5CBD6),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Text(
              "Continue watching",
              style: kTitle2Style,
            ),
          ),
          ContinueWatchingCard(course: continueWatchingCourses[0]),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Text(
              "Certificates",
              style: kTitle2Style,
            ),
          ),
        ],
      ),
    );
  }
}

class ContinueWatchingCard extends StatelessWidget {
  ContinueWatchingCard({this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              right: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: course.background,
                borderRadius: BorderRadius.circular(41.0),
                boxShadow: [
                  BoxShadow(
                    color: course.background.colors[0].withOpacity(0.3),
                    offset: Offset(0, 20),
                    blurRadius: 20,
                  ),
                  BoxShadow(
                    color: course.background.colors[1].withOpacity(0.3),
                    offset: Offset(0, 20),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(41),
                child: Container(
                  height: 140,
                  width: 260,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                'asset/illustrations/${course.illustration}',
                                fit: BoxFit.cover,
                                height: 110,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              course.courseSubtitle,
                              style: kCardSubtitleStyle,
                            ),
                            SizedBox(height: 6.0),
                            Text(
                              course.courseTitle,
                              style: kCardTitleStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Image.asset('asset/icons/icon-play.png'),
            width: 60,
            height: 60,
            padding: EdgeInsets.only(
              top: 12.5,
              bottom: 13.5,
              left: 20.5,
              right: 14.5,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 4),
                  blurRadius: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
