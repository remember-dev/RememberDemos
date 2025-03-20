import 'dart:math';

import 'package:flutter/material.dart';
import 'package:remember_demos/demos/quick_task_bar/quick_task_bar_1.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/left_menu.dart';

class _TestNavigaitonPage extends StatelessWidget {
  const _TestNavigaitonPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.rotate(
          angle: -pi / 6,
          child: Text(
            "This screen is a test",
            style: regularSecondary.copyWith(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

const _testPage = _TestNavigaitonPage();

class Navigation1 extends StatefulWidget {
  /// `page` is a [Widget] that must use the [MainScreenMixin] to keep the app
  /// consistent on when the bottom app bar is shown. This is a guard to prevent
  /// other pages from being shown with the bottom app bar when there should
  /// only ever be one.
  final Widget page;

  final int index;

  const Navigation1({
    super.key,
    this.page = _testPage,
    this.index = HOME_SCREEN_INDEX,
  });

  @override
  State<Navigation1> createState() => Navigation1State();
}

const int LEFT_MENU_INDEX = 0;
const int ADD_ITEM_INDEX = 1;
const int HOME_SCREEN_INDEX = 2;
const int SEARCH_SCREEN_INDEX = 3;

const double NAV_BAR_HEIGHT = 80;

class Navigation1State extends State<Navigation1> {
  int highlightedIndex = HOME_SCREEN_INDEX;
  late Widget currentPage = widget.page;
  PreferredSizeWidget? currentAppBar;
  bool quick = false;
  OverlayEntry? overlayEntry;

  /// This page Key is used to update the page when something in Navigation
  /// changes and the page needs to be rebuilt. This might not be the best
  /// solution, but it's a workaround for now.
  Key pageKey = Key(DateTime.now().toIso8601String());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final navBarKey = GlobalKey();

  void onQuickTaskClosed() {
    removeOverlayAndResetNav();
    setState(() {
      quick = false;
    });
  }

  void onQuickTaskSubmit() {
    removeOverlayAndResetNav();
    setState(() {
      quick = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: overlayEntry == null,
      onPopInvokedWithResult: (didPop, result) {
        if (overlayEntry != null) {
          removeOverlayAndResetNav();
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: true,
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: const LeftMenu(),
        ),

        // The app bar
        appBar: currentAppBar,

        body: Column(
          children: [
            Expanded(
              child: Container(
                key: pageKey,
                child: currentPage,
              ),
            ),
            quick
                ? QuickTaskBar1(
                    onClose: onQuickTaskClosed,
                    onSubmit: onQuickTaskSubmit,
                  )
                : const SizedBox(),
          ],
        ),

        // The custome Navigation Bar
        bottomNavigationBar: Stack(
          children: [
            NavigationBar(
              height: NAV_BAR_HEIGHT,
              key: navBarKey,
              onDestinationSelected: (int index) {
                removeOverlayAndResetNav();
                if (index == LEFT_MENU_INDEX) {
                  scaffoldKey.currentState?.openDrawer();
                  return;
                }
                if (index == ADD_ITEM_INDEX) {
                  setState(() {
                    highlightedIndex = index;
                  });
                  // showOverlayMenu(); // TODO: Only show one of these
                  showQuickTask();
                  return;
                }
                setState(() {
                  // if (index == HOME_SCREEN_INDEX) {
                  //   var page = const HomeScreen();
                  //   currentPage = page;
                  //   currentAppBar = page.getAppBar();
                  // } else if (index == SEARCH_SCREEN_INDEX) {
                  //   var page = const SearchScreen();
                  //   currentPage = page;
                  //   currentAppBar = page.getAppBar();
                  // }
                  highlightedIndex = index;
                });
              },
              indicatorShape: const PathBorder(),
              indicatorColor: highlightedIndex == LEFT_MENU_INDEX
                  ? Colors.transparent
                  : Colors.white,
              animationDuration: Duration(
                  milliseconds:
                      (highlightedIndex == LEFT_MENU_INDEX ? 0 : 500)),
              selectedIndex: highlightedIndex,
              destinations: [
                _navItem("assets/mark-transp.png", "Menu", isMenu: true),
                _navItem("assets/directive-add.png", "Add"),
                _navItem("assets/bab-master-inact.png", "Home"),
                _navItem("assets/search.png", "Search"),
              ],
            ),

            // The color bar
            Image.asset(
              'assets/color-bar.png',
              width: MediaQuery.of(context).size.width,
              height: 10,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  /// Rebuild the page that is being shown by the Navigator.
  /// This is done by assigning a new Key to `pageKey`
  void rebuildPage() {
    if (!mounted) return;
    setState(() {
      pageKey = Key(DateTime.now().toIso8601String());
    });
  }

  void removeOverlayAndResetNav() {
    overlayEntry?.remove();
    overlayEntry = null;
    setState(() {
      highlightedIndex = HOME_SCREEN_INDEX;
    });
  }

  void navigateAndRefresh(Widget destination) async {
    var shouldUpdate = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => destination),
    );
    if (shouldUpdate is bool && shouldUpdate == true) {
      rebuildPage();
    }
  }

  void showQuickTask() {
    setState(() {
      quick = true;
    });
    return;
  }

  void showOverlayMenu() {
    final overlay = Overlay.of(context);

    // Create an OverlayEntry
    overlayEntry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          // Background layer to detect taps outside the popup
          GestureDetector(
            // Remove the overlay when tapped outside
            onTap: () {
              removeOverlayAndResetNav();
            },
            // Transparent layer to capture taps
            child: Container(
              color: const Color.fromARGB(0x90, 0, 0, 0),
              height: MediaQuery.of(context).size.height - NAV_BAR_HEIGHT,
            ),
          ),

          // Popup layer
          Positioned(
            bottom: NAV_BAR_HEIGHT,
            left: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              child: Container(
                // height: navBarHeight,
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    overlayMenuOption(
                      "Value",
                      const Icon(Icons.star),
                      onTap: () {},
                    ),
                    const SizedBox(width: 24),
                    overlayMenuOption(
                      "Goal",
                      const Icon(Icons.golf_course),
                      onTap: () {},
                    ),
                    const SizedBox(width: 24),
                    overlayMenuOption(
                      "Task",
                      const Icon(Icons.check_box),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // Insert the overlay
    overlay.insert(overlayEntry!);
  }

  Widget overlayMenuOption(String label, Widget icon, {VoidCallback? onTap}) {
    return Column(
      children: [
        IconButton(
          iconSize: 36,
          icon: icon,
          onPressed: () {
            removeOverlayAndResetNav();
            onTap?.call();
          },
        ),
        Text(
          label,
          style: semiBoldPrimary.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}

Widget _navItem(String pngPath, String label, {bool isMenu = false}) {
  return NavigationDestination(
    selectedIcon: Image.asset(
      pngPath,
      height: 32,
      width: 32,
      color: isMenu ? Colors.white : Colors.black,
    ),
    icon: Image.asset(
      pngPath,
      height: 32,
      width: 32,
      color: Colors.white,
    ),
    label: label,
  );
}

class PathBorder extends ShapeBorder {
  const PathBorder();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();
    double space = 5;
    path.moveTo(space * -1, space * -1);
    path.lineTo(
      rect.size.width + space,
      space * -1,
    );
    //Curva
    path.quadraticBezierTo(rect.size.width, space * -1, rect.size.width, space);
    path.lineTo(rect.size.width, rect.size.height * 2.4);
    path.lineTo(0, rect.size.height * 2.4);
    path.lineTo(0, space);
    //Curva
    path.quadraticBezierTo(0, space * -1, space * -1, space * -1);
    path.close();
    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();
    double space = 5;
    path.moveTo(space * -1, space * -1);
    path.lineTo(
      rect.size.width + space,
      space * -1,
    );
    //Curva
    path.quadraticBezierTo(rect.size.width, space * -1, rect.size.width, space);
    path.lineTo(rect.size.width, rect.size.height * 2.4);
    path.lineTo(0, rect.size.height * 2.4);
    path.lineTo(0, space);
    //Curva
    path.quadraticBezierTo(0, space * -1, space * -1, space * -1);
    path.close();
    return path;
  }

  @override
  ShapeBorder scale(double t) => this;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    Paint paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawPath(getInnerPath(rect), paint);
  }
}
