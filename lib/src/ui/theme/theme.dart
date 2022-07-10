import "dart:ui";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:nota/src/core/store_provider.dart";

final themeProvider = StateProvider<NotaTheme>(
  (ref) => ref.watch(storeProvider).when<NotaTheme>(
        some: (data) {
          final theme = data.getString("nota_theme");
          if (theme != null) {
            return NotaTheme.fromName(theme);
          } else {
            data.setString("nota_theme", NotaTheme.dark.name);
            return NotaTheme.dark;
          }
        },
        none: () => NotaTheme.dark,
      ),
);

enum NotaTheme {
  light,
  dark;

  static NotaTheme fromName(String name) {
    return NotaTheme.values.firstWhere(
      (element) => element.toString() == name,
      orElse: () => NotaTheme.dark,
    );
  }

  Color get primary {
    switch (this) {
      case NotaTheme.light:
        return _white;
      case NotaTheme.dark:
        return _black;
    }
  }

  Color get secondary {
    switch (this) {
      case NotaTheme.light:
        return _black;
      case NotaTheme.dark:
        return _white;
    }
  }

  NotaTheme get other {
    switch (this) {
      case NotaTheme.light:
        return NotaTheme.dark;
      case NotaTheme.dark:
        return NotaTheme.light;
    }
  }

  String get name {
    switch (this) {
      case NotaTheme.light:
        return "Light";
      case NotaTheme.dark:
        return "Dark";
    }
  }

  // ignore: avoid_positional_boolean_parameters
  NotaTheme isInverted(bool inverted) {
    return inverted ? other : this;
  }
}

const _white = Color(0xFFF5F5F5);
const _black = Color(0xFF232323);
