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

CustomTransitionPage<T> _buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeOutCubic).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 0.05),
            end: Offset.zero,
          ).animate(CurveTween(curve: Curves.easeOutCubic).animate(animation)),
          child: child,
        ),
      );
    },
  );
}

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
          pageBuilder: (context, state) => _buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const HomePage(),
          ),
        ),
        GoRoute(
          path: '/about',
          pageBuilder: (context, state) => _buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const AboutPage(),
          ),
        ),
        GoRoute(
          path: '/products',
          pageBuilder: (context, state) => _buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const ProductsPage(),
          ),
          routes: [
            GoRoute(
              path: ':id',
              pageBuilder: (context, state) {
                final id = state.pathParameters['id']!;
                return _buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: ProductDetailPage(productId: id),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/services',
          pageBuilder: (context, state) => _buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const ServicesPage(),
          ),
        ),
        GoRoute(
          path: '/global-reach',
          pageBuilder: (context, state) => _buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const GlobalReachPage(),
          ),
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (context, state) => _buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const ContactPage(),
          ),
        ),
      ],
    ),
  ],
);
