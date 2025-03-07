import 'package:flutter/material.dart';
import 'package:remember_demos/demos/onboarding/create_account.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/theme.dart';
import 'package:remember_demos/widgets/generic_bottom_app_bar.dart';

class IntroScreenTwo extends StatefulWidget {
  const IntroScreenTwo({super.key});

  @override
  State<StatefulWidget> createState() => _IntroScreenTwoState();
}

class _IntroScreenTwoState extends State<IntroScreenTwo> {
  PageController pageController = PageController();
  var activeCardIndex = 0;
  var cards = [
    _carouselItem(
      "https://rememberappstorage.blob.core.windows.net/carousel/carousel_1.png",
      "Welcome to Remember. You’re here to Live Life Better. Let’s get started!",
    ),
    _carouselItem(
      "https://rememberappstorage.blob.core.windows.net/carousel/carousel_2.png",
      "Here’s a quick overview of how value-based planning works.",
    ),
    _carouselItem(
      "https://rememberappstorage.blob.core.windows.net/carousel/carousel_3.png",
      "First, what’s important to you? Let’s identify your core values through a series of prompts. You can repeat this as many times as you like.",
    ),
    _carouselItem(
      "https://rememberappstorage.blob.core.windows.net/carousel/carousel_4.png",
      "Next, let’s set some goals. What do you want to achieve?",
    ),
    _carouselItem(
      "https://rememberappstorage.blob.core.windows.net/carousel/carousel_5.png",
      "Let’s plan your tasks and stay organized.",
    ),
    _carouselItem(
      "https://rememberappstorage.blob.core.windows.net/carousel/carousel_6.png",
      "You can manage your day right from the homescreen at any time. REMEMBER integrates seamlessly with your existing calendar.",
    ),
    _carouselItem(
      "https://rememberappstorage.blob.core.windows.net/carousel/carousel_7.png",
      "Other features include prioritization, delegation, journaling, quotes, progress charts and recap.",
    ),
    _carouselItem(
      "https://rememberappstorage.blob.core.windows.net/carousel/carousel_8.png",
      "Look for new features coming soon including AI coaching, habit-tracking and more!",
    ),
    _carouselItem(
      "https://rememberappstorage.blob.core.windows.net/carousel/carousel_9.png",
      "You’re ready to Live Life Better. Start now!",
    ),
  ];

  @override
  void initState() {
    pageController.addListener(() {
      setState(() => activeCardIndex = pageController.page?.round() ?? 0);
    });
    super.initState();
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

            // Card Carousel
            Flexible(
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: pageController,
                        children: cards,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                        "On web you have to scroll horizontal 'shift' + 'scroll wheel'"),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),

            // Text
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Text(
                "Live Life Better",
                style: semiBoldPrimary.copyWith(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GenericBottomAppBar(
        children: [
          ElevatedButton(
            style: primaryStyle,
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateAccount()),
              );
            },
            child: Text("NEXT"),
          ),
        ],
      ),
    );
  }
}

Widget _carouselItem(String? imageSrc, String caption, {bool error = false}) {
  Widget image;
  if (error) {
    image = const Icon(Icons.image, size: 100);
  } else if (imageSrc == null) {
    image = const CircularProgressIndicator();
  } else {
    image = Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Image.network(imageSrc),
      ),
    );
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      // The image
      image,

      // The caption text at the bottom
      Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          caption,
          style: semiBoldSecondary.copyWith(fontSize: 17),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
