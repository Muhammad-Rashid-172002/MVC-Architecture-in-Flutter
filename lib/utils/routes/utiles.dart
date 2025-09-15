import 'package:flutter/material.dart';

class Utiles {
  static void fieldFocus(
    BuildContext context,
    FocusNode currentNode,
    FocusNode nextFocuse,
  ) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocuse);
  }
}
