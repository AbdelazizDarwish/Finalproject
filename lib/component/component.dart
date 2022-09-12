import 'package:flutter/material.dart';

Widget TextfieldWidget(
        {required TextEditingController controller,
        required TextInputType keyboardType,
        FormFieldValidator? validator,
        required String label,
        String? hint,
        bool? obsecureText,
        bool ispassword = false,
        IconData? prefix,
        IconData? suffixIcon,
        Function? d,
        Function? suffixPressed}) =>
    TextFormField(
      controller: controller,
      onChanged: (value) {
        d;
      },
      keyboardType: keyboardType,
      validator: validator,
      obscureText: ispassword,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(suffixIcon))
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          //   borderSide: BorderSide(color: kSecondaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          //   borderSide: BorderSide(color: kSecondaryColor),
        ),
        contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      ),
    );

Widget TextButtonWidget(
        {required String texts,
        Color? textColor,
        Color? colorme,
        Color? splashColor,
        double? borderRadius,
        double? minWidth,
        double? height,
        Color? borderSideColor,
        TextStyle? style,
        GestureTapCallback? onPressed,
        Widget? leadingIcon,
        Widget? trailingIcon}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        texts,
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Color.fromRGBO(254, 114, 76, 0.2)),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(colorme),
      ),
    );

// for grey buttons
Widget TextButtonWidgetGrey(
        {required String texts,
        Color? textColor,
        Color? colorme,
        Color? splashColor,
        double? borderRadius,
        double? minWidth,
        double? height,
        Color? borderSideColor,
        TextStyle? style,
        GestureTapCallback? onPressed,
        Widget? leadingIcon,
        Widget? trailingIcon}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        texts,
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.grey),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(colorme),
      ),
    );
