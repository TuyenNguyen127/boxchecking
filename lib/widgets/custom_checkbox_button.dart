import 'package:flutter/material.dart';
import '../core/app_export.dart';

// ignore: must_be_immutable
class CustomCheckboxButton extends StatelessWidget {
  CustomCheckboxButton({
    Key? key,
    required this.onChange,
    this.decoration,
    this.alignment,
    this.isRightCheck,
    this.iconSize,
    this.value,
    this.text1,
    this.color1,
    this.text2,
    this.color2,
    this.text3,
    this.color3,
    this.width,
    this.padding,
    this.textStyle,
    this.textAlignment,
    this.isExpandedText = false,
  }) : super(
          key: key,
        );

  final BoxDecoration? decoration;

  final Alignment? alignment;

  final bool? isRightCheck;

  final double? iconSize;

  bool? value;

  final Function(bool) onChange;

  final String? text1;
  final int? color1;

  final String? text2;
  final int? color2;

  final String? text3;
  final int? color3;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final TextStyle? textStyle;

  final TextAlign? textAlignment;

  final bool isExpandedText;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildCheckBoxWidget,
          )
        : buildCheckBoxWidget;
  }

  Widget get buildCheckBoxWidget => InkWell(
        onTap: () {
          value = !(value!);
          onChange(value!);
        },
        child: Container(
          decoration: decoration,
          width: width,
          child: (isRightCheck ?? false) ? rightSideCheckbox : leftSideCheckbox,
        ),
      );

  Widget get leftSideCheckbox => Row(
        children: [
          Padding(
            child: checkboxWidget,
            padding: EdgeInsets.only(right: 8),
          ),
          isExpandedText ? Expanded(child: textWidget) : textWidget,
        ],
      );

  Widget get rightSideCheckbox => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isExpandedText ? Expanded(child: textWidget) : textWidget,
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: checkboxWidget,
          ),
        ],
      );

  Widget get textWidget => RichText(
        text: TextSpan(
          text: '${text1!} ',
          style: TextStyle(color: Color(color1!)),
          children: <TextSpan>[
            TextSpan(
              text: '${text2!} ',
              style: TextStyle(color: Color(color2!)),
            ),
            TextSpan(
              text: '${text3!} ',
              style: TextStyle(color: Color(color3!)),
            ),
          ],
        ),
      );

  // Widget get textWidget => Text(
  //       text1 ?? "",
  //       textAlign: textAlignment ?? TextAlign.center,
  //       style: textStyle ?? CustomTextStyles.titleMediumBlack900Medium,
  //     );

  Widget get checkboxWidget => Container(
        height: iconSize ?? 22.h,
        width: iconSize ?? 22.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.v,
            color: Color(0xff309cff),
          ),
        ),
        child: value ?? false
            ? Center(
                child: Icon(
                  Icons.check,
                  size: iconSize ?? 18.h,
                  color: Color(0xff309cff),
                ),
              )
            : null,

        // child: Checkbox(
        //   visualDensity: VisualDensity(
        //     vertical: -4,
        //     horizontal: -4,
        //   ),
        //   value: value ?? false,
        //   checkColor: theme.colorScheme.primary,
        //   onChanged: (value) {
        //     onChange(value!);
        //   },
        // ),
      );
}
