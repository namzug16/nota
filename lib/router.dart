import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:nota/src/ui/pages/error_page.dart";
import "package:nota/src/ui/pages/list_note_page.dart";
import "package:nota/src/ui/pages/note_page.dart";

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: Routes.note.path,
    routes: [
      GoRoute(
        path: Routes.note.path,
        pageBuilder: (_, state) => NoTransitionPage<void>(
          child: const NotePage(),
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: Routes.notes.path,
        pageBuilder: (_, state) => NoTransitionPage<void>(
          child: const ListNotePage(),
          key: state.pageKey,
        ),
      ),
    ],
    errorPageBuilder: (_, state) => NoTransitionPage<void>(
      child: const ErrorPage(),
      key: state.pageKey,
    ),
  ),
);

enum Routes {
  note,
  notes;

  static Routes fromPath(String path) {
    if (path == "/") return Routes.note;
    if (path == "/notes") return Routes.notes;
    return Routes.note;
  }

  Routes get otherRoute => this == Routes.note ? Routes.notes : Routes.note;

  String get path {
    switch (this) {
      case Routes.note:
        return "/";
      case Routes.notes:
        return "/notes";
    }
  }

  String get routeName {
    switch (this) {
      case Routes.note:
        return "Note";
      case Routes.notes:
        return "Notes' List";
    }
  }

  IconData get routeIcon {
    switch (this) {
      case Routes.note:
        return Icons.note;
      case Routes.notes:
        return Icons.list;
    }
  }

  static bool contains(String path) {
    if (path == Routes.note.path) return true;
    if (path == Routes.notes.path) return true;
    return false;
  }
}
