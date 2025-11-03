import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  final List<Map<String, dynamic>> skills = [
    {'icon': Icons.code, 'title': 'Flutter Framework', 'color': Colors.blue},
    {
      'icon': Icons.api,
      'title': 'RESTful API Integration',
      'color': Colors.green,
    },
    {'icon': Icons.storage, 'title': 'Firebase', 'color': Colors.orange},
    {
      'icon': Icons.gite,
      'title': 'Git Version Control',
      'color': Colors.purple,
    },
    {
      'icon': Icons.design_services,
      'title': 'MVVM / MVC',
      'color': Colors.teal,
    },
    {'icon': Icons.animation, 'title': 'UI/UX Animation', 'color': Colors.pink},
    {
      'icon': Icons.dark_mode,
      'title': 'Light/Dark Theme',
      'color': Colors.indigo,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills',
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: skills.map((skill) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: skill['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: skill['color']),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(skill['icon'], color: skill['color'], size: 20),
                  const SizedBox(width: 8),
                  Text(
                    skill['title'],
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
