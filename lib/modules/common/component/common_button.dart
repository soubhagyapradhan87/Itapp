import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onPressed,
    this.title,
    this.child,
    this.isLoading = false,
  }) : assert(title != null || child != null);

  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool isLoading;

  static const _minHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(_minHeight / 2);
    final isButtonEnabled = onPressed != null;
    final showShadow = !isButtonEnabled && !isLoading;
    return Container(
      constraints: const BoxConstraints(
        minHeight: _minHeight,
      ),
      decoration: BoxDecoration(
        gradient: isButtonEnabled
            ? const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.cyan,
                ],
              )
            : null,
        color: !isButtonEnabled ? const Color(0xFFCCCCCC) : null,
        boxShadow: showShadow
            ? [
                const BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: Color(0x0000001F),
                ),
              ]
            : null,
        borderRadius: borderRadius,
      ),
      child: isLoading
          ? const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 1.625,
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius,
                ),
              ),
              child: child ?? Text(title!),
            ),
    );
  }
}
