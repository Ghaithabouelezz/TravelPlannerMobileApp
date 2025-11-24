import 'package:flutter/material.dart';
import 'services_page.dart';
import '../models/trip_model.dart';

class DestinationPage extends StatefulWidget {
  final Trip trip;

  const DestinationPage({super.key, required this.trip});

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  late Trip _trip;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _travelersController = TextEditingController();

  final List<String> countries = ['Lebanon', 'France', 'Italy', 'Spain'];
  String selectedCountry = 'Lebanon';

  final Map<String, List<String>> cities = {
    'Lebanon': ['Beirut', 'Tripoli', 'Byblos'],
    'France': ['Paris', 'Lyon', 'Marseille'],
    'Italy': ['Rome', 'Milan', 'Venice'],
    'Spain': ['Madrid', 'Barcelona', 'Seville'],
  };
  String selectedCity = 'Beirut';

  @override
  void initState() {
    super.initState();
    _trip = widget.trip;
    _dateController.text = _trip.travelDate;
    _travelersController.text = _trip.travelers.toString();
    // Initialize with current trip data
    selectedCountry = _trip.country;
    selectedCity = _trip.city;
  }

  void updateCountry(String country) {
    setState(() {
      selectedCountry = country;
      selectedCity = cities[country]!.first;
      _trip.country = country; // Update trip country
      _trip.city = selectedCity; // Update trip city
    });
  }

  void updateCity(String city) {
    setState(() {
      selectedCity = city;
      _trip.city = city; // Update trip city
    });
  }

  void updateTravelers(String travelers) {
    setState(() {
      _trip.travelers = int.tryParse(travelers) ?? 1;
    });
  }

  void updateDate(String date) {
    setState(() {
      _trip.travelDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destination'),
        backgroundColor: Colors.green[700],
      ),
      body: Stack(
        children: [
          // City background image - this will now update when city changes
          Image.network(
            _trip.getCityImageUrl(),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Semi-transparent overlay for readability
          Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Select Your Destination - ${_trip.city}', // Show current city
                  style: const TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),

                // Country Dropdown
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      const Text('Select Country', style: TextStyle(fontSize: 18.0)),
                      SizedBox(
                        width: 300.0,
                        child: DropdownButton(
                          value: selectedCountry,
                          items: countries.map((String country) {
                            return DropdownMenuItem(
                              value: country,
                              child: Text(country),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              updateCountry(newValue);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20.0),

                // City Dropdown
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      const Text('Select City', style: TextStyle(fontSize: 18.0)),
                      SizedBox(
                        width: 300.0,
                        child: DropdownButton(
                          value: selectedCity,
                          items: cities[selectedCountry]!.map((String city) {
                            return DropdownMenuItem(
                              value: city,
                              child: Text(city),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              updateCity(newValue);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20.0),

                // Travelers input
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      const Text('Number of Travelers', style: TextStyle(fontSize: 18.0)),
                      SizedBox(
                        width: 300.0,
                        child: TextField(
                          controller: _travelersController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter number',
                          ),
                          onChanged: updateTravelers,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20.0),

                // Date input
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      const Text('Travel Date (DD/MM/YYYY)', style: TextStyle(fontSize: 18.0)),
                      SizedBox(
                        width: 300.0,
                        child: TextField(
                          controller: _dateController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter date',
                          ),
                          onChanged: updateDate,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40.0),

                // Next Button
                ElevatedButton(
                  onPressed: () {
                    _trip.country = selectedCountry;
                    _trip.city = selectedCity;

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ServicesPage(trip: _trip),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}