import 'package:flutter/material.dart';
import 'package:hume/constants.dart';
import 'package:hume/model/course.dart';

class RecentCourseCard extends StatelessWidget {
  RecentCourseCard({this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            width: 240,
            height: 240,
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
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 32,
                    left: 32,
                    right: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                Expanded(
                  child: Image.asset(
                    'asset/illustrations/${course.illustration}',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 42),
          child: Container(
            child: Image.asset('asset/logos/${course.logo}'),
            width: 60,
            height: 60,
            padding: EdgeInsets.all(12),
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
        ),
      ],
    );
  }
}
