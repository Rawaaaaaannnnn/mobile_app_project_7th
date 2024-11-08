import 'package:flutter/material.dart';
import 'lipstick_screen.dart';
import 'mascara_screen.dart';
import 'lip_liner_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pinkAccent, // Pink background
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Choose Your Beauty Product',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LipstickScreen()),
                        );
                      },
                      child: Text('View Lipstick Products'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.pink, backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 15),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MascaraScreen()),
                        );
                      },
                      child: Text('View Mascara Products'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.pink, backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 15),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LipLinerScreen()),
                        );
                      },
                      child: Text('View Lip Liner Products'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.pink, backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Top-left sticker
            Positioned(
              top: 20,
              left: 20,
              child: Image.asset(
                'assets/makeup.png',
                width: 200,
                height: 200,
              ),
            ),

            // Top-right sticker
            Positioned(
              top: 20,
              right: 20,
              child: Image.asset(
                'assets/lipstick1.png',
                width: 225,
                height: 225,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Image.asset(
                'assets/mascara.png',
                width: 250,
                height: 250,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 100,
              child: Image.asset(
                'assets/lipstick.png',
                width: 200,
                height: 200,
              ),
            ),

            // Bottom sticker
            Positioned(
              bottom: 20,
              right: MediaQuery.of(context).size.width * 0.3, // Centered in bottom area
              child: Image.asset(
                'assets/foundation.png',
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
