import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/config/mock_data.dart';
import '../../../../core/responsive/responsive_layout.dart';


class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isTablet = ResponsiveLayout.isTablet(context);

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
                'OUR SERVICES',
                style: TextStyle(
                  fontSize: isDesktop ? 48 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ).animate().fade().slideY(),
              const SizedBox(height: 16),
              Text(
                'Comprehensive global trade solutions tailored to your needs.',
                style: TextStyle(
                  fontSize: isDesktop ? 20 : 18,
                  color: Colors.white.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ).animate().fade(delay: 200.ms).slideY(),
            ],
          ),
        ),

        // Services Detailed
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : 20,
            vertical: isDesktop ? 100 : 60,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: MockData.services.asMap().entries.map((entry) {
                  final index = entry.key;
                  final service = entry.value;
                  final isEven = index % 2 == 0;
                  
                  return Container(
                    margin: const EdgeInsets.only(bottom: 60),
                    child: Flex(
                      direction: isDesktop ? Axis.horizontal : Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (isDesktop && isEven)
                          Expanded(
                            child: _ServiceIconBig(icon: service.icon),
                          ),
                        if (isDesktop && isEven) const SizedBox(width: 80),
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: isDesktop && !isEven ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                            children: [
                              if (!isDesktop) ...[
                                _ServiceIconBig(icon: service.icon),
                                const SizedBox(height: 24),
                              ],
                              Text(
                                service.title,
                                textAlign: isDesktop && !isEven ? TextAlign.right : TextAlign.left,
                                style: TextStyle(
                                  fontSize: isDesktop ? 32 : 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                service.description,
                                textAlign: isDesktop && !isEven ? TextAlign.right : TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: AppColors.textSecondary,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        if (isDesktop && !isEven) const SizedBox(width: 80),
                        if (isDesktop && !isEven)
                          Expanded(
                            child: _ServiceIconBig(icon: service.icon),
                          ),
                      ],
                    ),
                  ).animate().fade(delay: (100 * index).ms).slideY();
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ServiceIconBig extends StatelessWidget {
  final IconData icon;

  const _ServiceIconBig({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 80,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
