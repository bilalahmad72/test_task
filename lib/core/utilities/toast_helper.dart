import 'package:flutter/material.dart';
import 'package:task_project/core/values/app_colors.dart';
import 'package:task_project/core/widgets/c_toast_widget.dart';

class ToastHelper {
  static OverlayEntry? _currentToast;

  static void showSuccessToast(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
    String? iconPath,
  }) {
    _showToast(
      context,
      message: message,
      iconPath: iconPath,
      backgroundColor: AppColors.success50,
      borderColor: AppColors.success100,
      textColor: AppColors.neutral800,
      duration: duration,
    );
  }

  static void _showToast(
    BuildContext context, {
    required String message,
    String? iconPath,
    required Color backgroundColor,
    required Color borderColor,
    required Color textColor,
    required Duration duration,
  }) {
    _currentToast?.remove();
    _currentToast = null;

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).padding.bottom + 16,
        left: 0,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: _AnimatedToast(
            child: CustomToast(
              message: message,
              iconPath: iconPath,
              backgroundColor: backgroundColor,
              borderColor: borderColor,
              textColor: textColor,
            ),
          ),
        ),
      ),
    );

    _currentToast = overlayEntry;
    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      overlayEntry.remove();
      if (_currentToast == overlayEntry) {
        _currentToast = null;
      }
    });
  }
}

class _AnimatedToast extends StatefulWidget {
  final Widget child;

  const _AnimatedToast({required this.child});

  @override
  State<_AnimatedToast> createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<_AnimatedToast> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(opacity: _fadeAnimation, child: widget.child),
    );
  }
}
