import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Analytics",
          style: GoogleFonts.orbitron(),
        ),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF1a1a2e)],
          ),
        ),

        child: Column(
          children: [
            Text(
              "USAGE ANALYTICS",
              style: GoogleFonts.orbitron(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.cyanAccent,
              ),
            ),

            SizedBox(height: 30),

            buildBar("Monday", 3, Colors.blueAccent),
            buildBar("Tuesday", 5, Colors.redAccent),
            buildBar("Wednesday", 2, Colors.greenAccent),
          ],
        ),
      ),
    );
  }

  Widget buildBar(String day, int hours, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              day,
              style: GoogleFonts.orbitron(color: Colors.white),
            ),
          ),

          Expanded(
            child: Container(
              height: 18,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.7),
                    blurRadius: 15,
                  ),
                ],
              ),
              width: hours * 40.0,
            ),
          ),

          SizedBox(width: 10),

          Text(
            "${hours}h",
            style: GoogleFonts.orbitron(color: Colors.white),
          ),
        ],
      ),
    );
  }
}