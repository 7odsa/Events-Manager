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
    this.maxLines = 1,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool isPassword;
  final int maxLines;
  final void Function(String)? onChanged;

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
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
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
                      (widget.isPassword)
                          ? (isObsecure)
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off)
                          : widget.suffixIcon,
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
