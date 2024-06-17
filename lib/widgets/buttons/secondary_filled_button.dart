import 'package:flutter/material.dart';

import '../../utils/color_palette.dart';

class SecondaryFilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Clip? clipBehavior;
  final WidgetStatesController? statesController;
  final Widget child;
  final Widget? icon;

  static final ButtonStyle _defaultSecondaryButtonStyle = FilledButton.styleFrom(
      foregroundColor: ColorPalette.textColor,
      backgroundColor: ColorPalette.secondaryColor,
      textStyle: const TextStyle(
          fontFamily: 'Sharp Grotesk',
          fontWeight: FontWeight.normal,
          fontSize: 12
      )
  );

  const SecondaryFilledButton({
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus,
    this.clipBehavior,
    this.statesController,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle effectiveStyle = style ?? _defaultSecondaryButtonStyle;
    if (icon != null) {
      return FilledButton.icon(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: effectiveStyle,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        statesController: statesController,
        icon: icon!,
        label: child,
      );
    } else {
      return FilledButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: effectiveStyle,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        statesController: statesController,
        child: child,
      );
    }
  }
}
