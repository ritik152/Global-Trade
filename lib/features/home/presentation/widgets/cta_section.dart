import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/responsive/responsive_layout.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: isDesktop ? 120 : 80,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        image: DecorationImage(
          image: const NetworkImage('https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?auto=format&fit=crop&q=80&w=1920'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColors.primaryDark.withOpacity(0.95),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              Text(
                'Let\'s Build Global Trade Opportunities Together',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isDesktop ? 48 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ).animate().fade(duration: 800.ms).slideY(begin: 0.2),
              
              const SizedBox(height: 24),
              
              Text(
                'Have a product requirement, sourcing need or export opportunity?\nLet\'s discuss how we can work together.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isDesktop ? 20 : 18,
                  color: Colors.white.withOpacity(0.8),
                  height: 1.5,
                ),
              ).animate().fade(delay: 200.ms, duration: 800.ms).slideY(begin: 0.2),
              
              const SizedBox(height: 48),
              
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => context.go('/contact'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: AppColors.primaryDark,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                    ),
                    child: const Text('Request a Quote', style: TextStyle(fontSize: 16)),
                  ),
                  OutlinedButton(
                    onPressed: () => context.go('/contact'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white, width: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                    ),
                    child: const Text('Contact Us', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ).animate().fade(delay: 400.ms, duration: 800.ms).slideY(begin: 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
