import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Online Presence',
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialButton(
              Icons.code,
              'GitHub',
              'https://github.com/surajgujarathi',
            ),
            const SizedBox(width: 20),
            _socialButton(
              Icons.link,
              'LinkedIn',
              'https://www.linkedin.com/in/gujarathi-suraj-932944178',
            ),
          ],
        ),
      ],
    );
  }

  Widget _socialButton(IconData icon, String label, String url) {
    return ElevatedButton.icon(
      onPressed: () => launchUrl(Uri.parse(url)),
      icon: Icon(icon),
      label: Text(label, style: GoogleFonts.poppins()),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
