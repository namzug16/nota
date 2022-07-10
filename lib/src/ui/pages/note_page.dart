import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:nota/src/core/notes_provider.dart";
import "package:nota/src/core/store_provider.dart";
import "package:nota/src/ui/pages/base_page.dart";
import "package:nota/src/ui/theme/theme.dart";

class NotePage extends HookConsumerWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);

    final theme = ref.watch(themeProvider);

    final textController = useTextEditingController(text: notes.first);

    ref.listen(storeProvider, (_, __) {
      textController.text = notes.first;
    });

    useEffect(
      () {
        textController.text = notes.first;
        return null;
      },
      [notes.length],
    );

    useEffect(
      () {
        if (notes.first.isEmpty) {
          textController.text = notes.first;
        }
        return null;
      },
      [notes.first],
    );

    return BasePage(
      child: Column(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              expands: true,
              maxLines: null,
              cursorColor: theme.safeUnwrap.secondary,
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.safeUnwrap.secondary.withOpacity(0.1),
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
                focusColor: theme.safeUnwrap.secondary,
              ),
              style: TextStyle(
                color: theme.safeUnwrap.secondary,
              ),
              onChanged: (text) =>
                  ref.watch(notesProvider.notifier).updateNote(text, 0),
            ),
          ),
        ],
      ),
    );
  }
}
