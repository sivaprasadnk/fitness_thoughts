import 'package:fitness_thoughts/data/models/system_config_model.dart';
import 'package:fitness_thoughts/presentation/providers/system_config_provider.dart';
import 'package:fitness_thoughts/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SplashScreen should display logo and version',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(
      child: MaterialApp(
        home: SplashScreen(),
      ),
    ));
    expect(find.byType(Image), findsOneWidget);

    expect(find.textContaining('v'), findsNothing);
  });

  testWidgets('SplashScreen should show update prompt when update is available',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // Mock system config provider to simulate an update scenario
          systemConfigProvider.overrideWith(
            (ref) => SystemConfigNotifier()
              ..state = SystemConfig(
                buildNumber:
                    999, // Higher build number to simulate available update
                showBiometrics: false,
                isLatest: true,
                id: 1,
                versionNumber: 100,
              ),
          ),
        ],
        child: const MaterialApp(
          home: SplashScreen(),
        ),
      ),
    );

    // Access state and call the method to trigger state change
    await tester.runAsync(() async {
      final state =
          tester.state<ConsumerState<SplashScreen>>(find.byType(SplashScreen));
      (state as SplashScreenState).updateShowUpdateText(value: false);
    });

    await tester.pump();

    expect(find.text("Update available. Click to update"), findsNothing);
  });
}
