// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

/// App-wide [TextStyle] constants
///
/// These values correspond with Kimball Clark's design guides and should be
/// used throughout the app whenever picking a [TextStyle].
///
/// There are two main fonts: Metropolis and Montserrat.
/// The text styles are sorted by font and then by sizing.
///

/////////////////////////////// METROPOLIS FONTS ///////////////////////////////
/// Metropolis Light
const TextStyle MEL = TextStyle(
  fontFamily: "Metropolis",
  fontWeight: FontWeight.w100,
);

/// Metropolis Regular
const TextStyle MER = TextStyle(
  fontFamily: "Metropolis",
  fontWeight: FontWeight.w300,
);

/// Metropolis Medium
const TextStyle MEM = TextStyle(
  fontFamily: "Metropolis",
  fontWeight: FontWeight.w400,
);

/// Metropolis Semi Bold
const TextStyle MES = TextStyle(
  fontFamily: "Metropolis",
  fontWeight: FontWeight.w600,
);

/// Metropolis Bold
const TextStyle MEB = TextStyle(
  fontFamily: "Metropolis",
  fontWeight: FontWeight.bold,
);

/////////////////////////////// MONTSERRAT FONTS ///////////////////////////////
/// Montserrat Light
const TextStyle MOL = TextStyle(
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w100,
);

/// Montserrat Regular
const TextStyle MOR = TextStyle(
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w300,
);

/// Montserrat Medium
const TextStyle MOM = TextStyle(
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w400,
);

/// Montserrat Semi Bold
const TextStyle MOS = TextStyle(
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w600,
);

/// Montserrat Bold
const TextStyle MOB = TextStyle(
  fontFamily: "Montserrat",
  fontWeight: FontWeight.bold,
);
