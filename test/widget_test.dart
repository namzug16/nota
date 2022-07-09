import "package:flutter_test/flutter_test.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:nota/src/core/notes_provider.dart";

void main() {
  group("Notes Controller Tests", () {
    ProviderContainer getContainer() {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      return container;
    }

    test("Check Initial State", () {
      final container = getContainer();

      final notes = container.read(notesProvider);

      expect(notes.length, 1);
      expect(notes.first.length, 0);
    });

    test("Check Initial State then update first note", () {
      final container = getContainer();

      List<String> notes() => container.read(notesProvider);
      final notesNotifier = container.read(notesProvider.notifier);

      expect(notes().length, 1);
      expect(notes().first, "");

      notesNotifier.updateNote("one", 0);

      expect(notes().length, 1);
      expect(notes().first, "one");

    });

    test("Check Initial State then update first note then add new note", () {
      final container = getContainer();

      List<String> notes() => container.read(notesProvider);
      final notesNotifier = container.read(notesProvider.notifier);

      expect(notes().length, 1);
      expect(notes().first, "");

      notesNotifier.updateNote("one", 0);

      expect(notes().length, 1);
      expect(notes().first, "one");

      notesNotifier.addNote();

      expect(notes().length, 2);
      expect(notes().first, "");

    });

    test("Check Initial State then update first note then add new note then modify new note", () {
      final container = getContainer();

      List<String> notes() => container.read(notesProvider);
      final notesNotifier = container.read(notesProvider.notifier);

      expect(notes().length, 1);
      expect(notes().first, "");

      notesNotifier.updateNote("one", 0);

      expect(notes().length, 1);
      expect(notes().first, "one");

      notesNotifier.addNote();

      expect(notes().length, 2);
      expect(notes().first, "");

      notesNotifier.updateNote("two", 0);

      expect(notes().length, 2);
      expect(notes().first, "two");

    });

    test("Check Initial State then update first note then add new note then modify new note then change order of notes", () {
      final container = getContainer();

      List<String> notes() => container.read(notesProvider);
      final notesNotifier = container.read(notesProvider.notifier);

      expect(notes().length, 1);
      expect(notes().first, "");

      notesNotifier.updateNote("one", 0);

      expect(notes().length, 1);
      expect(notes().first, "one");

      notesNotifier.addNote();

      expect(notes().length, 2);
      expect(notes().first, "");

      notesNotifier.updateNote("two", 0);

      expect(notes().length, 2);
      expect(notes().first, "two");
      expect(notes().last, "one");

      final note2 = notes()[1];

      notesNotifier.updateNote(note2, 1);

      expect(notes().length, 2);
      expect(notes().first, "one");
      expect(notes().last, "two");

    });

    test("Check Initial State then update first note then add new note then modify new note then change order of notes then delete second note", () {
      final container = getContainer();

      List<String> notes() => container.read(notesProvider);
      final notesNotifier = container.read(notesProvider.notifier);

      expect(notes().length, 1);
      expect(notes().first, "");

      notesNotifier.updateNote("one", 0);

      expect(notes().length, 1);
      expect(notes().first, "one");

      notesNotifier.addNote();

      expect(notes().length, 2);
      expect(notes().first, "");

      notesNotifier.updateNote("two", 0);

      expect(notes().length, 2);
      expect(notes().first, "two");
      expect(notes().last, "one");

      final note2 = notes()[1];

      notesNotifier.updateNote(note2, 1);

      expect(notes().length, 2);
      expect(notes().first, "one");
      expect(notes().last, "two");

      notesNotifier.deleteNote(1);

      expect(notes().length, 1);
      expect(notes().first, "one");

    });

    test("Check Initial State then update first note then add new note then modify new note then change order of notes then delete second note", () {
      final container = getContainer();

      List<String> notes() => container.read(notesProvider);
      final notesNotifier = container.read(notesProvider.notifier);

      expect(notes().length, 1);
      expect(notes().first, "");

      notesNotifier.updateNote("one", 0);

      expect(notes().length, 1);
      expect(notes().first, "one");

      notesNotifier.addNote();

      expect(notes().length, 2);
      expect(notes().first, "");

      notesNotifier.updateNote("two", 0);

      expect(notes().length, 2);
      expect(notes().first, "two");
      expect(notes().last, "one");

      final note2 = notes()[1];

      notesNotifier.updateNote(note2, 1);

      expect(notes().length, 2);
      expect(notes().first, "one");
      expect(notes().last, "two");

      notesNotifier.deleteNote(1);

      expect(notes().length, 1);
      expect(notes().first, "one");

    });

  });
}
