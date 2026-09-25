import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/config/company_config.dart';
import '../../../../core/config/mock_data.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/scroll_reveal.dart';

class AboutPreviewSection extends StatelessWidget {
  const AboutPreviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return ScrollReveal(
      builder: (context, isVisible) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : 20,
          vertical: isDesktop ? 100 : 60,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Flex(
              direction: isDesktop ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image Side
                Expanded(
                  flex: isDesktop ? 1 : 0,
                  child: Container(
                    height: isDesktop ? 500 : 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          MockData.aboutImageUrl,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: AppColors.primary.withValues(alpha: 0.1),
                        ),
                      ],
                    ),
                  ).animate(target: isVisible ? 1 : 0).fade(duration: 800.ms).slideX(begin: -0.2),
                ),
                
                if (isDesktop) const SizedBox(width: 80) else const SizedBox(height: 40),
                
                // Content Side
                Expanded(
                  flex: isDesktop ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ABOUT US',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Building Connections Across Borders',
                        style: TextStyle(
                          fontSize: isDesktop ? 40 : 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        CompanyConfig.aboutDescription,
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.textSecondary,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () => context.go('/about'),
                        child: const Text('Learn More About Us'),
                      ),
                    ],
                  ).animate(target: isVisible ? 1 : 0).fade(duration: 800.ms).slideX(begin: 0.2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
