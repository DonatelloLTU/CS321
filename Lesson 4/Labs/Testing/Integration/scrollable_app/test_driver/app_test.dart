// Imports the Flutter Driver API

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Scrollable App', () {
    FlutterDriver driver;
// Connect to the Flutter driver before running any tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
// Close the connection to the driver after the tests have completed
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });
    test('verifies the list contains a specific item', () async {
// Create two SerializableFinders. We will use these to locate specific
// Widgets displayed by the app. The names provided to the byValueKey
// method correspond to the Keys we provided to our Widgets in step 1.
      final listFinder = find.byValueKey('long_list');
      final itemFinder = find.byValueKey('item_50_text');
      await driver.scrollUntilVisible(
// Scroll through this list
        listFinder,
// Until we find this item
        itemFinder,
// In order to scroll down the list, we need to provide a negative
// value to dyScroll. Ensure this value is a small enough increment to
// scroll the item into view without potentially scrolling past it.
//
// If you need to scroll through horizontal lists, provide a dxScroll
// argument instead
        dyScroll: -300.0,
      );
// Verify the item contains the correct text
      expect(
        await driver.getText(itemFinder),
        'Item 50',
      );
      // Record a performance timeline as the app scrolls through the list of items.
      final timeline = await driver.traceAction(() async {
        await driver.scrollUntilVisible(
          listFinder,
          itemFinder,
          dyScroll: -300.0,
        );

        expect(await driver.getText(itemFinder), 'Item 50');
      });
    });
  });
}
