import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/config/mock_data.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/scroll_reveal.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    int crossAxisCount = 1;
    if (isDesktop) {
      crossAxisCount = 4;
    } else if (isTablet) {
      crossAxisCount = 2;
    }

    return ScrollReveal(
      builder: (context, isVisible) => Container(
        color: AppColors.primary,
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : 20,
          vertical: isDesktop ? 100 : 60,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                // Header
                Column(
                  children: [
                    const Text(
                      'WHY CHOOSE US',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Built Around Quality and Reliability',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isDesktop ? 40 : 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ],
                ).animate(target: isVisible ? 1 : 0).fade(duration: 800.ms).slideY(begin: 0.2),
                
                const SizedBox(height: 60),
                
                // Benefits Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    childAspectRatio: isDesktop ? 0.9 : 1.2,
                  ),
                  itemCount: MockData.benefits.length,
                  itemBuilder: (context, index) {
                    final benefit = MockData.benefits[index];
                    return _BenefitCard(
                      title: benefit.title,
                      description: benefit.description,
                      icon: benefit.icon,
                      index: index,
                    ).animate(target: isVisible ? 1 : 0).fade(delay: (100 * index).ms).slideY(begin: 0.2);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BenefitCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final int index;

  const _BenefitCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 40,
                color: AppColors.accent,
              ),
              Text(
                '0${index + 1}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withValues(alpha: 0.2),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              description,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
