import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/config/company_config.dart';
import '../../../../core/responsive/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isDesktop(context) ? 80 : 20,
        vertical: 60,
      ),
      child: Column(
        children: [
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.start,
            children: [
              // Company Info
              Expanded(
                flex: isMobile ? 0 : 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.public, color: Colors.white, size: 32),
                        const SizedBox(width: 8),
                        Text(
                          CompanyConfig.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      CompanyConfig.shortDescription,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        _SocialButton(
                          icon: Icons.link, // Placeholder for LinkedIn
                          onTap: () => _launchUrl(CompanyConfig.linkedinUrl),
                        ),
                        const SizedBox(width: 16),
                        _SocialButton(
                          icon: Icons.camera_alt_outlined, // Placeholder for Instagram
                          onTap: () => _launchUrl(CompanyConfig.instagramUrl),
                        ),
                        const SizedBox(width: 16),
                        _SocialButton(
                          icon: Icons.facebook,
                          onTap: () => _launchUrl(CompanyConfig.facebookUrl),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isMobile) const SizedBox(height: 40),
              
              // Company Links
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Company',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _FooterLink(title: 'About', path: '/about'),
                    const SizedBox(height: 12),
                    _FooterLink(title: 'Products', path: '/products'),
                    const SizedBox(height: 12),
                    _FooterLink(title: 'Services', path: '/services'),
                    const SizedBox(height: 12),
                    _FooterLink(title: 'Global Reach', path: '/global-reach'),
                  ],
                ),
              ),
              if (isMobile) const SizedBox(height: 40),

              // Support Links
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Support',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _FooterLink(title: 'Contact', path: '/contact'),
                    const SizedBox(height: 12),
                    _FooterLink(title: 'Request a Quote', path: '/contact'),
                    const SizedBox(height: 12),
                    _FooterLink(title: 'Privacy Policy', path: '#'),
                    const SizedBox(height: 12),
                    _FooterLink(title: 'Terms of Service', path: '#'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Divider(color: Colors.white.withOpacity(0.2)),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2026 ${CompanyConfig.name}. All Rights Reserved.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String title;
  final String path;

  const _FooterLink({required this.title, required this.path});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (widget.path != '#') {
            context.go(widget.path);
          }
        },
        child: Text(
          widget.title,
          style: TextStyle(
            color: _isHovered ? AppColors.accent : Colors.white.withOpacity(0.8),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
