import 'package:events_manager/utils.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.isPassword,
  });

  final TextEditingController controller;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObsecure;
  @override
  void initState() {
    isObsecure = widget.isPassword;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 4),
        ),
        // enabled: false
        hintText: widget.hintText,
        hintStyle: TextStyle(color: gray, fontWeight: FontWeight.bold),
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            (widget.isPassword)
                ? InkWell(
                  child:
                      (isObsecure)
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                  onTap: () {
                    isObsecure = !isObsecure;
                    setState(() {});
                  },
                )
                : widget.suffixIcon,
      ),
      obscureText: isObsecure,
    );
  }
}
