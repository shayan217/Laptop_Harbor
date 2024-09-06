import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulating a delay of 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      // Navigate to the next page after 5 seconds
    });

    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie animation widget
            Lottie.asset(
              'assets/json/loading.json', // Replace with your Lottie animation asset
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            // Loading text
            Text(
              'Loading...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}