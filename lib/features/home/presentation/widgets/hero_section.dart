import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/config/company_config.dart';
import '../../../../core/config/mock_data.dart';
import '../../../../core/responsive/responsive_layout.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isMobile = ResponsiveLayout.isMobile(context);

    return SizedBox(
      width: double.infinity,
      height: isDesktop ? 800 : (isMobile ? 600 : 700),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          CachedNetworkImage(
            imageUrl: MockData.heroImageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(color: AppColors.primary),
            errorWidget: (context, url, error) => Container(color: AppColors.primary),
          ),
          
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryDark.withOpacity(0.9),
                  AppColors.primary.withOpacity(0.7),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.5, 1.0],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          
          // Content
          Center(
            child: Container(
              width: 1200,
              padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withOpacity(0.2),
                      border: Border.all(color: AppColors.accent.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'GLOBAL TRADE • IMPORT • EXPORT',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 12,
                      ),
                    ),
                  ).animate().fade(duration: 600.ms).slideY(begin: 0.5, end: 0),
                  
                  const SizedBox(height: 24),
                  
                  // Main Heading
                  Text(
                    'Connecting Global Markets.\nDelivering Trusted Trade.',
                    style: TextStyle(
                      fontSize: isDesktop ? 64 : (isMobile ? 40 : 48),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.1,
                      letterSpacing: -1,
                    ),
                  ).animate().fade(delay: 200.ms, duration: 800.ms).slideX(begin: -0.1, end: 0),
                  
                  const SizedBox(height: 24),
                  
                  // Description
                  SizedBox(
                    width: isDesktop ? 600 : double.infinity,
                    child: Text(
                      CompanyConfig.shortDescription,
                      style: TextStyle(
                        fontSize: isDesktop ? 20 : 18,
                        color: Colors.white.withOpacity(0.9),
                        height: 1.5,
                      ),
                    ),
                  ).animate().fade(delay: 400.ms, duration: 800.ms).slideX(begin: -0.1, end: 0),
                  
                  const SizedBox(height: 48),
                  
                  // Buttons
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.go('/products'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          foregroundColor: AppColors.primaryDark,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                        ),
                        child: const Text('Explore Products', style: TextStyle(fontSize: 16)),
                      ),
                      OutlinedButton(
                        onPressed: () => context.go('/contact'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white, width: 2),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                        ),
                        child: const Text('Get a Quote', style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ).animate().fade(delay: 600.ms, duration: 800.ms).slideY(begin: 0.5, end: 0),
                  
                  const SizedBox(height: 60),
                  
                  // Trust indicator
                  Row(
                    children: [
                      const Icon(Icons.verified_user, color: AppColors.accent, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Trusted Trade • Quality • Global Reach',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ).animate().fade(delay: 800.ms, duration: 800.ms),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
