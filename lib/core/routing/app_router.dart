import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/layout/presentation/pages/main_layout.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/about/presentation/pages/about_page.dart';
import '../../features/products/presentation/pages/products_page.dart';
import '../../features/products/presentation/pages/product_detail_page.dart';
import '../../features/services/presentation/pages/services_page.dart';
import '../../features/global_reach/presentation/pages/global_reach_page.dart';
import '../../features/contact/presentation/pages/contact_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/about',
          builder: (context, state) => const AboutPage(),
        ),
        GoRoute(
          path: '/products',
          builder: (context, state) => const ProductsPage(),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return ProductDetailPage(productId: id);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/services',
          builder: (context, state) => const ServicesPage(),
        ),
        GoRoute(
          path: '/global-reach',
          builder: (context, state) => const GlobalReachPage(),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const ContactPage(),
        ),
      ],
    ),
  ],
);
