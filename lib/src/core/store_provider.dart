import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:oxidized/oxidized.dart";
import "package:shared_preferences/shared_preferences.dart";

final storeProvider = StateProvider<Option<SharedPreferences>>(
  (_) => const None(),
);
