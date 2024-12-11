import 'package:flutter/material.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

bool isMobileView(context) {
  if (screenWidth(context) > 1200) {
    return false;
  } else {
    return true;
  }
}
