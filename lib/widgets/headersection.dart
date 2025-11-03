import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Colors.cyan, Colors.indigo],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage('suraj.jpeg'), // Add your photo
              radius: 68,
            ),
          ),
          const SizedBox(height: 20),
          DefaultTextStyle(
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  speed: Duration(milliseconds: 100),
                  'SURAJ GUJARATHI',
                  textStyle: TextStyle(color: Colors.red),
                ),
              ],
              isRepeatingAnimation: false,
            ),
          ),
          Text(
            'Hyderabad | 9848274196 | surajsuri1989@gmail.com',
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Flutter Developer',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.cyan,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(16),
              // backdropFilter: const BlurFilter(10),
            ),
            child: Text(
              'To find a challenging role that utilizes my 2.6 years expertise of Flutter development and allows me to grow professionally in the field of mobile application development.',
              style: GoogleFonts.poppins(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
