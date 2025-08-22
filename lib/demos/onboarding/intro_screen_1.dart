import 'package:flutter/material.dart';
import 'package:remember_demos/demos/onboarding/intro_screen_2.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/theme.dart';
import 'package:remember_demos/widgets/generic_bottom_app_bar.dart';

class IntroScreenOne extends StatefulWidget {
  const IntroScreenOne({super.key});

  @override
  State<StatefulWidget> createState() => _IntroScreenOneState();
}

class _IntroScreenOneState extends State<IntroScreenOne> {
  var controller = ScrollController();
  bool showGradient = true;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        showGradient = controller.position.pixels <
            controller.position.maxScrollExtent - 12;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SafeArea(child: SizedBox()), // Avoid all the OS elements
            const SizedBox(height: 20), // 20px offset per Kimball's style guide
            Center(
              child: Text(
                "Welcome to",
                style: semiBoldSecondary.copyWith(fontSize: 25),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 6),
                  Image.asset('assets/typographic-logo.png'),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16, left: 6),
                      child: Text(
                        "®", // The '(R)' copyright symbol '®'
                        style: TextStyle(color: Colors.black, fontSize: 8),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 32),

            // The video
            // const RememberVideoPlayer(),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(width: 350, height: 200, color: Colors.black),
                Icon(Icons.play_arrow, size: 64, color: RememberColors.regular),
              ],
            ),
            Text("(This video won't play. It's just a placeholder.)"),

            const Spacer(),

            // Remember logo
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset('assets/mark-transp.png'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GenericBottomAppBar(
        children: [
          ElevatedButton(
            style: RememberButtonStyles.primary,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IntroScreenTwo()),
              );
            },
            child: Text("NEXT"),
          ),
        ],
      ),
    );
  }
}
