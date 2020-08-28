import 'package:flutter/material.dart';
import 'package:hume/constants.dart';
import 'package:hume/components/sidebar_row.dart';
import 'package:hume/model/sidebar.dart';

class SidebarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.085,
            ),
            ...sidebarItems.map(
              (item) => Column(
                children: [
                  SidebarRow(item: item),
                  SizedBox(height: 32),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Image.asset('asset/icons/icon-logout.png', width: 17),
                SizedBox(width: 12),
                Text("Log out", style: kSecondaryCalloutLabelStyle)
              ],
            )
          ],
        ),
      ),
    );
  }
}
