// lib/widgets/experience_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------- Section title ----------
        Text(
          'Work Experience',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.titleLarge?.color,
          ),
        ),
        const SizedBox(height: 16),

        // ---------- List of flip-cards ----------
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2, // two jobs
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, i) => i == 0
              ? const FlippableExperienceCard(
                  company: 'Sunbright Multimedia Services LLP (Eenadu Group)',
                  role: 'Jr. Software Developer (Flutter)',
                  duration: 'May 2023 – Present',
                  location: 'Hyderabad',
                  projects: [
                    'Eenadu Pellipandiri – Telugu Matrimony App',
                    'Reta Ads & Classifieds – Ad Booking App',
                    'Eenadu Sales Rep – Firebase Survey App',
                  ],
                  description:
                      'Worked on full-cycle Flutter app development — from UI design to API integration, localization, and deployment.',
                )
              : const FlippableExperienceCard(
                  company: 'Prithvi Realcon Transportation & Pvt Ltd',
                  role: 'Freelance Flutter Developer',
                  duration: '2023 – Present',
                  location: 'Chhattisgarh',
                  projects: ['4PRTPL – Real-time Truck Surveillance App'],
                  description:
                      'Developed a live truck tracking system with map integration and background location updates.',
                ),
        ),

        // ---------- Final breathing space ----------
        const SizedBox(height: 20),
      ],
    );
  }
}

// -----------------------------------------------------------------
//  Flip-card widget – **theme-aware**
// -----------------------------------------------------------------
class FlippableExperienceCard extends StatefulWidget {
  final String company;
  final String role;
  final String duration;
  final String location;
  final List<String> projects;
  final String description;

  const FlippableExperienceCard({
    super.key,
    required this.company,
    required this.role,
    required this.duration,
    required this.location,
    required this.projects,
    required this.description,
  });

  @override
  State<FlippableExperienceCard> createState() =>
      _FlippableExperienceCardState();
}

class _FlippableExperienceCardState extends State<FlippableExperienceCard>
    with SingleTickerProviderStateMixin {
  bool _showFront = true;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    setState(() => _showFront = !_showFront);
    _showFront ? _controller.reverse() : _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final angle = _controller.value * 3.1416;
          final isFront = _controller.value < 0.5;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(angle),
            child: isFront
                ? _buildFrontCard(context, theme)
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(3.1416),
                    child: _buildBackCard(context, theme),
                  ),
          );
        },
      ),
    );
  }

  // ---------- FRONT ----------
  Widget _buildFrontCard(BuildContext context, ThemeData theme) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide.none,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [theme.cardColor, theme.cardColor.withOpacity(0.9)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.company,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.titleLarge?.color,
              ),
            ),
            Text(
              widget.role,
              style: GoogleFonts.poppins(color: theme.primaryColor),
            ),
            Text(
              '${widget.duration} • ${widget.location}',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
            const SizedBox(height: 12),
            ...widget.projects.map(
              (p) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text('• $p', style: GoogleFonts.poppins()),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "Tap to flip",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: theme.textTheme.bodySmall?.color,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- BACK ----------
  Widget _buildBackCard(BuildContext context, ThemeData theme) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide.none,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: theme.primaryColor.withOpacity(0.08),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Role",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.titleLarge?.color,
              ),
            ),
            const SizedBox(height: 10),
            Text(widget.description, style: GoogleFonts.poppins(fontSize: 14)),
            const SizedBox(height: 16),
            Center(
              child: Text(
                "Tap to flip back",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: theme.textTheme.bodySmall?.color,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
