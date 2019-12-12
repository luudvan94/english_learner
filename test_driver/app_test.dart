import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:screenshots/screenshots.dart';

void main() {
  group('English Learner', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

  final config = Config();
    // test("Word List appearance correctly", () async {
    //   await driver.waitFor(find.text("open"));
    //   await screenshot(driver, config, 'myscreenshot1');
    // });

    test("Word Detail appears correctly", () async {
      await driver.tap(find.byValueKey("family members"));
      await driver.waitFor(find.byValueKey("menu"));
      await screenshot(driver, config, 'myscreenshot2');
    });
  });
}
