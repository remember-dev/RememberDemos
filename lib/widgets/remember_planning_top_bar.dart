import 'package:flutter/material.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/step_progress_view.dart';
import 'package:remember_demos/widgets/custom_style_arrow.dart';

class RememberPlanningTopBar extends StatelessWidget
    implements PreferredSizeWidget {
  final List<String> titles;
  final List<TextSpan> textSpans;
  final int currentStep;

  const RememberPlanningTopBar({
    super.key,
    required this.titles,
    required this.currentStep,
    required this.textSpans,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Center(
            child: StepProgressView(
              curStep: currentStep,
              titles: titles,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: CustomPaint(
            foregroundPainter: CustomStyleArrow(
              totalSteps: 3,
              currentStep: currentStep,
            ),
          ),
        ),

        // The text to be shown
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 2),
                  blurRadius: 2,
                ),
              ],
            ),
            child: RichText(
              text: TextSpan(
                style:
                    regularPrimary.copyWith(fontSize: 20, color: Colors.black),
                children: textSpans,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
