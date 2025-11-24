import 'package:flutter/material.dart';
import 'summary_page.dart';
import '../models/trip_model.dart';

class ServicesPage extends StatefulWidget {
  final Trip trip;

  const ServicesPage({super.key, required this.trip});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  late Trip _trip;

  @override
  void initState() {
    super.initState();
    _trip = widget.trip;
  }

  void updateHotel(bool value) {
    setState(() {
      _trip.includeHotel = value;
    });
  }

  void updateTransport(bool value) {
    setState(() {
      _trip.includeTransport = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
        backgroundColor: Colors.purple[700],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.pink],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Select Services',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),

              const SizedBox(height: 30.0),

              
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Hotel Accommodation', style: TextStyle(fontSize: 18.0)),
                        Checkbox(
                          value: _trip.includeHotel,
                          onChanged: (bool? value) {
                            updateHotel(value!);
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20.0),

                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Airport Transport', style: TextStyle(fontSize: 18.0)),
                        Checkbox(
                          value: _trip.includeTransport,
                          onChanged: (bool? value) {
                            updateTransport(value!);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40.0),

              
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  'Estimated Cost: \$${_trip.getTotalPrice()}',
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),

              const SizedBox(height: 40.0),

              
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SummaryPage(trip: _trip),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text('View Summary'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
