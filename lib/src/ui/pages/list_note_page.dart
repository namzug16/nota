import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:nota/router.dart";
import "package:nota/src/core/notes_provider.dart";
import "package:nota/src/ui/pages/base_page.dart";
import "package:nota/src/ui/theme/theme.dart";
import "package:nota/src/ui/widgets/colored_button.dart";

class ListNotePage extends ConsumerWidget {
  const ListNotePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);

    final theme = ref.watch(themeProvider);

    return BasePage(
      child: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return InkWell(
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              ref.watch(notesProvider.notifier).updateNote(note, index);
              context.go(Routes.note.path);
            },
            child: Card(
              color: theme.secondary,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        note,
                        style: TextStyle(
                          color: theme.primary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    ColoredButton(
                      icon: Icons.delete_outline_rounded,
                      onPressed: () =>
                          ref.watch(notesProvider.notifier).deleteNote(index),
                      toolTip: "Delete note",
                      inverted: true,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
