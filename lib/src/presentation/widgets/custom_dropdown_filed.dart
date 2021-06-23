import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef SyncLoadFunction<T> = List<T> Function();
typedef ItemBuilder<T> = Widget Function(T item);

class CustomDropdownFiled<T> extends StatelessWidget {
  final String formControlName;
  final SyncLoadFunction<T> loadFunction;
  final ItemBuilder<T> itemBuilder;
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool mandatory;
  final String? label;
  final String? hint;
  final ValidationMessagesFunction? validationMessages;
  final Function()? onTap;
  final Function(T?)? onChange;

  const CustomDropdownFiled({
    Key? key,
    required this.formControlName,
    required this.loadFunction,
    required this.itemBuilder,
    this.icon,
    this.suffixIcon,
    this.prefixIcon,
    this.mandatory = false,
    this.label,
    this.hint,
    this.validationMessages,
    this.onTap,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveDropdownField<T>(
      onChanged: onChange,
      validationMessages: validationMessages,
      decoration: InputDecoration(
          isDense: false,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: mandatory ? '$label *' : label,
          hintText: hint,
          icon: icon != null ? Icon(icon) : null,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          // errorStyle: TextStyle(height: 0.3, color: Colors.red, fontWeight: FontWeight.bold)
      ),
      formControlName: formControlName,
      onTap: onTap,
      items: loadFunction()
          .map((e) => DropdownMenuItem<T>(
                value: e,
                child: Container(child: itemBuilder(e)),
              ))
          .toList(),
    );
  }
}
