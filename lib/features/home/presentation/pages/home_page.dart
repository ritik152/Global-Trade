import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/statistics_section.dart';
import '../widgets/about_preview_section.dart';
import '../widgets/products_preview_section.dart';
import '../widgets/services_preview_section.dart';
import '../widgets/why_choose_us_section.dart';
import '../widgets/cta_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeroSection(),
        StatisticsSection(),
        AboutPreviewSection(),
        ProductsPreviewSection(),
        ServicesPreviewSection(),
        WhyChooseUsSection(),
        CtaSection(),
      ],
    );
  }
}
