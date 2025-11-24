import 'package:flutter/material.dart';
import '../models/trip_model.dart';

class SummaryPage extends StatelessWidget {
  final Trip trip;

  const SummaryPage({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Summary'),
        backgroundColor: Colors.orange[700],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Your Trip Summary',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),

              const SizedBox(height: 30.0),

              
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Text('Destination: ${trip.city}, ${trip.country}', style: const TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 10.0),
                    Text('Travelers: ${trip.travelers}', style: const TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 10.0),
                    Text('Travel Date: ${trip.travelDate}', style: const TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 10.0),
                    Text('Hotel: ${trip.includeHotel ? "Yes" : "No"}', style: const TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 10.0),
                    Text('Transport: ${trip.includeTransport ? "Yes" : "No"}', style: const TextStyle(fontSize: 18.0)),
                  ],
                ),
              ),

              const SizedBox(height: 30.0),

              
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  'Total Price: \$${trip.getTotalPrice()}',
                  style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),

              const SizedBox(height: 40.0),

              
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text('Plan Another Trip'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
