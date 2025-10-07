import 'package:flutter/material.dart';

class ProgressBarSlider extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final int divisions; // number of steps
  final Color fillColor;
  final Color backgroundColor;
  final double height;
  final bool showDivisions;

  const ProgressBarSlider({
    super.key,
    required this.progress,
    this.divisions = 5,
    this.fillColor = Colors.green,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.height = 10,
    this.showDivisions = true,
  });

  @override
  Widget build(BuildContext context) {
    // Clamp progress between 0 and 1
    final double clampedProgress = progress.clamp(0.0, 1.0);

    return LayoutBuilder(
      builder: (context, constraints) {
        final double totalWidth = constraints.maxWidth;
        final double fillWidth = totalWidth * clampedProgress;

        return Stack(
          children: [
            // Background bar
            Container(
              height: height,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),

            // Filled portion
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: height,
              width: fillWidth,
              decoration: BoxDecoration(
                color: fillColor,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),

            // Division markers
            if (showDivisions && divisions > 1)
              Positioned.fill(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(divisions, (index) {
                    if (index == 0 || index == divisions - 1) {
                      return const SizedBox(); // skip ends
                    }
                    return Container(
                      width: 2,
                      height: height + 4,
                      color: Colors.white.withOpacity(0.8),
                    );
                  }),
                ),
              ),
          ],
        );
      },
    );
  }
}
