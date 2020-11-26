import 'package:flutter/material.dart';

class FieldNames {
  static Map<int, String> _fieldNames = {
    0: "Please enter your name",
    1: "Please enter your age",
    2: "Please enter your monthly salary\nin Rs.",
  };

  static Map<int, IconData> _icons = {
    0: Icons.person,
    1: Icons.person_pin,
    2: Icons.money,
  };

  static Map<int, String> _regex = {
    0: r"^[a-zA-Z\s]*$",
    1: r"[0-9]",
    2: r"[0-9]",
  };

  static Map<int, String> _regexError = {
    0: "Please enter valid name",
    1: "Please enter valid age",
    2: "Please enter valid salary",
  };
  static get fieldName => _fieldNames;
  static get icons => _icons;
  static get regex => _regex;
  static get regexError => _regexError;
}
