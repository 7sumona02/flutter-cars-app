import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Cars App',
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
        title: Text('Car Brands'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CarBrandCard(
            brandName: 'Tata Motors',
            color: Colors.deepOrange,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TataPage()),
              );
            },
          ),
          SizedBox(height: 16.0),
          CarBrandCard(
            brandName: 'Mahindra',
            color: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MahindraPage()),
              );
            },
          ),
          SizedBox(height: 16.0),
          CarBrandCard(
            brandName: 'Maruti Suzuki',
            color: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MarutiPage()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(Icons.favorite),
          ),
        ],
        onTap: (index) {},
      ),
    );
  }
}

class CarBrandCard extends StatelessWidget {
  final String brandName;
  final Color color;
  final VoidCallback onTap;

  const CarBrandCard({
    required this.brandName,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            brandName,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class TataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tata Motors'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CarModelCard(
            modelName: 'Tata Nexon',
            price: '₹7.80 - 14.35 Lakh',
            specs: 'Petrol/Diesel, 5 Seater SUV',
            imageUrl: '/images/t1.jpg',
          ),
          CarModelCard(
            modelName: 'Tata Harrier',
            price: '₹15.49 - 26.44 Lakh',
            specs: 'Diesel, 5 Seater SUV',
            imageUrl: '/images/t2.jpg',
          ),
          CarModelCard(
            modelName: 'Tata Safari',
            price: '₹16.19 - 27.34 Lakh',
            specs: 'Diesel, 7 Seater SUV',
            imageUrl: '/images/t3.jpg',
          ),
        ],
      ),
    );
  }
}

class MahindraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mahindra'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CarModelCard(
            modelName: 'Mahindra Thar',
            price: '₹13.59 - 16.29 Lakh',
            specs: 'Petrol/Diesel, 4 Seater SUV',
            imageUrl: '/images/m1.jpg',
          ),
          CarModelCard(
            modelName: 'Mahindra XUV700',
            price: '₹13.45 - 24.95 Lakh',
            specs: 'Petrol/Diesel, 7 Seater SUV',
            imageUrl: '/images/m2.jpg',
          ),
          CarModelCard(
            modelName: 'Mahindra Scorpio-N',
            price: '₹13.26 - 24.54 Lakh',
            specs: 'Petrol/Diesel, 7 Seater SUV',
            imageUrl: '/images/m3.jpg',
          ),
        ],
      ),
    );
  }
}

class MarutiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maruti Suzuki'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CarModelCard(
            modelName: 'Maruti Swift',
            price: '₹5.99 - 9.03 Lakh',
            specs: 'Petrol, 5 Seater Hatchback',
            imageUrl: '/images/h1.jpg',
          ),
          CarModelCard(
            modelName: 'Maruti Baleno',
            price: '₹6.61 - 9.88 Lakh',
            specs: 'Petrol, 5 Seater Premium Hatchback',
            imageUrl: '/images/h2.jpg',
          ),
          CarModelCard(
            modelName: 'Maruti Brezza',
            price: '₹8.29 - 14.14 Lakh',
            specs: 'Petrol, 5 Seater Compact SUV',
            imageUrl: '/images/h3.jpg',
          ),
        ],
      ),
    );
  }
}

class CarModelCard extends StatelessWidget {
  final String modelName;
  final String price;
  final String specs;
  final String imageUrl;

  const CarModelCard({
    required this.modelName,
    required this.price,
    required this.specs,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/${imageUrl.substring(8)}',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Icon(Icons.error),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              modelName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              price,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              specs,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}