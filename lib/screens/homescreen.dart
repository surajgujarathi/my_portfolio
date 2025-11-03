import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:myportfolio/widgets/education.dart';
import 'package:myportfolio/widgets/experiencesection.dart';
import 'package:myportfolio/widgets/headersection.dart';
import 'package:myportfolio/widgets/projectsection.dart';
import 'package:myportfolio/widgets/skillssections.dart';
import 'package:myportfolio/widgets/socialsection.dart';
import 'package:myportfolio/widgets/themetoggle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [ThemeToggle()],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: theme.brightness == Brightness.dark
                ? [const Color(0xFF0A0E21), const Color(0xFF1A1F38)]
                : [Colors.indigo.shade50, Colors.cyan.shade50],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 80, 16, 40),
          child: AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 800),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 50,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  const HeaderSection(),
                  const SizedBox(height: 40),
                  SkillsSection(),
                  const SizedBox(height: 40),
                  const ExperienceSection(),
                  const SizedBox(height: 40),
                  ProjectsSection(),
                  const SizedBox(height: 40),
                  const EducationSection(),
                  const SizedBox(height: 40),
                  const SocialSection(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
