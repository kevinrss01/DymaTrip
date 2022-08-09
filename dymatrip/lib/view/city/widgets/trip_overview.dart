import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../../models/trip.model.dart';

class TripOverview extends StatelessWidget {
  // const TripOverview({Key? key}) : super(key: key);

  final VoidCallback setDate;
  final Trip trip;

  double get amount {
    return 0;
  }

  TripOverview({required this.setDate, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Paris',
            style:
                TextStyle(fontSize: 25, decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  trip.date != null
                      ? DateFormat('d/M/y').format(trip.date!)
                      : ('Choississez une date'),
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              ElevatedButton(
                onPressed: setDate,
                child: const Text('Selectionner une date'),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Montant / personne',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                '$amount €',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 70,
              )
            ],
          ),
        ],
      ),
    );
  }
}
