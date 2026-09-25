import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/config/company_config.dart';
import '../../../../core/responsive/responsive_layout.dart';

class AppNavbar extends StatelessWidget {
  final bool isScrolled;
  final VoidCallback onMenuTap;

  const AppNavbar({
    super.key,
    required this.isScrolled,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveLayout.isDesktop(context);
    final String currentRoute = GoRouterState.of(context).uri.toString();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isDesktop ? 80 : 60,
      decoration: BoxDecoration(
        color: isScrolled ? Colors.white : Colors.white.withOpacity(0.95),
        boxShadow: isScrolled
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ]
            : [],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => context.go('/'),
              child: Row(
                children: [
                  Icon(
                    Icons.public,
                    color: AppColors.primary,
                    size: isDesktop ? 32 : 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    CompanyConfig.shortName,
                    style: TextStyle(
                      fontSize: isDesktop ? 24 : 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (isDesktop) ...[
            // Desktop Navigation Links
            Row(
              children: [
                _NavLink(title: 'Home', path: '/', currentRoute: currentRoute),
                const SizedBox(width: 24),
                _NavLink(title: 'About', path: '/about', currentRoute: currentRoute),
                const SizedBox(width: 24),
                _NavLink(title: 'Products', path: '/products', currentRoute: currentRoute),
                const SizedBox(width: 24),
                _NavLink(title: 'Services', path: '/services', currentRoute: currentRoute),
                const SizedBox(width: 24),
                _NavLink(title: 'Global Reach', path: '/global-reach', currentRoute: currentRoute),
                const SizedBox(width: 24),
                _NavLink(title: 'Contact', path: '/contact', currentRoute: currentRoute),
                const SizedBox(width: 32),
                ElevatedButton(
                  onPressed: () => context.go('/contact'),
                  child: const Text('Get a Quote'),
                ),
              ],
            ),
          ] else ...[
            // Mobile Menu Icon
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.primary),
              onPressed: onMenuTap,
            ),
          ],
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final String path;
  final String currentRoute;

  const _NavLink({
    required this.title,
    required this.path,
    required this.currentRoute,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isActive = widget.currentRoute == widget.path || 
        (widget.path != '/' && widget.currentRoute.startsWith(widget.path));

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(widget.path),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive || _isHovered
                    ? AppColors.accent
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: isActive || _isHovered
                  ? AppColors.primary
                  : AppColors.textSecondary,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
