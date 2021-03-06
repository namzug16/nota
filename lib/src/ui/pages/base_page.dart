import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:go_router/go_router.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:nota/router.dart";
import "package:nota/src/core/notes_provider.dart";
import "package:nota/src/core/store_provider.dart";
import "package:nota/src/ui/theme/theme.dart";
import "package:nota/src/ui/widgets/colored_button.dart";
import "package:oxidized/oxidized.dart";
import "package:url_launcher/url_launcher.dart";

class BasePage extends ConsumerWidget {
  const BasePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    final router = ref.watch(routerProvider);

    final route = Routes.fromPath(router.location).otherRoute;

    final notes = ref.watch(notesProvider);

    final notesNotifier = ref.watch(notesProvider.notifier);

    final mediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: theme.safeUnwrap.primary,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: mediaQueryHeight < 650 ? 800 : mediaQueryHeight,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Center(
                      child: Text(
                        "Nota",
                        style: GoogleFonts.playfairDisplay(
                          color: theme.safeUnwrap.secondary,
                          fontSize: 60,
                        ),
                      ),
                    ),
                    ColoredButton(
                      icon: Icons.brightness_4_outlined,
                      onPressed: () => ref.watch(themeProvider.notifier).update(
                        (state) {
                          ref.watch(storeProvider).when(
                                some: (data) {
                                  data.setString(
                                    "nota_theme",
                                    state.safeUnwrap.other.name,
                                  );
                                },
                                none: () {},
                              );
                          return Some(state.safeUnwrap.other);
                        },
                      ),
                      toolTip: "Change to ${theme.safeUnwrap.other.name} theme",
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ColoredButton(
                        icon: FontAwesomeIcons.info,
                        onPressed: () async {
                          await showDialog<void>(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: theme.safeUnwrap.primary,
                                child: SizedBox.square(
                                  dimension: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Nota",
                                            style: GoogleFonts.playfairDisplay(
                                              color: theme.safeUnwrap.secondary,
                                              fontSize: 40,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            // ignore: lines_longer_than_80_chars
                                            "Most minimalist and simple open source note taking web app",
                                            style: GoogleFonts.playfairDisplay(
                                              color: theme.safeUnwrap.secondary,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            "Made with ?????? and Flutter",
                                            style: GoogleFonts.playfairDisplay(
                                              color: theme.safeUnwrap.secondary,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          const _GithubProjectButton(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        toolTip: "Info",
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: child,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _GithubProjectButton(),
                    if (notes.length > 1)
                      ColoredButton(
                        icon: route.routeIcon,
                        onPressed: () => context.go(route.path),
                        toolTip: route.routeName,
                      )
                    else
                      const SizedBox(),
                    ColoredButton(
                      icon: Icons.note_add_outlined,
                      onPressed: () {
                        notesNotifier.addNote();
                        context.go(Routes.note.path);
                      },
                      toolTip: "New note",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GithubProjectButton extends StatelessWidget {
  // ignore: use_super_parameters
  const _GithubProjectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredButton(
      icon: FontAwesomeIcons.githubAlt,
      onPressed: () => launchUrl(Uri.parse("https://github.com/namzug16/nota")),
      toolTip: "Github project",
    );
  }
}
