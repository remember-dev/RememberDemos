import 'package:flutter/material.dart';
import 'package:remember_demos/entities/services.dart';
import 'package:remember_demos/home_page.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/Button.dart';
import 'package:remember_demos/widgets/generic_bottom_app_bar.dart';

class VisualMind4 extends StatefulWidget {
  final String name;
  const VisualMind4({super.key, required this.name});

  @override
  State<VisualMind4> createState() => _VisualMind4State();
}

class _VisualMind4State extends State<VisualMind4> {
  var selected = List.generate(8, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 8),
            child: Text(
              "Which values are most important to you, ${widget.name}?",
              style: semiBoldPrimary.copyWith(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 48),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 2.5,
                ),
                itemCount: 8, // 4 items
                itemBuilder: (context, index) {
                  return GridTile(
                    child: SelectableButton(
                      selected: selected[index],
                      label: Text(
                        categories.elementAt(index).title,
                        style: mediumSecondary,
                      ),
                      selectedColor: categories.elementAt(index).color,
                      unselectedColor:
                          categories.elementAt(index).color.withAlpha(0x44),
                      withBorder: true,
                      onPressed: () {
                        setState(() {
                          selected[index] = !selected[index];
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomSheet: GenericBottomAppBar(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
              );
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
