import 'package:flutter/material.dart';
import '../models/benefit_model.dart';
import '../models/product_category_model.dart';
import '../models/service_model.dart';
import '../models/statistic_model.dart';

class MockData {
  static const List<StatisticModel> statistics = [
    StatisticModel(value: '10', suffix: '+', label: 'Product Categories'),
    StatisticModel(value: '20', suffix: '+', label: 'Global Markets'),
    StatisticModel(value: '100', suffix: '%', label: 'Quality Focus'),
    StatisticModel(value: '24', suffix: '/7', label: 'Business Support'),
  ];

  static const List<ProductCategoryModel> products = [
    ProductCategoryModel(
      id: 'agri',
      title: 'Agricultural Products',
      description: 'Premium quality agricultural commodities sourced directly from trusted producers globally.',
      imageUrl: 'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&q=80&w=800',
      features: ['Organic Options', 'Bulk Supply', 'Quality Certified'],
    ),
    ProductCategoryModel(
      id: 'food',
      title: 'Food Products',
      description: 'Processed and packaged food products meeting strict international standards.',
      imageUrl: 'https://images.unsplash.com/photo-1606859191214-25806e8e2423?auto=format&fit=crop&q=80&w=800',
      features: ['Long Shelf Life', 'Hygienically Packed', 'Export Quality'],
    ),
    ProductCategoryModel(
      id: 'industrial',
      title: 'Industrial Products',
      description: 'High-grade industrial materials and components for manufacturing.',
      imageUrl: 'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?auto=format&fit=crop&q=80&w=800',
      features: ['Industrial Grade', 'Reliable Sourcing', 'Custom Specifications'],
    ),
    ProductCategoryModel(
      id: 'consumer',
      title: 'Consumer Products',
      description: 'A wide range of consumer goods for retail markets worldwide.',
      imageUrl: 'https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&q=80&w=800',
      features: ['Trendy', 'Market Ready', 'Competitive Pricing'],
    ),
    ProductCategoryModel(
      id: 'raw_materials',
      title: 'Raw Materials',
      description: 'Essential raw materials for various industrial applications.',
      imageUrl: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&q=80&w=800',
      features: ['Consistent Supply', 'Verified Quality', 'Bulk Quantities'],
    ),
    ProductCategoryModel(
      id: 'custom',
      title: 'Custom Sourcing',
      description: 'Specialized product sourcing based on your unique requirements.',
      imageUrl: 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?auto=format&fit=crop&q=80&w=800',
      features: ['Tailored Solutions', 'Global Network', 'End-to-end Service'],
    ),
  ];

  static const List<ServiceModel> services = [
    ServiceModel(
      id: 'export',
      title: 'Global Export',
      description: 'Seamless export operations connecting domestic products to international buyers with complete documentation.',
      icon: Icons.flight_takeoff_rounded,
    ),
    ServiceModel(
      id: 'sourcing',
      title: 'International Sourcing',
      description: 'Finding the right manufacturers and suppliers across the globe to meet your quality and price requirements.',
      icon: Icons.search_rounded,
    ),
    ServiceModel(
      id: 'import',
      title: 'Import Solutions',
      description: 'End-to-end import services handling customs, compliance, and logistics to your facility.',
      icon: Icons.local_shipping_rounded,
    ),
    ServiceModel(
      id: 'supply_chain',
      title: 'Supply Chain & Support',
      description: 'Optimizing your supply chain with our trade expertise and dedicated support team.',
      icon: Icons.hub_rounded,
    ),
  ];

  static const List<BenefitModel> benefits = [
    BenefitModel(
      title: 'Quality Focus',
      description: 'We ensure all products meet strict quality guidelines and international standards before shipping.',
      icon: Icons.verified_user_rounded,
    ),
    BenefitModel(
      title: 'Reliable Supply',
      description: 'Consistent and timely delivery schedules to keep your business running smoothly.',
      icon: Icons.inventory_2_rounded,
    ),
    BenefitModel(
      title: 'Global Network',
      description: 'Access to a vast network of verified suppliers and buyers across multiple continents.',
      icon: Icons.public_rounded,
    ),
    BenefitModel(
      title: 'Professional Support',
      description: 'Dedicated trade specialists assisting you at every step of the import/export process.',
      icon: Icons.support_agent_rounded,
    ),
  ];

  static const List<String> processSteps = [
    'Requirement',
    'Sourcing',
    'Quality Check',
    'Documentation',
    'Global Shipment',
    'Delivery',
  ];
  
  // Hero Image
  static const String heroImageUrl = 'https://images.unsplash.com/photo-1494412574643-ff11b0a5c1c3?auto=format&fit=crop&q=80&w=1920';
  
  // About Image
  static const String aboutImageUrl = 'https://images.unsplash.com/photo-1578575437130-527eed3abbec?auto=format&fit=crop&q=80&w=1200';
  
  // World Map Image placeholder
  static const String worldMapImageUrl = 'https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&q=80&w=1920';
}
