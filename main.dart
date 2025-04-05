import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Motorcycle Brands',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motorcycle Brands'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          BikeBrandCard(
            brandName: 'Suzuki',
            color: Colors.blue,
            onTap: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => BrandPage('Suzuki', Colors.blue))),
          ),
          SizedBox(height: 16.0),
          BikeBrandCard(
            brandName: 'Scrambler',
            color: Colors.orange,
            onTap: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => BrandPage('Scrambler', Colors.orange))),
          ),
          SizedBox(height: 16.0),
          BikeBrandCard(
            brandName: 'Super Soco',
            color: Colors.green,
            onTap: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => BrandPage('Super Soco', Colors.green))),
          ),
          SizedBox(height: 16.0),
          BikeBrandCard(
            brandName: 'Segway',
            color: Colors.red,
            onTap: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => BrandPage('Segway', Colors.red))),
          ),
          SizedBox(height: 16.0),
          BikeBrandCard(
            brandName: 'Sondors',
            color: Colors.purple,
            onTap: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => BrandPage('Sondors', Colors.purple))),
          ),
          SizedBox(height: 16.0),
          BikeBrandCard(
            brandName: 'Stark',
            color: Colors.teal,
            onTap: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => BrandPage('Stark', Colors.teal))),
          ),
          SizedBox(height: 16.0),
          BikeBrandCard(
            brandName: 'Sur-Ron',
            color: Colors.indigo,
            onTap: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => BrandPage('Sur-Ron', Colors.indigo))),
          ),
          SizedBox(height: 16.0),
          BikeBrandCard(
            brandName: 'Silence',
            color: Colors.brown,
            onTap: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => BrandPage('Silence', Colors.brown))),
          ),
          SizedBox(height: 16.0),
          BikeBrandCard(
            brandName: 'Super73',
            color: Colors.deepOrange,
            onTap: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => BrandPage('Super73', Colors.deepOrange))),
          ),
          SizedBox(height: 16.0),
          BikeBrandCard(
            brandName: 'Soriano',
            color: Colors.cyan,
            onTap: () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => BrandPage('Soriano', Colors.cyan))),
          ),
        ],
      ),
    );
  }
}

class BikeBrandCard extends StatelessWidget {
  final String brandName;
  final Color color;
  final VoidCallback onTap;

  const BikeBrandCard({
    Key? key,
    required this.brandName,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: color.withAlpha((0.2 * 255).toInt()),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            brandName,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class BikeModelCard extends StatelessWidget {
  final String modelName;
  final String price;
  final String specs;
  final List<String> features;
  final List<String> imageUrls;

  const BikeModelCard({
    Key? key,
    required this.modelName,
    required this.price,
    required this.specs,
    required this.features,
    required this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(modelName, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('Price: $price', style: TextStyle(fontSize: 18.0, color: Colors.green)),
            SizedBox(height: 8.0),
            Text('Specifications:', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            Text(specs, style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 8.0),
            Text('Key Features:', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features.map<Widget>((feature) => Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text('• $feature', style: TextStyle(fontSize: 16.0)),
              )).toList(),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: imageUrls.map<Widget>((url) => Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network('https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg', fit: BoxFit.cover),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class BrandPage extends StatelessWidget {
  final String brandName;
  final Color color;

  BrandPage(this.brandName, this.color);

  Map<String, List<Map<String, dynamic>>> getBikeData() {
    return {
      'Suzuki': [
        {
          'modelName': 'Hayabusa',
          'price': '\$18,799',
          'specs': '1340cc, 188 HP, 264 kg',
          'features': ['Bi-directional Quick Shifter', 'Launch Control', 'Cruise Control'],
          'images': ['/images/suzuki1.jpg', '/images/suzuki2.jpg'],
        },
      ],
      'Scrambler': [
        {
          'modelName': 'Desert Sled',
          'price': '\$12,195',
          'specs': '803cc, 73 HP, 209 kg',
          'features': ['Off-road Capability', 'Spoked Wheels', 'High Mounted Exhaust'],
          'images': ['/images/scrambler1.jpg', '/images/scrambler2.jpg'],
        },
      ],
      'Super Soco': [
        {
          'modelName': 'TC Max',
          'price': '\$4,999',
          'specs': '5000W Motor, 100 km Range',
          'features': ['Removable Battery', 'LED Lighting', 'Smart App Integration'],
          'images': ['/images/supersoco1.jpg', '/images/supersoco2.jpg'],
        },
      ],
      'Segway': [
        {
          'modelName': 'Apex H2',
          'price': '\$8,999',
          'specs': '8000W Motor, Hydrogen-Electric Hybrid',
          'features': ['Innovative Powertrain', 'Futuristic Design', 'Advanced Electronics'],
          'images': ['/images/segway1.jpg', '/images/segway2.jpg'],
        },
      ],
      'Sondors': [
        {
          'modelName': 'Metacycle',
          'price': '\$5,000',
          'specs': '4000W Motor, 130 km Range',
          'features': ['Lightweight Design', 'Removable Battery', 'Digital Display'],
          'images': ['/images/sondors1.jpg', '/images/sondors2.jpg'],
        },
      ],
      'Stark': [
        {
          'modelName': 'VARG',
          'price': '\$11,900',
          'specs': '80 HP, 110 kg',
          'features': ['Electric Motocross', 'Carbon Fiber Frame', 'Adjustable Power Modes'],
          'images': ['/images/stark1.jpg', '/images/stark2.jpg'],
        },
      ],
      'Sur-Ron': [
        {
          'modelName': 'Light Bee X',
          'price': '\$4,500',
          'specs': '6000W Motor, 100 km Range',
          'features': ['Dual Sport Capability', 'Lightweight Frame', 'High Torque'],
          'images': ['/images/sur-ron1.jpg', '/images/sur-ron2.jpg'],
        },
      ],
      'Silence': [
        {
          'modelName': 'S01',
          'price': '\$7,200',
          'specs': '7000W Motor, 115 km Range',
          'features': ['Removable Battery', 'Reverse Gear', 'Connected App'],
          'images': ['/images/silence1.jpg', '/images/silence2.jpg'],
        },
      ],
      'Super73': [
        {
          'modelName': 'RX',
          'price': '\$3,495',
          'specs': '2000W Motor, 120 km Range',
          'features': ['Multi-Class Modes', 'Full Suspension', 'Mobile App Integration'],
          'images': ['/images/super73-1.jpg', '/images/super73-2.jpg'],
        },
      ],
      'Soriano': [
        {
          'modelName': 'Giaguaro V1R',
          'price': '\$32,500',
          'specs': '80 kW Motor, 180 km Range',
          'features': ['Italian Design', 'Carbon Fiber Body', 'Advanced Electronics'],
          'images': ['/images/soriano1.jpg', '/images/soriano2.jpg'],
        },
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    final bikeData = getBikeData()[brandName] ?? [];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(brandName),
        backgroundColor: color,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: bikeData.length,
        itemBuilder: (BuildContext context, int index) {
          final bike = bikeData[index];
          return BikeModelCard(
            modelName: bike['modelName']!,
            price: bike['price']!,
            specs: bike['specs']!,
            features: List<String>.from(bike['features']!),
            imageUrls: List<String>.from(bike['images']!),
          );
        },
      ),
    );
  }
}