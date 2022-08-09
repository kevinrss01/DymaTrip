// ignore_for_file: avoid_unnecessary_containers

import './widgets/trip_activity_list.dart';
import './widgets/trip_overview.dart';
import './widgets/activity_list.dart';

import 'package:flutter/material.dart';

import '../../datas/data.dart' as data;
import '../../models/activity.model.dart';

import '../../models/trip.model.dart';

class City extends StatefulWidget {
  City({Key? key}) : super(key: key);
  final List<Activity> activities = data.activities;

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  late Trip mytrip;
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
    mytrip = Trip(
      activities: [],
      city: 'Paris',
      date: null,
    );
  }

  List<Activity> get TripActivities {
    return widget.activities.where((activity) {
      return mytrip.activities.contains(activity.id);
    }).toList();
  }

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2023),
    ).then((newDate) => {
          if (newDate != null)
            {
              setState(() {
                mytrip.date = newDate;
              })
            }
        });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(String id) {
    setState(
      () {
        mytrip.activities.contains(id)
            ? mytrip.activities.remove(id)
            : mytrip.activities.add(id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        title: const Text('Organisation de mon voyage'),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            TripOverview(trip: mytrip, setDate: setDate),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: widget.activities,
                      selectedActivities: mytrip.activities,
                      toggleActivity: toggleActivity,
                    )
                  : const TripActivityList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: ('Découverte'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: ('Mes activités'),
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
