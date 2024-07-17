import 'package:flutter/material.dart';
import '../theme/theme_helper.dart';

extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillPurple => BoxDecoration(
        color: appTheme.purple40001,
        borderRadius: BorderRadius.circular(19),
      );

  static BoxDecoration get fillPurpleTL2 => BoxDecoration(
        color: appTheme.purple40001,
        borderRadius: BorderRadius.circular(2),
      );
}

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;

  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center, child: iconButtonWidget)
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: appTheme.pink10001.withOpacity(0.76),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(4, 0),
                    )
                  ],
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}
