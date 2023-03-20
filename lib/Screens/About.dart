import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
//
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: AboutScreen(),
//   ));
// }

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  final String about =
      "This event is organized by Natraj club. Students can participate and the top 3 students will receive a certificate and trophy. Best of luck!!";
  final String date = "Date: 08-02-23";
  final String time = "Time: 02 PM - 04 PM";
  final String venue = "Venue: EC Conference Hall";
  final String price = "Free";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Event Details",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/glalogo.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              "DANCE COMPETITION",
              style: GoogleFonts.dancingScript(
                color: Colors.deepPurple.shade700,
                fontSize: 32,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            "About",
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
              fontSize: 25,
              color: Colors.deepPurple.shade700,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildDetailsItem(Icons.calendar_today, date),
          const SizedBox(height: 8),
          _buildDetailsItem(Icons.watch_later, time),
          const SizedBox(height: 8),
          _buildDetailsItem(Icons.location_on, venue),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text('\u{20B9}${'   $price'}',style: TextStyle(
              fontSize: 20,
              color: Colors.deepPurple.shade900,
              fontFamily: "Roboto",
            ),),
          ),
          const SizedBox(height: 8),
          Text(
            about,
            style: TextStyle(
              fontSize: 20,
              color: Colors.deepPurple.shade900,
              fontFamily: "Roboto",
            ),
          ),
          const SizedBox(height: 100),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // Add your code here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Book Now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: Colors.deepPurple.shade700,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.deepPurple.shade700,
            fontFamily: "Roboto",
          ),
        ),
      ],
    );
  }
}
