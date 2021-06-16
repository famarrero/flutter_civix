import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextField<T> extends StatelessWidget {
  /// [ReactiveTextField] Expecific props;
  final String formControlName;
  final Function()? onSubmitted;
  final ValidationMessagesFunction? validationMessages;
  final bool mandatory; //For showing an Asterisk

  /// [TextField] custom props;
  final String? hint;
  final String? label;
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final bool? obscureText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool expands;

  const CustomReactiveTextField({
    this.onSubmitted,
    required this.formControlName,
    this.validationMessages,
    this.hint,
    this.label,
    this.icon,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.textCapitalization,
    this.obscureText,
    this.mandatory = false,
    this.expands = false,
    this.maxLines,
    this.minLines,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<T>(
      formControlName: formControlName,
      onSubmitted: onSubmitted,
      validationMessages: validationMessages,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      style: const TextStyle(height: 1),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      expands: expands,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          isDense: false,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: mandatory ? '$label *' : label,
          hintText: hint,
          icon: icon != null ? Icon(icon) : null,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon): null,
          // errorStyle: TextStyle(height: 0.3, color: Colors.red, fontWeight: FontWeight.bold)
      ),
    );
  }
}

class CustomReactiveObscureTextField extends StatefulWidget {
  /// [ReactiveTextField] Expecific props;
  final String formControlName;
  final Function()? onSubmitted;
  final ValidationMessagesFunction? validationMessages;

  /// [TextField] custom props;
  final String? hint;
  final String? label;
  final IconData? icon;
  final IconData? prefixIcon;
  final TextInputType textType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Color? backgroundColor;

  const CustomReactiveObscureTextField({
    this.onSubmitted,
    required this.formControlName,
    this.validationMessages,
    this.hint,
    this.label,
    this.icon,
    this.prefixIcon,
    this.backgroundColor,
    this.textType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
  });

  @override
  _CustomReactiveObscureTextFieldState createState() => _CustomReactiveObscureTextFieldState();
}

class _CustomReactiveObscureTextFieldState extends State<CustomReactiveObscureTextField> {
  late bool passwordVisible;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  IconButton getToogleButton() {
    return IconButton(
        icon: Icon(
          // Based on passwordVisible state choose the icon
          passwordVisible ? Icons.visibility : Icons.visibility_off,
          // color: Theme.of(context).primaryColorDark,
        ),
        onPressed: () {
          // Update the state i.e. toogle the state of passwordVisible variable
          setState(() {
            passwordVisible = !passwordVisible;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
        formControlName: widget.formControlName,
        onSubmitted: widget.onSubmitted,
        validationMessages: widget.validationMessages,
        inputFormatters: widget.inputFormatters,
        style: const TextStyle(height: 1),
        keyboardType: widget.textType,
        textInputAction: widget.textInputAction,
        cursorColor: Theme.of(context).primaryColor,
        obscureText: !passwordVisible,
        decoration: InputDecoration(
            isDense: false,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            labelText: widget.label,
            hintText: widget.hint,
            icon: widget.icon != null ? Icon(widget.icon) : null,
            prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
            suffixIcon: getToogleButton(),
            errorStyle: TextStyle(height: 0.3, color: Colors.red, fontWeight: FontWeight.bold)));
  }
}
