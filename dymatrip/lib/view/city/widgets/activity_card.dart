import 'dart:ui';

import 'package:dymatrip/models/activity.model.dart';
import 'package:flutter/material.dart';
import '../../../models/activity.model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool isSelected;
  final VoidCallback toggleActivity;

  const ActivityCard({
    required this.activity,
    required this.isSelected,
    required this.toggleActivity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200.00,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Ink.image(
              image: AssetImage(activity.image),
              fit: BoxFit.cover,
              child: InkWell(
                onTap: toggleActivity,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (isSelected)
                          const Icon(
                            Icons.check,
                            size: 40,
                            color: Colors.white,
                          ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: FittedBox(
                          child: Text(
                            activity.name,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
