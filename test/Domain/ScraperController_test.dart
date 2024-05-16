import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:chaleno/chaleno.dart';
import 'package:compassion_app/Domain/Controllers/ScraperController.dart';

import 'JournalController_test.mocks.dart';
import 'ScraperController_test.mocks.dart';
@GenerateNiceMocks([MockSpec<Chaleno>()])

void main(){
  late MockChaleno chaleno;
  late ScraperController scaperController;

  setUp(() {
    chaleno = MockChaleno();
    scaperController = ScraperController(chaleno);
  });

  test('getEvents should return a list of events', () async {
      //Arrange
      
      const htmlContent = '''
        <div class="accordion__item">
          <div class="accordion-header__title">Event 1</div>
          <div class="accordion-content">Event content 1</div>
        </div>
        <div class="accordion__item">
          <div class="accordion-header__title">Event 2</div>
          <div class="accordion-content">Event content 2</div>
        </div>
      ''';
      when(chaleno.load('https://www.sdu.dk/da/forskning/center_for_compassion/kollegacafe/materiale')).thenAnswer( (_) async => Future.value(Parser(htmlContent)));

      // Act
      final events = await scaperController.getEvents();

      // Assert
      expect(events.length, 2);
    });
}