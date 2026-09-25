import 'package:flutter/material.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../widgets/app_navbar.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/footer.dart';

class MainLayout extends StatefulWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 50 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (_scrollController.offset <= 50 && _isScrolled) {
      setState(() => _isScrolled = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ResponsiveLayout.isDesktop(context) ? null : const MobileDrawer(),
      body: Stack(
        children: [
          // Main content
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(
                  top: ResponsiveLayout.isDesktop(context) ? 80 : 60,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      widget.child,
                      const Footer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          // Sticky Navigation
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppNavbar(
              isScrolled: _isScrolled,
              onMenuTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
