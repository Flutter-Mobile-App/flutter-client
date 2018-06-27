import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'package:invoiceninja/utils/keys.dart';

import '../.env.dart';

void main() {
  group('PRODUCTS TEST', () {
    
    FlutterDriver driver;
    String loginEmail, loginPassword, loginUrl, loginSecret;

    setUp(() async {
      driver = await FlutterDriver.connect();

      // read config file
      loginEmail = Config.LOGIN_EMAIL;
      loginPassword = Config.LOGIN_PASSWORD;
      loginUrl = Config.LOGIN_URL;
      loginSecret = Config.LOGIN_API_SECRET;
    });

    tearDown(() async {
      if(driver!=null) {
        driver.close();
      }
    });

    test('Login into the app and switch to products screen', () async {
      
      await driver.tap(find.byValueKey(LoginKeys.emailKeyString), timeout: new Duration(seconds: 60));
      await driver.enterText(loginEmail);

      await driver.tap(find.byValueKey(LoginKeys.passwordKeyString));
      await driver.enterText(loginPassword);

      await driver.tap(find.byValueKey(LoginKeys.urlKeyString));
      await driver.enterText(loginUrl);

      await driver.tap(find.byValueKey(LoginKeys.secretKeyString));
      await driver.enterText(loginSecret);

      await driver.tap(find.text('LOGIN'));

      await driver.waitFor(find.byType('DashboardScreen'));

      // open the app drawer and switch to products screen
      // https://github.com/flutter/flutter/issues/9002[Issue still open] - Using this solution to implement it
      final SerializableFinder drawerOpenButton = find.byTooltip('Open navigation menu');

      await driver.tap(drawerOpenButton);

      final SerializableFinder productsDrawerButton = find.text('Products');
      await driver.tap(productsDrawerButton);

      await driver.waitFor(find.byType('ProductScreen'));
    });
  });
}