import 'package:flutter/material.dart';
import 'package:remember_demos/home_page.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/theme.dart';
import 'package:remember_demos/widgets/utils.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();

  bool tried = false;
  bool get missingFirstName => firstNameController.text.trim().isEmpty && tried;
  bool get missingLastName => lastNameController.text.trim().isEmpty && tried;
  bool get isInvalidPhone => !isValidPhoneNumber() && tried;
  bool get missingAgeRange => ageController.text.trim().isEmpty && tried;
  bool get missingGender => genderController.text.trim().isEmpty && tried;

  List<String> ageRanges = [
    // This comment is to format the age list
    '13 years or less', '13-17 years old', '18-30 years old',
    '31-65 years old', '> 65 years', 'Prefer not to disclose',
  ];
  List<String> genders = [
    // This comment is to format the gender list.
    "Male", "Female", "Other", "Prefer not to disclose",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 24),
            child: Image.asset('assets/typographic-logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 34, top: 10),
            child: Center(
              child: Text(
                'Create Account',
                style: boldSecondary.copyWith(fontSize: 26),
              ),
            ),
          ),

          // Text Fields
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: inputField(
              hintText: "First name",
              textController: firstNameController,
              hasError: missingFirstName,
              characterLimit: 100,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: inputField(
              hintText: "Last name",
              textController: lastNameController,
              hasError: missingLastName,
              characterLimit: 100,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: inputField(
              hintText: "Phone (555-555-5555)",
              textController: phoneController,
              hasError: isInvalidPhone,
              characterLimit: 100,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: dropdownSelector(
              hint: "Age range",
              options: ageRanges,
              controller: ageController,
              hasError: missingAgeRange,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: dropdownSelector(
              hint: "Gender",
              options: genders,
              controller: genderController,
              hasError: missingGender,
            ),
          ),

          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  tried = true;
                });
                if (!missingFirstName &&
                    !missingLastName &&
                    !isInvalidPhone &&
                    !missingAgeRange &&
                    !missingGender) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()), // TODO
                  );
                }
              },
              style: RememberButtonStyles.primary,
              child: Text("CREATE YOUR PLAN!"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 70),
            child: Image.asset('assets/mark-transp.png'),
          ),
          Center(
            child: Text(
              'By continuing, you agree to',
              style: mediumPrimary,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  'Privacy policy',
                  style: mediumPrimary.copyWith(
                      decoration: TextDecoration.underline),
                ),
              ),
              Text(
                ' and ',
                style: mediumPrimary,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Terms of use',
                  style: mediumPrimary.copyWith(
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
      bottomSheet: Image.asset(
        'assets/color-bar.png',
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget inputField({
    required String hintText,
    required TextEditingController textController,
    required bool hasError,
    int? characterLimit,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasError ? Colors.red : Colors.white,
          width: 3,
        ),
      ),
      child: TextField(
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.words,
        autofocus: false,
        controller: textController,
        maxLength: characterLimit,
        maxLines: 1,
        style: mediumPrimary,
        onTapOutside: (_) => hideKeyboard(),
        onSubmitted: (_) => hideKeyboard(),
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey.shade800),
          hintText: hintText,
          fillColor: Colors.white,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget dropdownSelector(
      {required String hint,
      required List<String> options,
      required TextEditingController controller,
      required bool hasError}) {
    var items = options.map(
      (option) => DropdownMenuEntry(
        value: option,
        label: option,
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasError ? Colors.red : Colors.white,
          width: 3,
        ),
      ),
      child: DropdownMenu<String>(
        menuStyle: const MenuStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        width: double.infinity,
        textStyle: mediumPrimary,
        controller: controller,
        hintText: hint,
        dropdownMenuEntries: items.toList(),
      ),
    );
  }

  /// Make sure the phone number is a valid US number ONLY! Returns `true` if invalid.
  bool isValidPhoneNumber() {
    String text = phoneController.text.trim();

    // If the string is empty, then the user did not want to enter a phone number.
    // COMMENT THIS OUT IF THE USER SHOULD BE REQUIRED TO PUT IN A PHONE NUMBER!
    // if (text.isEmpty) return true;

    // This is some regex that matches US phone numbers ONLY!
    // See here: https://regex101.com/r/JuAgkL/2
    RegExp phoneRegExp =
        RegExp(r'^(\+?1?)?[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$');
    if (phoneRegExp.hasMatch(text)) return true;
    return false;
  }
}
