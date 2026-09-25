import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/config/company_config.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.toString();

    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  const Icon(Icons.public, color: AppColors.primary, size: 28),
                  const SizedBox(width: 8),
                  Text(
                    CompanyConfig.shortName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  _DrawerItem(title: 'Home', path: '/', currentRoute: currentRoute),
                  _DrawerItem(title: 'About', path: '/about', currentRoute: currentRoute),
                  _DrawerItem(title: 'Products', path: '/products', currentRoute: currentRoute),
                  _DrawerItem(title: 'Services', path: '/services', currentRoute: currentRoute),
                  _DrawerItem(title: 'Global Reach', path: '/global-reach', currentRoute: currentRoute),
                  _DrawerItem(title: 'Contact', path: '/contact', currentRoute: currentRoute),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close drawer
                    context.go('/contact');
                  },
                  child: const Text('Get a Quote'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String title;
  final String path;
  final String currentRoute;

  const _DrawerItem({
    required this.title,
    required this.path,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = currentRoute == path || (path != '/' && currentRoute.startsWith(path));

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? AppColors.primary : AppColors.textPrimary,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
          fontSize: 18,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer
        context.go(path);
      },
    );
  }
}
