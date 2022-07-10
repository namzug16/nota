import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:nota/src/ui/pages/base_page.dart";
import "package:nota/src/ui/theme/theme.dart";
import "package:nota/src/ui/widgets/colored_button.dart";

class ErrorPage extends ConsumerWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return BasePage(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              child: Text(
                "404",
                style: GoogleFonts.playfairDisplay(
                  color: theme.safeUnwrap.secondary,
                  fontSize: 300,
                ),
              ),
            ),
            Text(
              "Page not found",
              style: GoogleFonts.playfairDisplay(
                color: theme.safeUnwrap.secondary,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ColoredButton(
              icon: Icons.home_outlined,
              onPressed: () => context.go("/"),
              toolTip: "Home",
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
