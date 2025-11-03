import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<PortfolioProject> projects = [
    PortfolioProject(
      title: 'Geofence Alert App',
      description:
          'Set radius alerts with real-time tracking & push notifications.',
      tech: ['Flutter', 'Google Maps', 'Geolocator'],
    ),
    PortfolioProject(
      title: 'Video Call App',
      description: 'Real-time video calling using ZegoCloud SDK.',
      tech: ['Flutter', 'ZegoCloud', 'WebRTC'],
    ),
    PortfolioProject(
      title: 'Notes App with Voice Typing',
      description: 'Rich text notes with speech-to-text input.',
      tech: ['Flutter', 'Speech-to-Text', 'Hive'],
    ),
    PortfolioProject(
      title: 'Weather App',
      description: 'Live weather using OpenWeatherMap API.',
      tech: ['Flutter', 'REST API', 'Provider'],
    ),
    PortfolioProject(
      title: 'QR Tool',
      description: 'Generate & scan QR codes instantly.',
      tech: ['Flutter', 'qr_flutter', 'mobile_scanner'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Projects',
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...projects.map((project) => _buildProjectCard(context, project)),
      ],
    );
  }

  Widget _buildProjectCard(BuildContext context, PortfolioProject project) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => launchUrl(Uri.parse('https://github.com/surajgujarathi')),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(project.description, style: GoogleFonts.poppins()),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: project.tech
                    .map(
                      (t) => Chip(
                        label: Text(
                          t,
                          style: GoogleFonts.poppins(fontSize: 11),
                        ),
                        backgroundColor: Colors.cyan.withOpacity(0.2),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
