import 'package:flutter/material.dart';
import 'package:remember_demos/demos/onboarding/onboarding_3/onboarding_3_2.dart';
import 'package:remember_demos/widgets/generic_bottom_app_bar.dart';

class Onboarding_3_1 extends StatefulWidget {
  const Onboarding_3_1({super.key});

  @override
  State<Onboarding_3_1> createState() => _Onboarding_3_1State();
}

class _Onboarding_3_1State extends State<Onboarding_3_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            children: [
              Text(
                "Let's get you started with a 5-quesiton interview/quiz... to create your login to view your customized plan!",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GenericBottomAppBar(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Onboarding_3_2()),
              );
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
