import 'package:flutter/material.dart';
import 'package:jira_for_mobile/Core%20Component/text/focused_label.dart';

class AppFormField extends StatelessWidget {
  final String initialValue;
  final ValueChanged<String> onChanged;
  final String hint;
  final String label;
  final TextStyle hintStyle;
  final int maxLines;
  final TextInputType inputType;
  final EdgeInsets padding;
  final bool enabled;
  final VoidCallback onTap;
  final bool obscureText;
  final bool autoFocus;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> fieldSubmitted;
  final bool hasBorder;
  final bool autoValidate;
  final Color boarderColor;
  final FontWeight fontWeight;
  final double contentPaddingHor;
  const AppFormField(
      {Key key,
      this.initialValue,
      this.onChanged,
      this.autoFocus,
      this.hint,
      this.label,
      this.maxLines,
      this.hintStyle,
      this.inputType,
      this.enabled,
      this.obscureText = false,
      this.onTap,
      this.suffixIcon,
      this.validator,
      this.controller,
      this.textCapitalization,
      this.padding,
      this.fieldSubmitted,
      this.textInputAction,
      this.hasBorder,
      this.autoValidate,
      this.boarderColor,
      this.fontWeight,
      this.contentPaddingHor,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool applyBorder = hasBorder != null ? hasBorder : true;
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          label != null
              ? Padding(
                  padding: EdgeInsets.all(4),
                  child: FormFieldLabelText(
                    label: label,
                  ))
              : Container(),
          TextFormField(
            style: TextStyle(
              fontFamily: 'Montserrat',
              letterSpacing: 0.5,
              fontStyle: FontStyle.normal,
              fontWeight: fontWeight != null ? fontWeight : FontWeight.w500,
            ),
            initialValue: initialValue,
            onChanged: (val) {
              onChanged(val);
            },
            controller: controller,
            onTap: onTap,
            autofocus: autoFocus ?? false,
            textInputAction: textInputAction ?? TextInputAction.done,
            onFieldSubmitted: fieldSubmitted,
            validator: validator,
            obscureText: obscureText,
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            enabled: enabled,
            autovalidateMode: autoValidate != null
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            keyboardType: inputType,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
                prefixIcon: prefixIcon,
                contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal:
                        contentPaddingHor != null ? contentPaddingHor : 12),
                hintText: hint,
                suffixIcon: suffixIcon,
                hintStyle: hintStyle ??
                    TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.5,
                        fontStyle: FontStyle.normal,
                        fontWeight:
                            fontWeight != null ? fontWeight : FontWeight.w500,
                        height: 1.28,
                        color: Theme.of(context).hintColor),
                border: applyBorder
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(
                            width: 1.0, color: Theme.of(context).hintColor))
                    : InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.0, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(28))),
          )
        ],
      ),
    );
  }
}
