import 'package:flutter/material.dart';
import 'package:hume/model/course.dart';
import 'package:hume/components/cards/explore_course_card.dart';

class ExploreCourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: exploreCourses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
            child: ExploreCourseCard(
              course: exploreCourses[index],
            ),
          );
        },
      ),
    );
  }
}
