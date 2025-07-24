import 'package:flutter/material.dart';

// Note: The main.dart and why_choose_koluvu_screen.dart files do not need to be changed.

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  // State variables for filters
  String _selectedCompanyType = 'All';
  String _selectedIndustry = 'All';
  String _selectedDepartment = 'All';
  String? _selectedLocation;
  String _selectedRating = 'All';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // NEW: State for Bottom Navigation Bar
  int _selectedIndex = 2; // Start on the 'Companies' tab (index 2)

  // This would eventually hold the different screen widgets
  // For now, we only have the companies content
  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        // Return your Home Screen Widget here
        return const Center(
          child: Text('Home Screen', style: TextStyle(color: Colors.black)),
        );
      case 1:
        // Return your Jobs Screen Widget here
        return const Center(
          child: Text('Jobs Screen', style: TextStyle(color: Colors.black)),
        );
      case 2:
        // This is the main content for the Companies screen
        return _buildCompaniesContent();
      default:
        return _buildCompaniesContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      drawer: const AppDrawer(), // Minor tabs remain here
      // The body now changes based on the selected tab
      body: _getBody(),

      // NEW: Bottom Navigation Bar for main tabs
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF031B4E),
        unselectedItemColor: Colors.grey[600],
        type: BottomNavigationBarType.fixed, // Ensures all items are visible
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            activeIcon: Icon(Icons.work),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_outlined),
            activeIcon: Icon(Icons.business),
            label: 'Companies',
          ),
        ],
      ),
    );
  }

  // I've moved the original body content into its own method for clarity
  Widget _buildCompaniesContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF031B4E),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildCompanyCategories(),
                const SizedBox(height: 40),
              ],
            ),
          ),
          _buildFilterAndResults(),
          _buildPromoCards(),
          _buildFooter(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF031B4E),
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/logo.png'),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.white, size: 30),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ],
      leadingWidth: 70,
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text.rich(
            TextSpan(
              text: 'Discover ',
              style: TextStyle(color: Colors.white, fontSize: 28),
              children: [
                TextSpan(
                  text: 'Top Companies',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Browse through our network of hiring companies and find your perfect career match',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search companies...',
              hintStyle: TextStyle(color: Colors.grey[400]),
              prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
              filled: true,
              fillColor: const Color(0xFF1A3365),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyCategories() {
    final categories = [
      'Technology (IT) & Software',
      'Healthcare',
      'Finance',
      'Marketing',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Company Categories',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryCard(title: categories[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterAndResults() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFilterCard(
            child: _buildFilterGroup(
              title: 'Company Type',
              options: [
                'All',
                'MNC',
                'Foreign MNC',
                'Startup',
                'NGO',
                'Public Sector',
              ],
              groupValue: _selectedCompanyType,
              onChanged: (value) =>
                  setState(() => _selectedCompanyType = value!),
            ),
          ),
          _buildFilterCard(
            child: _buildFilterGroup(
              title: 'Industry',
              options: [
                'All',
                'Information Technology (IT) & Software',
                'Healthcare & Pharmaceuticals',
                'Finance, Banking & Insurance',
              ],
              groupValue: _selectedIndustry,
              onChanged: (value) => setState(() => _selectedIndustry = value!),
            ),
          ),
          _buildFilterCard(
            child: _buildFilterGroup(
              title: 'Department',
              options: [
                'All',
                'Software Development',
                'HR',
                'Finance and Accounts',
                'Marketing',
              ],
              groupValue: _selectedDepartment,
              onChanged: (value) =>
                  setState(() => _selectedDepartment = value!),
            ),
          ),
          _buildFilterCard(
            child: _buildFilterGroup(
              title: 'Location',
              options: [
                'Delhi',
                'Bangalore',
                'Chennai',
                'Pune',
                'Hyderabad',
                'Noida',
              ],
              groupValue: _selectedLocation,
              onChanged: (value) => setState(() => _selectedLocation = value),
            ),
          ),
          _buildFilterCard(child: _buildRatingFilter()),
          const SizedBox(height: 20),
          _buildClearFiltersButton(),
          const SizedBox(height: 24),
          _buildCompaniesHeader(),
          const SizedBox(height: 16),
          const Text(
            '19 companies found',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) => const CompanyResultCard(),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCard({required Widget child}) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.3),
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(padding: const EdgeInsets.all(16.0), child: child),
    );
  }

  Widget _buildFilterGroup({
    required String title,
    required List<String> options,
    required dynamic groupValue,
    required ValueChanged<dynamic> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        ...options.map(
          (option) => RadioListTile<String>(
            title: Text(option, style: const TextStyle(color: Colors.black87)),
            value: option,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: const Color(0xFFE53935),
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingFilter() {
    final ratings = ['All', '4+ ★', '3+ ★', '2+ ★', '1+ ★'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Minimum Rating',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          children: ratings.map((rating) {
            bool isSelected = _selectedRating == rating;
            return ChoiceChip(
              label: Text(rating),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() => _selectedRating = rating);
                }
              },
              selectedColor: const Color(0xFFE53935),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
              backgroundColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? const Color(0xFFE53935)
                      : Colors.grey[300]!,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildClearFiltersButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF9C4),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.amber.shade600),
        ),
        child: Center(
          child: Text(
            'Clear All Filters',
            style: TextStyle(
              color: Colors.amber.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompaniesHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'MNC Companies',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'View All >',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCards() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16.0, 17.0, 16.0, 17.0),
      child: Column(
        children: [
          PromoCard(
            icon: Icons.rocket_launch,
            iconColor: Colors.orange,
            title: 'Hiring Fast?',
            description: 'Get your jobs seen by 1M+ candidates in 24 hours.',
            buttonText: 'Boost Your Post',
            onPressed: () {},
          ),
          const SizedBox(height: 20),
          PromoCard(
            icon: Icons.business_center,
            iconColor: Colors.blue,
            title: 'Join Top Startups!',
            description:
                'Explore 5,000+ startup jobs in tech, marketing, and design.',
            buttonText: 'Browse Jobs',
            onPressed: () {},
          ),
          const SizedBox(height: 20),
          PromoCard(
            icon: Icons.public,
            iconColor: Colors.green,
            title: 'Work Remotely',
            description:
                'Discover remote opportunities from global tech giants.',
            buttonText: 'Find Remote Jobs',
            onPressed: () {},
          ),
          const SizedBox(height: 20),
          PromoCard(
            icon: Icons.attach_money,
            iconColor: Colors.purple,
            title: 'Salary Benchmarking',
            description:
                'Get personalized salary insights and know what you deserve.',
            buttonText: 'Check Salaries',
            onPressed: () {},
          ),
          const SizedBox(height: 20),
          PromoCard(
            icon: Icons.track_changes,
            iconColor: Colors.red,
            title: 'Hire Top Talent',
            description:
                'Post a job and reach vetted professionals actively looking.',
            buttonText: 'Post a Job',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: const Color(0xFF2E7D32),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFooterSection('Company', [
            'About Koluvu',
            'Privacy Policy',
            'Terms & Conditions',
            'Vulnerability Disclosure Policy',
            'FAQs',
          ]),
          _buildFooterSection('Quick Links', [
            'Download App',
            'Free Job Alerts',
            'Career Opportunities',
            'Applicant Tracking System (ATS)',
          ]),
          _buildSocialSection(),
          _buildContactSection(),
          const Divider(color: Colors.white54, height: 40),
          const Center(
            child: Text(
              '© 2025 Koluvu.com | Powered by Bhuvih HR Solutions Pvt. Ltd. | All Rights Reserved',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterSection(String title, List<String> links) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          ...links.map(
            (link) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(link, style: const TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Follow Koluvu',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          _buildSocialLink(Icons.facebook, 'Facebook'),
          _buildSocialLink(Icons.close, 'Twitter (X)'),
          _buildSocialLink(Icons.link, 'LinkedIn'),
          _buildSocialLink(Icons.camera_alt, 'Instagram'),
          _buildSocialLink(Icons.chat_bubble, 'WhatsApp Channel'),
        ],
      ),
    );
  }

  Widget _buildSocialLink(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'H-no 8-3-230/1/a/b V Giri, Safi Residency,\n2nd Floor, Yousufguda, Hyderabad,\nTelangana, India, 500045',
          style: TextStyle(color: Colors.white, height: 1.5),
        ),
        const SizedBox(height: 12),
        const Text('support@koluvu.com', style: TextStyle(color: Colors.white)),
        const SizedBox(height: 8),
        const Text('9866875709', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}

// Custom Widgets

// The Navigation Drawer
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      child: ElevatedButton.icon(
        onPressed: onTap ?? () {},
        icon: Icon(icon, color: Colors.white),
        label: Text(title, style: const TextStyle(fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 14),
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 120,
              child: DrawerHeader(
                decoration: const BoxDecoration(color: Colors.white),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ),
            // These are now the "minor tabs"
            _buildDrawerItem(
              icon: Icons.chevron_left,
              title: 'Koluvu Labs',
              color: Colors.orange,
            ),
            _buildDrawerItem(
              icon: Icons.people_outline,
              title: 'Kolink',
              color: Colors.orange,
            ),
            _buildDrawerItem(
              icon: Icons.model_training,
              title: 'Training',
              color: Colors.orange,
            ),
            _buildDrawerItem(
              icon: Icons.gavel_outlined,
              title: 'Govt Jobs',
              color: Colors.orange,
            ),
            const Divider(height: 30, indent: 20, endIndent: 20),
            _buildDrawerItem(
              icon: Icons.badge_outlined,
              title: 'Employee',
              color: Colors.green,
            ),
            _buildDrawerItem(
              icon: Icons.corporate_fare_outlined,
              title: 'Employer',
              color: Colors.green,
            ),
            _buildDrawerItem(
              icon: Icons.group_add_outlined,
              title: 'Partner',
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            _buildDrawerItem(
              icon: Icons.chat_bubble_outline,
              title: 'Chat with us',
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

// Promo Card (Resized)
class PromoCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  const PromoCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54, fontSize: 13),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue[700],
              side: BorderSide(color: Colors.blue[700]!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}

// Category Card
class CategoryCard extends StatelessWidget {
  final String title;
  const CategoryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A3365),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            color: Colors.black.withOpacity(0.2),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// Company Result Card
class CompanyResultCard extends StatelessWidget {
  const CompanyResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 50, height: 50, color: Colors.grey[300]),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ABC Tech',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text('Hyderabad', style: TextStyle(color: Colors.black54)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Chip(label: Text('MNC'), backgroundColor: Color(0xFFE3F2FD)),
              SizedBox(width: 8),
              Chip(
                label: Text('IT & Software'),
                backgroundColor: Color(0xFFE3F2FD),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'ABC Tech is a leading global technology services company.',
            style: TextStyle(color: Colors.black87, fontSize: 14),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('View Details'),
            ),
          ),
        ],
      ),
    );
  }
}
