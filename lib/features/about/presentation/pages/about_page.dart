import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/config/company_config.dart';
import '../../../../core/config/mock_data.dart';
import '../../../../core/responsive/responsive_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

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
                'ABOUT US',
                style: TextStyle(
                  fontSize: isDesktop ? 48 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ).animate().fade().slideY(),
              const SizedBox(height: 16),
              Text(
                'Connecting Markets. Delivering Value.',
                style: TextStyle(
                  fontSize: isDesktop ? 20 : 18,
                  color: Colors.white.withOpacity(0.8),
                ),
              ).animate().fade(delay: 200.ms).slideY(),
            ],
          ),
        ),

        // Main Content
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : 20,
            vertical: isDesktop ? 100 : 60,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Flex(
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: isDesktop ? 1 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Our Mission',
                          style: TextStyle(
                            fontSize: isDesktop ? 32 : 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
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
                        const SizedBox(height: 48),
                        Text(
                          'Our Vision',
                          style: TextStyle(
                            fontSize: isDesktop ? 32 : 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'To be the most trusted and reliable partner in international trade, fostering global economic growth through seamless, transparent, and quality-driven supply chain solutions.',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.textSecondary,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ).animate().fade().slideX(begin: -0.1),
                  ),
                  if (isDesktop) const SizedBox(width: 80) else const SizedBox(height: 40),
                  Expanded(
                    flex: isDesktop ? 1 : 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: MockData.aboutImageUrl,
                        fit: BoxFit.cover,
                        height: isDesktop ? 600 : 400,
                        width: double.infinity,
                      ),
                    ).animate().fade().slideX(begin: 0.1),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Process Section
        Container(
          color: AppColors.surface,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : 20,
            vertical: isDesktop ? 100 : 60,
          ),
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'Our Trade Process',
                style: TextStyle(
                  fontSize: isDesktop ? 40 : 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ).animate().fade().slideY(),
              const SizedBox(height: 60),
              if (isDesktop)
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: MockData.processSteps.asMap().entries.map((entry) {
                        return Expanded(
                          child: _ProcessStep(
                            step: entry.key + 1,
                            title: entry.value,
                            isLast: entry.key == MockData.processSteps.length - 1,
                            isHorizontal: true,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              else
                Column(
                  children: MockData.processSteps.asMap().entries.map((entry) {
                    return _ProcessStep(
                      step: entry.key + 1,
                      title: entry.value,
                      isLast: entry.key == MockData.processSteps.length - 1,
                      isHorizontal: false,
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProcessStep extends StatelessWidget {
  final int step;
  final String title;
  final bool isLast;
  final bool isHorizontal;

  const _ProcessStep({
    required this.step,
    required this.title,
    required this.isLast,
    required this.isHorizontal,
  });

  @override
  Widget build(BuildContext context) {
    if (isHorizontal) {
      return Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '0$step',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    height: 2,
                    color: AppColors.primary.withOpacity(0.3),
                  ),
                )
              else
                const Spacer(),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '0$step',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppColors.primary.withOpacity(0.3),
                    ),
                  )
                else
                  const SizedBox(height: 40),
              ],
            ),
            const SizedBox(width: 24),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 40),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
