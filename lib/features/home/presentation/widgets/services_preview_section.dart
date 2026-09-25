import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/config/mock_data.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/scroll_reveal.dart';

class ServicesPreviewSection extends StatelessWidget {
  const ServicesPreviewSection({super.key});

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
        color: Colors.white,
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
                      'OUR EXPERTISE',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Our Global Trade Services',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isDesktop ? 40 : 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        height: 1.2,
                      ),
                    ),
                  ],
                ).animate(target: isVisible ? 1 : 0).fade(duration: 800.ms).slideY(begin: 0.2),
                
                const SizedBox(height: 60),
                
                // Services Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    childAspectRatio: isDesktop ? 0.8 : 1.0,
                  ),
                  itemCount: MockData.services.length,
                  itemBuilder: (context, index) {
                    final service = MockData.services[index];
                    return _ServiceCard(
                      title: service.title,
                      description: service.description,
                      icon: service.icon,
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

class _ServiceCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const _ServiceCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go('/services'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.primary : AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered ? AppColors.primary : AppColors.border,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _isHovered ? Colors.white.withValues(alpha: 0.1) : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.icon,
                  size: 32,
                  color: _isHovered ? Colors.white : AppColors.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _isHovered ? Colors.white : AppColors.primary,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Text(
                  widget.description,
                  style: TextStyle(
                    color: _isHovered ? Colors.white.withValues(alpha: 0.8) : AppColors.textSecondary,
                    height: 1.5,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'Learn More',
                    style: TextStyle(
                      color: _isHovered ? AppColors.accent : AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedPadding(
                    padding: EdgeInsets.only(left: _isHovered ? 8.0 : 0.0),
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.arrow_forward,
                      color: _isHovered ? AppColors.accent : AppColors.primary,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
