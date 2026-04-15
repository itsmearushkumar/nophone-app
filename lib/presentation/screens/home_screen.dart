import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../logic/providers/app_provider.dart';
import 'alert_screen.dart';
import 'analytics_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NoPhone",
          style: GoogleFonts.orbitron(),
        ),
        centerTitle: true,
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF0F2027)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // 🔥 GLOW ICON
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.7),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  provider.isUsingPhone
                      ? Icons.warning
                      : Icons.check_circle,
                  size: 90,
                  color: provider.isUsingPhone
                      ? Colors.redAccent
                      : Colors.greenAccent,
                ),
              ),

              SizedBox(height: 30),

              Text(
                provider.isUsingPhone
                    ? "PHONE DETECTED"
                    : "FOCUSED MODE",
                style: GoogleFonts.orbitron(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 40),

              // 🔥 NEON BUTTON
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  shadowColor: Colors.purpleAccent,
                  elevation: 20,
                ),
                onPressed: () {
                  provider.simulateDetection();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AlertScreen()),
                  );
                },
                child: Text(
                  "START MONITORING",
                  style: GoogleFonts.orbitron(),
                ),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[900],
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnalyticsScreen(),
                    ),
                  );
                },
                child: Text(
                  "VIEW ANALYTICS",
                  style: GoogleFonts.orbitron(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}