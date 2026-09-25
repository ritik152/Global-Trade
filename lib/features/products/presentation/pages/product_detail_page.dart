import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/config/mock_data.dart';
import '../../../../core/responsive/responsive_layout.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final product = MockData.products.firstWhere(
      (p) => p.id == productId,
      orElse: () => MockData.products.first,
    );

    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Column(
      children: [
        // Header
        SizedBox(
          width: double.infinity,
          height: isDesktop ? 400 : 300,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: product.imageUrl,
                fit: BoxFit.cover,
                memCacheWidth: 1920,
              ),
              Container(
                color: AppColors.primaryDark.withValues(alpha: 0.8),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: isDesktop ? 48 : 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ).animate().fade().slideY(),
                  ],
                ),
              ),
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
                  // Image
                  Expanded(
                    flex: isDesktop ? 1 : 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: product.imageUrl,
                        fit: BoxFit.cover,
                        height: isDesktop ? 500 : 300,
                        width: double.infinity,
                      ),
                    ).animate().fade().slideX(begin: -0.1),
                  ),
                  if (isDesktop) const SizedBox(width: 80) else const SizedBox(height: 40),
                  // Details
                  Expanded(
                    flex: isDesktop ? 1 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Category Overview',
                          style: TextStyle(
                            fontSize: isDesktop ? 32 : 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          product.description,
                          style: const TextStyle(
                            fontSize: 18,
                            color: AppColors.textSecondary,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 40),
                        
                        // Features
                        const Text(
                          'Key Highlights',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ...product.features.map((feature) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle, color: AppColors.accent, size: 24),
                              const SizedBox(width: 12),
                              Text(
                                feature,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        )),
                        
                        const SizedBox(height: 48),
                        
                        // CTA
                        Container(
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Interested in this product category?',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Get in touch with us for quotes, specifications, and availability.',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: () => context.go('/contact'),
                                child: const Text('Request a Quote'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).animate().fade().slideX(begin: 0.1),
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
