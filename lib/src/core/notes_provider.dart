import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:nota/src/core/store_provider.dart";
import 'package:oxidized/oxidized.dart';

final notesProvider = StateNotifierProvider<NotesController, List<String>>(
  NotesController.new,
);

const _key = "nota_data";

class NotesController extends StateNotifier<List<String>> {
  NotesController(this.ref) : super([""]) {
    ref.watch(storeProvider).when(
          some: (data) {
            final notes = data.getStringList(_key);
            if (notes != null) {
              state = notes;
            } else {
              data.setStringList(_key, state);
            }
          },
          none: () {},
        );
  }

  final StateNotifierProviderRef<NotesController, List<String>> ref;

  void addNote() {
    state.removeWhere((element) => element.isEmpty);

    state = ["", ...state];
    ref.read(storeProvider).when(
          some: (data) {
            data.setStringList(_key, state);
          },
          none: () {},
        );
  }

  void updateNote(String note, int index) {
    state = [
      note,
      ...state.take(index),
      ...state.skip(index + 1),
    ];
    ref.read(storeProvider).when(
          some: (data) {
            data.setStringList(_key, state);
          },
          none: () {},
        );
  }

  void deleteNote(int index) {
    state = [
      ...state.take(index),
      ...state.skip(index + 1),
    ];
    if (state.isEmpty) state = [""];
    ref.read(storeProvider).when(
          some: (data) {
            data.setStringList(_key, state);
          },
          none: () {},
        );
  }
}
