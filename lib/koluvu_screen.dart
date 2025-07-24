import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhyChooseKoluvuScreen extends StatelessWidget {
  final Color backgroundColor = const Color(0xFF031B4E); // Deep blue

  final TextStyle descriptionStyle = GoogleFonts.poppins(
    fontSize: 13,
    color: Colors.white70,
  );

  final List<_Feature> _features = [
    _Feature(
      icon: Icons.verified_user,
      title: "Authentic Profiles with Real Connections",
      description:
          "Koluvu verifies all candidate and employer profiles, ensuring authenticity and trust in connections.",
    ),
    _Feature(
      icon: Icons.person_search,
      title: "Seamless and User-Centric Experience",
      description:
          "Navigation is easy with our intuitive interface. From the moment you land on our site, you’ll find it user-friendly!",
    ),
    _Feature(
      icon: Icons.schedule,
      title: "Quicker Hiring within 24-Hour Turnaround",
      description:
          "Streamlined processes ensure fast and efficient hiring within 24 hours.",
    ),
    _Feature(
      icon: Icons.smart_toy,
      title: "Smarter Hiring & Job Search Using AI-Powered Tools",
      description:
          "AI-driven tools like resume builders and predictive analytics enhance hiring and job searching.",
    ),
    _Feature(
      icon: Icons.notifications_active,
      title: "Real-Time Alerts And Instant Updates",
      description:
          "Get real-time job alerts and stay ahead with up-to-date vacancy notifications.",
    ),
    _Feature(
      icon: Icons.filter_alt,
      title: "Advanced Candidate Filtering And ATS",
      description:
          "Use our ATS to manage applications and filter top candidates efficiently.",
    ),
  ];

  WhyChooseKoluvuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                'Why Choose Koluvu?',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Discover the cutting-edge features that make our platform the ultimate destination for career advancement and talent acquisition.',
                style: descriptionStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              /// Responsive Grid
              GridView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // So it scrolls with main page
                shrinkWrap: true,
                itemCount: _features.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.95, // Adjust card height
                ),
                itemBuilder: (context, index) {
                  final item = _features[index];
                  return _FeatureCard(
                    icon: item.icon,
                    title: item.title,
                    description: item.description,
                    width: double.infinity,
                  );
                },
              ),

              const SizedBox(height: 30),

              /// Bottom Gradient Card (Unchanged)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 247, 69, 238),
                      Color.fromARGB(255, 250, 250, 122),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Ready to Experience the Future",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Join countless others who have transformed their careers with our innovative platform.",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 70,
                          vertical: 12,
                        ),
                        backgroundColor: const Color.fromARGB(255, 83, 51, 244),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Get Started"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Feature Data Model
class _Feature {
  final IconData icon;
  final String title;
  final String description;

  const _Feature({
    required this.icon,
    required this.title,
    required this.description,
  });
}

/// Feature Card Widget
class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double width;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [
        Color.fromARGB(255, 246, 209, 100),
        Color.fromARGB(255, 244, 97, 146),
      ],
    );

    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF08205C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.pinkAccent),
          const SizedBox(height: 12),
          ShaderMask(
            shaderCallback: (bounds) => gradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white, // overridden by shader
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
