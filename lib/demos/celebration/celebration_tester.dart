import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:remember_demos/home_page.dart';
import 'package:remember_demos/widgets/remember_title.dart';
import 'package:remember_demos/widgets/task_row.dart';

class CelebrationTester extends StatefulWidget {
  const CelebrationTester({super.key});

  @override
  State<CelebrationTester> createState() => _CelebrationTesterState();
}

class _CelebrationTesterState extends State<CelebrationTester> {
  bool checked = false;
  GlobalKey globalKey = GlobalKey();

  double scale1 = 1.5;
  double scale1Min = 0;
  double scale1Max = 5;
  double scale2 = 1;
  double scale2Min = 0;
  double scale2Max = 5;
  int particleCount = 7;
  int particleCountMin = 0;
  int particleCountMax = 30;
  int length = 40;
  int lengthMin = 5;
  int lengthMax = 150;
  double startVelocity = 3.5;
  double startVelocityMin = 0.5;
  double startVelocityMax = 10;
  double decay = 0.99;
  double decayMin = 0.7;
  double decayMax = 1;
  double gravity = 0;
  double gravityMin = -1;
  double gravityMax = 1;
  List<ConfettiParticle> particles = [
    Circle(),
    Emoji(emoji: "🔥"),
    Star(),
    Square(),
    Triangle(),
  ];
  ConfettiParticle particle1 = Star();
  ConfettiParticle particle2 = Star();

  void resetToDefault() {
    setState(() {
      scale1 = 1.5;
      scale2 = 1;
      particleCount = 7;
      length = 40;
      startVelocity = 3.5;
      decay = 0.99;
      gravity = 0;
      particle1 = Star();
      particle2 = Star();
    });
  }

  void fire() {
    ConfettiOptions defaultOptions = ConfettiOptions(
      spread: 360, // degrees
      ticks: length,
      gravity: gravity,
      decay: decay,
      startVelocity: startVelocity,
      particleCount: particleCount,
      colors: [Color(0xFFFFBD00), Color(0xFFE89400), Color(0xFFFFCA6C)],
    );

    _showCelebration(
      options: defaultOptions,
      scalar1: scale1,
      scalar2: scale2,
      particle1: particle1,
      particle2: particle2,
      globalKey: globalKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RememberTitle(title: "Celebration Tester", showBackArrow: true),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => resetToDefault(),
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),

            // Scale 1
            const Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text("Scale 1 = $scale1"),
                  ),
                  Expanded(
                    child: Slider(
                      value: scale1,
                      onChanged: (value) {
                        setState(() {
                          scale1 = (value * 10).round() / 10;
                        });
                      },
                      max: scale1Max,
                      min: scale1Min,
                      divisions: ((scale1Max - scale1Min) * 10).toInt(),
                      inactiveColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Scale 2
            const Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text("Scale 2 = $scale2"),
                  ),
                  Expanded(
                    child: Slider(
                      value: scale2,
                      onChanged: (value) {
                        setState(() {
                          scale2 = (value * 10).round() / 10;
                        });
                      },
                      max: scale2Max,
                      min: scale2Min,
                      divisions: ((scale2Max - scale2Min) * 10).toInt(),
                      inactiveColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Particle count
            const Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text("Particle Count = $particleCount"),
                  ),
                  Expanded(
                    child: Slider(
                      value: particleCount.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          particleCount = value.toInt();
                        });
                      },
                      max: particleCountMax.toDouble(),
                      min: particleCountMin.toDouble(),
                      divisions: (particleCountMax - particleCountMin),
                      inactiveColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Length
            const Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text("Length (time) = $length"),
                  ),
                  Expanded(
                    child: Slider(
                      value: length.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          length = value.toInt();
                        });
                      },
                      max: lengthMax.toDouble(),
                      min: lengthMin.toDouble(),
                      divisions: (lengthMax - lengthMin) ~/ 5,
                      inactiveColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Start Velocity
            const Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text("Start Velocity = $startVelocity"),
                  ),
                  Expanded(
                    child: Slider(
                      value: startVelocity,
                      onChanged: (value) {
                        setState(() {
                          startVelocity = (value * 10).round() / 10;
                        });
                      },
                      max: startVelocityMax,
                      min: startVelocityMin,
                      divisions:
                          ((startVelocityMax - startVelocityMin) * 10).toInt(),
                      inactiveColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Decay
            const Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text("Decay = $decay"),
                  ),
                  Expanded(
                    child: Slider(
                      value: decay,
                      onChanged: (value) {
                        setState(() {
                          decay = (value * 250).round() / 250;
                        });
                      },
                      max: decayMax,
                      min: decayMin,
                      divisions: ((decayMax - decayMin) * 250).toInt(),
                      inactiveColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Gravity
            // const Divider(color: Colors.grey),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         width: 100,
            //         child: Text("Gravity = $gravity"),
            //       ),
            //       Expanded(
            //         child: Slider(
            //           value: gravity,
            //           onChanged: (value) {
            //             setState(() {
            //               gravity = (value * 10).round() / 10;
            //             });
            //           },
            //           max: gravityMax,
            //           min: gravityMin,
            //           divisions: ((gravityMax - gravityMin) * 10).toInt(),
            //           inactiveColor: Colors.grey,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            const Divider(color: Colors.grey),

            const Divider(color: Colors.grey),

            // The checkbox
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TaskRow(
                globalKeyForCelebrations: globalKey,
                title: "This is a sample task",
                color: Colors.teal,
                priority: 0,
                completed: checked,
                onChecked: () {
                  setState(() {
                    checked = !checked;
                  });
                  if (checked == true) fire();
                },
              ),
            ),
            SizedBox(height: 32),
            Text("Press the checkbox to see celebrations"),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

void _showCelebration({
  required ConfettiOptions options,
  required double? scalar1,
  required double? scalar2,
  required ConfettiParticle particle1,
  required ConfettiParticle particle2,
  required GlobalKey? globalKey,
}) {
  final overlay = navigatorKey.currentState?.overlay;
  if (overlay == null) return;

  if (globalKey != null) {
    final renderBox =
        globalKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final screenSize = MediaQuery.of(globalKey.currentContext!).size;

      final x = (position.dx + renderBox.size.width / 2) / screenSize.width;
      final y = (position.dy + renderBox.size.height / 2) / screenSize.height;

      options = options.copyWith(x: x, y: y);
    }
  }

  _launch(
    overlay,
    options: options.copyWith(scalar: scalar1),
    particleBuilder: (index) => Star(),
  );

  _launch(
    overlay,
    options: options.copyWith(scalar: scalar2),
    particleBuilder: (index) => Star(),
  );
}

ConfettiController _launch(
  OverlayState overlayState, {
  required ConfettiOptions options,
  ParticleBuilder? particleBuilder,
  Function(OverlayEntry overlayEntry)? onFinished,
}) {
  OverlayEntry? overlayEntry;
  final controller = ConfettiController();

  overlayEntry = OverlayEntry(
    builder: (BuildContext ctx) {
      final height = MediaQuery.of(ctx).size.height;
      final width = MediaQuery.of(ctx).size.width;

      return Positioned(
        left: width * options.x,
        top: height * options.y,
        width: 2,
        height: 2,
        child: Confetti(
          controller: controller,
          options: options,
          particleBuilder: particleBuilder,
          onFinished: () {
            if (onFinished != null) {
              onFinished(overlayEntry!);
            } else {
              overlayEntry?.remove();
            }
          },
          instant: true,
        ),
      );
    },
    opaque: false,
  );

  overlayState.insert(overlayEntry);

  return controller;
}
