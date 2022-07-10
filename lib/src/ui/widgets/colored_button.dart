import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:nota/src/ui/theme/theme.dart";

class ColoredButton extends HookConsumerWidget {
  const ColoredButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.toolTip,
    this.inverted = false,
  });

  final IconData icon;
  final String toolTip;
  final void Function() onPressed;
  final bool inverted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    final isHovering = useState<bool>(false);

    final _theme = isHovering.value
        ? theme.safeUnwrap.other.isInverted(inverted)
        : theme.safeUnwrap.isInverted(inverted);

    return MouseRegion(
      onEnter: (_) => isHovering.value = true,
      onExit: (_) => isHovering.value = false,
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Tooltip(
          waitDuration: const Duration(milliseconds: 600),
          message: toolTip,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: isHovering.value
                  ? BorderSide(
                      color: _theme.primary,
                      width: 2,
                    )
                  : BorderSide.none,
            ),
            elevation: 0,
            color: _theme.secondary,
            child: SizedBox.square(
              dimension: 40,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  child: Icon(
                    icon,
                    color: _theme.primary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
