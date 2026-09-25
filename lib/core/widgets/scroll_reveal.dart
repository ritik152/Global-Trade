import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollReveal extends StatefulWidget {
  final Widget Function(BuildContext context, bool isVisible) builder;
  final double fraction;

  const ScrollReveal({
    super.key,
    required this.builder,
    this.fraction = 0.05,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal> {
  bool _isVisible = false;
  late final Key _key;

  @override
  void initState() {
    super.initState();
    // Unique key so VisibilityDetector registers uniquely even if rebuilt
    _key = UniqueKey();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _key,
      onVisibilityChanged: (info) {
        if (info.visibleFraction > widget.fraction && !_isVisible) {
          if (mounted) {
            setState(() => _isVisible = true);
          }
        }
      },
      child: widget.builder(context, _isVisible),
    );
  }
}
