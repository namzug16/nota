import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:nota/router.dart";
import "package:nota/src/core/store_provider.dart";
import "package:oxidized/oxidized.dart";
import "package:shared_preferences/shared_preferences.dart";

void main() {
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(
    const ProviderScope(
      child: Nota(),
    ),
  );
}

class Nota extends ConsumerWidget {
  const Nota({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    final storeNotifier = ref.watch(storeProvider.notifier);

    return MaterialApp.router(
      title: "Nota",
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      builder: (context, child) => FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              storeNotifier
                  .update((_) => Some(snapshot.data! as SharedPreferences));
            });
          }
          return child ?? const SizedBox();
        },
      ),
    );
  }
}
