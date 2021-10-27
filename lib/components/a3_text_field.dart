import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_3_astronautas/config/config.dart';

class A3TextField extends StatelessWidget {
  A3TextField({
    Key key,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
    this.onChanged,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
    this.textInputFormatters,
    this.autovalidateMode,
    this.isAutocorrectActive = true,
    this.autofocus = false,
    this.helperText,
    this.width,
  });

  final String hintText;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final GestureTapCallback onTap;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter> textInputFormatters;
  final AutovalidateMode autovalidateMode;
  final String Function(String value) validator;
  final bool isAutocorrectActive;
  final TextEditingController controller;
  final bool autofocus;
  final String helperText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 160,
      child: TextFormField(
        autofocus: autofocus,
        controller: controller,
        key: key,
        validator: validator,
        autovalidateMode: autovalidateMode,
        keyboardAppearance: Brightness.light,
        textCapitalization: textCapitalization,
        autocorrect: isAutocorrectActive,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          helperText: helperText,
          filled: false,
          hintText: hintText,
          hintStyle: Styles.hintStyle,
          helperStyle: Styles.helperStyle,
        ),
        inputFormatters: textInputFormatters,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }
}
