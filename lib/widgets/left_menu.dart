import 'package:flutter/material.dart';
import 'package:remember_demos/theme.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.white,
      key: const Key("LeftMenu_Drawer"),
      child: ListView(
        key: const Key("LeftMenu_ListView"),
        padding: EdgeInsets.zero,
        children: [
          Image.asset('assets/mark-transp.png', height: 64),
          _textWidget(
            text: "Values",
            onTap: () => {},
          ),
          _textWidget(
            text: "Goals",
            onTap: () => {},
          ),
          _textWidget(
            text: "Home",
            onTap: () => {},
          ),
          _customDivider(),
          _vertical(
            icon: Icon(Icons.bar_chart_rounded),
            // icon: SvgPicture.asset('assets/images/drawer/drawer_recap.svg'),
            text: "RECAP",
            onTap: () {},
          ),
          _vertical(
            icon: Icon(Icons.book_outlined),
            // icon: SvgPicture.asset('assets/images/drawer/drawer_journal.svg'),
            text: "JOURNAL",
            onTap: () {},
          ),
          _vertical(
            icon: const Icon(Icons.folder_copy_outlined),
            text: "FOLDERS",
            onTap: () {},
          ),
          _vertical(
            icon: Icon(Icons.archive_outlined),
            // icon: SvgPicture.asset('assets/images/drawer/drawer_archive.svg'),
            text: "ARCHIVE",
            onTap: () {},
          ),
          _vertical(
            icon: Icon(Icons.videocam_outlined),
            // icon: SvgPicture.asset('assets/images/drawer/drawer_videos.svg'),
            text: "VIDEOS",
            onTap: () {},
          ),
          _vertical(
            icon: Icon(Icons.search_rounded),
            // icon: SvgPicture.asset('assets/images/search.svg', height: 32),
            text: "SEARCH",
            onTap: () {},
          ),
          _customDivider(),
          _horizontal(
            icon: Icon(Icons.settings_rounded),
            // icon: SvgPicture.asset('assets/images/drawer/drawer_settings.svg'),
            text: "SETTINGS",
            onTap: () {},
          ),
          _horizontal(
            icon: Icon(Icons.contact_support_rounded),
            // icon: SvgPicture.asset('assets/images/drawer/drawer_support.svg'),
            text: "SUPPORT",
            onTap: () {},
          ),
          _horizontal(
            icon: Icon(Icons.sticky_note_2_rounded),
            // icon: SvgPicture.asset('assets/images/drawer/drawer_legal.svg'),
            text: "LEGAL",
            onTap: () {},
          ),
          _horizontal(
            icon: Image.asset('assets/mark-transp.png', height: 24),
            text: "WEBSITE",
            onTap: () {},
          ),
          _horizontal(
            icon: const Padding(
              padding: EdgeInsets.only(left: 2),
              child: Icon(
                Icons.info_outline_rounded,
                size: 20,
              ),
            ),
            text: "ABOUT",
            onTap: () {},
          ),
          _horizontal(
            icon: Icon(Icons.logout_outlined),
            text: "LOG OUT",
            onTap: () {},
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

Widget _textWidget({
  required String text,
  required void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(4),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    ),
  );
}

Widget _vertical({
  required Widget icon,
  required String text,
  required void Function()? onTap,
}) {
  return InkWell(
    key: UniqueKey(),
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(text),
        ],
      ),
    ),
  );
}

Widget _horizontal({
  required Widget icon,
  required String text,
  required void Function()? onTap,
}) {
  return InkWell(
    key: UniqueKey(),
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const SizedBox(width: 36),
          icon,
          const SizedBox(width: 16),
          Text(text),
        ],
      ),
    ),
  );
}

Widget _customDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Divider(
      indent: 24.0,
      endIndent: 24.0,
      color: RememberColors.gray,
    ),
  );
}
