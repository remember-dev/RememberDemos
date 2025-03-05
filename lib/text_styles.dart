// ignore_for_file: ant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:remember_demos/main.dart';

void fontListener() {
  lightPrimary = TextStyle(
    fontFamily: primaryFontNotifier.value,
    fontWeight: FontWeight.w300,
  );
  regularPrimary = TextStyle(
    fontFamily: primaryFontNotifier.value,
    fontWeight: FontWeight.w400,
  );
  mediumPrimary = TextStyle(
    fontFamily: primaryFontNotifier.value,
    fontWeight: FontWeight.w500,
  );
  semiBoldPrimary = TextStyle(
    fontFamily: primaryFontNotifier.value,
    fontWeight: FontWeight.w600,
  );
  boldPrimary = TextStyle(
    fontFamily: primaryFontNotifier.value,
    fontWeight: FontWeight.w700,
  );
  lightSecondary = TextStyle(
    fontFamily: secondaryFontNotifier.value,
    fontWeight: FontWeight.w300,
  );
  regularSecondary = TextStyle(
    fontFamily: secondaryFontNotifier.value,
    fontWeight: FontWeight.w400,
  );
  mediumSecondary = TextStyle(
    fontFamily: secondaryFontNotifier.value,
    fontWeight: FontWeight.w500,
  );
  semiBoldSecondary = TextStyle(
    fontFamily: secondaryFontNotifier.value,
    fontWeight: FontWeight.w600,
  );
  boldSecondary = TextStyle(
    fontFamily: secondaryFontNotifier.value,
    fontWeight: FontWeight.w700,
  );
}

TextStyle lightPrimary = TextStyle(
  fontFamily: primaryFontNotifier.value,
  fontWeight: FontWeight.w300,
);
TextStyle regularPrimary = TextStyle(
  fontFamily: primaryFontNotifier.value,
  fontWeight: FontWeight.w400,
);
TextStyle mediumPrimary = TextStyle(
  fontFamily: primaryFontNotifier.value,
  fontWeight: FontWeight.w500,
);
TextStyle semiBoldPrimary = TextStyle(
  fontFamily: primaryFontNotifier.value,
  fontWeight: FontWeight.w600,
);
TextStyle boldPrimary = TextStyle(
  fontFamily: primaryFontNotifier.value,
  fontWeight: FontWeight.w700,
);
TextStyle lightSecondary = TextStyle(
  fontFamily: secondaryFontNotifier.value,
  fontWeight: FontWeight.w300,
);
TextStyle regularSecondary = TextStyle(
  fontFamily: secondaryFontNotifier.value,
  fontWeight: FontWeight.w400,
);
TextStyle mediumSecondary = TextStyle(
  fontFamily: secondaryFontNotifier.value,
  fontWeight: FontWeight.w500,
);
TextStyle semiBoldSecondary = TextStyle(
  fontFamily: secondaryFontNotifier.value,
  fontWeight: FontWeight.w600,
);
TextStyle boldSecondary = TextStyle(
  fontFamily: secondaryFontNotifier.value,
  fontWeight: FontWeight.w700,
);

/////////////////////////////// METROPOLIS FONTS ///////////////////////////////
// /// Metropolis Light
// TextStyle MEL = TextStyle(
//   fontFamily: "Metropolis",
//   fontWeight: FontWeight.w100,
// );
// /// Metropolis Regular
// TextStyle MER = TextStyle(
//   fontFamily: "Metropolis",
//   fontWeight: FontWeight.w300,
// );
// /// Metropolis Medium
// TextStyle MEM = TextStyle(
//   fontFamily: "Metropolis",
//   fontWeight: FontWeight.w400,
// );
// /// Metropolis Semi Bold
// TextStyle MES = TextStyle(
//   fontFamily: "Metropolis",
//   fontWeight: FontWeight.w600,
// );
// /// Metropolis Bold
// TextStyle MEB = TextStyle(
//   fontFamily: "Metropolis",
//   fontWeight: FontWeight.bold,
// );

/////////////////////////////// MONTSERRAT FONTS ///////////////////////////////
// /// Montserrat Light
// TextStyle MOL = TextStyle(
//   fontFamily: "Montserrat",
//   fontWeight: FontWeight.w100,
// );
// /// Montserrat Regular
// TextStyle MOR = TextStyle(
//   fontFamily: "Montserrat",
//   fontWeight: FontWeight.w300,
// );
// /// Montserrat Medium
// TextStyle MOM = TextStyle(
//   fontFamily: "Montserrat",
//   fontWeight: FontWeight.w400,
// );
// /// Montserrat Semi Bold
// TextStyle MOS = TextStyle(
//   fontFamily: "Montserrat",
//   fontWeight: FontWeight.w600,
// );
// /// Montserrat Bold
// TextStyle MOB = TextStyle(
//   fontFamily: "Montserrat",
//   fontWeight: FontWeight.bold,
// );

/////////////////////////////// QUICKSAND FONTS ///////////////////////////////
// /// Quicksand Light
// TextStyle QL = TextStyle(
//   fontFamily: "Quicksand",
//   fontWeight: FontWeight.w100,
// );
// /// Quicksand Regular
// TextStyle QR = TextStyle(
//   fontFamily: "Quicksand",
//   fontWeight: FontWeight.w300,
// );
// /// Quicksand Medium
// TextStyle QM = TextStyle(
//   fontFamily: "Quicksand",
//   fontWeight: FontWeight.w400,
// );
// /// Quicksand Semi Bold
// TextStyle QS = TextStyle(
//   fontFamily: "Quicksand",
//   fontWeight: FontWeight.w600,
// );
// /// Quicksand Bold
// TextStyle QB = TextStyle(
//   fontFamily: "Quicksand",
//   fontWeight: FontWeight.bold,
// );

/////////////////////////////// LORA FONTS ///////////////////////////////
// /// Lora Light
// TextStyle LL = TextStyle(
//   fontFamily: "Lora",
//   fontWeight: FontWeight.w100,
// );
// /// Lora Regular
// TextStyle LR = TextStyle(
//   fontFamily: "Lora",
//   fontWeight: FontWeight.w300,
// );
// /// Lora Medium
// TextStyle LM = TextStyle(
//   fontFamily: "Lora",
//   fontWeight: FontWeight.w400,
// );
// /// Lora Semi Bold
// TextStyle LS = TextStyle(
//   fontFamily: "Lora",
//   fontWeight: FontWeight.w600,
// );
// /// Lora Bold
// TextStyle LB = TextStyle(
//   fontFamily: "Lora",
//   fontWeight: FontWeight.bold,
// );

/////////////////////////////// NUNITO FONTS ///////////////////////////////
// /// Nunito Light
// TextStyle NL = TextStyle(
//   fontFamily: "Nunito",
//   fontWeight: FontWeight.w100,
// );
// /// Nunito Regular
// TextStyle NR = TextStyle(
//   fontFamily: "Nunito",
//   fontWeight: FontWeight.w300,
// );
// /// Nunito Medium
// TextStyle NM = TextStyle(
//   fontFamily: "Nunito",
//   fontWeight: FontWeight.w400,
// );
// /// Nunito Semi Bold
// TextStyle NS = TextStyle(
//   fontFamily: "Nunito",
//   fontWeight: FontWeight.w600,
// );
// /// Nunito Bold
// TextStyle NB = TextStyle(
//   fontFamily: "Nunito",
//   fontWeight: FontWeight.bold,
// );
