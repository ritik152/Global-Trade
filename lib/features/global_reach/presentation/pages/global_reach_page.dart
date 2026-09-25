import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/config/mock_data.dart';
import '../../../../core/responsive/responsive_layout.dart';

class GlobalReachPage extends StatelessWidget {
  const GlobalReachPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    int crossAxisCount = 1;
    if (isDesktop) {
      crossAxisCount = 3;
    } else if (isTablet) {
      crossAxisCount = 2;
    }

    final regions = [
      {'name': 'India', 'desc': 'Headquarters and primary sourcing hub.'},
      {'name': 'Middle East', 'desc': 'Strategic trade partnerships and distribution.'},
      {'name': 'Europe', 'desc': 'Growing market for quality exports.'},
      {'name': 'Asia', 'desc': 'Extensive network of suppliers and buyers.'},
      {'name': 'Africa', 'desc': 'Emerging trade opportunities.'},
    ];

    return Column(
      children: [
        // Header
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : 20,
            vertical: isDesktop ? 120 : 80,
          ),
          color: AppColors.primary,
          child: Column(
            children: [
              Text(
                'GLOBAL REACH',
                style: TextStyle(
                  fontSize: isDesktop ? 48 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ).animate().fade().slideY(),
              const SizedBox(height: 16),
              Text(
                'Connecting Markets Across the World.',
                style: TextStyle(
                  fontSize: isDesktop ? 20 : 18,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
                textAlign: TextAlign.center,
              ).animate().fade(delay: 200.ms).slideY(),
            ],
          ),
        ),

        // Map Section
        SizedBox(
          width: double.infinity,
          height: isDesktop ? 600 : 400,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: MockData.worldMapImageUrl,
                fit: BoxFit.cover,
                memCacheWidth: 1920,
              ),
              Container(
                color: AppColors.primaryDark.withValues(alpha: 0.9),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'Expanding opportunities through\ntrusted international trade.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isDesktop ? 40 : 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ).animate().fade(delay: 400.ms).scale(),
                ),
              ),
            ],
          ),
        ),

        // Regions
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : 20,
            vertical: isDesktop ? 100 : 60,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  Text(
                    'Our Target Markets',
                    style: TextStyle(
                      fontSize: isDesktop ? 32 : 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 60),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: regions.length,
                    itemBuilder: (context, index) {
                      final region = regions[index];
                      return Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: AppColors.accent, size: 28),
                                const SizedBox(width: 12),
                                Text(
                                  region['name']!,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              region['desc']!,
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ).animate().fade(delay: (100 * index).ms).scale();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
