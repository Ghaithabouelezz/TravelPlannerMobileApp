class Trip {
  String country;
  String city;
  int travelers;
  String travelDate;
  bool includeHotel;
  bool includeTransport;
  double budget;

  Trip({
    this.country = 'Lebanon',
    this.city = 'Beirut',
    this.travelers = 1,
    this.travelDate = '01/01/2024',
    this.includeHotel = true,
    this.includeTransport = true,
    this.budget = 1000.0,
  });

  String getTotalPrice() {
    double price = 0;
    price += travelers * 200;
    if (includeHotel) {
      price += travelers * 150;
    }
    if (includeTransport) {
      price += travelers * 50;
    }
    return price.toStringAsFixed(0);
  }

  // Real city-specific images from Unsplash
  String getCityImageUrl() {
    final cityImages = {
      // Lebanon cities
      'Beirut': 'https://picsum.photos/800/600?random=1',
      'Tripoli': 'https://picsum.photos/800/600?random=2',
      'Byblos': 'https://picsum.photos/800/600?random=3',

      // France cities
      'Paris': 'https://picsum.photos/800/600?random=4',
      'Lyon': 'https://picsum.photos/800/600?random=5',
      'Marseille': 'https://picsum.photos/800/600?random=6',

      // Italy cities
      'Rome': 'https://picsum.photos/800/600?random=7',
      'Milan': 'https://picsum.photos/800/600?random=8',
      'Venice': 'https://picsum.photos/800/600?random=9',

      // Spain cities
      'Madrid': 'https://picsum.photos/800/600?random=10',
      'Barcelona': 'https://picsum.photos/800/600?random=11',
      'Seville': 'https://picsum.photos/800/600?random=12',
    };
    return cityImages[city] ?? 'https://picsum.photos/800/600?random=13';
  }
}