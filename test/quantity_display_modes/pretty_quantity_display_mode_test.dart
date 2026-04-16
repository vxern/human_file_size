import 'package:decimal/decimal.dart';
import 'package:human_file_size/src/quantity_display_modes/pretty_quantity_display_mode.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:test/test.dart';

void main() {
  group('format()', () {
    group('[decimalPlacesResolver]', () {
      group('[default DecimalPlacesResolver]', () {
        final defaultValue = Decimal.parse('1000.328473');

        for (final input in [
          (value: defaultValue, unit: Unit.byte, expected: '1000'),
          (value: defaultValue, unit: Unit.kilobyte, expected: '1000'),
          (value: defaultValue, unit: Unit.megabyte, expected: '1000.3'),
          (value: defaultValue, unit: Unit.gigabyte, expected: '1000.33'),
          (value: defaultValue, unit: Unit.terabyte, expected: '1000.328'),
          (value: defaultValue, unit: Unit.yottabyte, expected: '1000.3285'),
        ]) {
          test(
            'Should parse ${input.value} ${input.unit.symbols.shortLowercase} as ${input.expected}',
            () {
              expect(
                PrettyQuantityDisplayMode().format(
                  input.value,
                  unit: input.unit,
                ),
                input.expected,
              );
            },
          );
        }
      });

      group('[custom decimalPlacesResolver]', () {
        test(
          'should use custom decimalPlacesResolver and return a fixed 8 decimal places',
          () {
            expect(
              PrettyQuantityDisplayMode(
                decimalPlacesResolver: (quantity, unit) => 8,
              ).format(
                Decimal.parse('1000.9'),
                unit: Unit.byte,
              ),
              '1000.90000000',
            );
          },
        );
      });

      group('[locale]', () {
        final defaultValue = Decimal.parse('123456.789');

        for (final input in [
          (value: defaultValue, locale: 'en_GB', expected: '123,456.789'),
          (value: defaultValue, locale: 'de_DE', expected: '123.456,789'),
          (value: defaultValue, locale: 'uk_UA', expected: '123 456,789'),
        ]) {
          test(
            'should format numbers using ${input.locale} format as ${input.expected}',
            () {
              expect(
                PrettyQuantityDisplayMode(locale: input.locale)
                    .format(
                      input.value,
                      unit: Unit.terabyte,
                    )
                    // Replace non-breaking space (NBSP) with regular space for ease
                    .replaceAll('\u{00A0}', ' '),
                input.expected,
              );
            },
          );
        }
      });
    });
  });
}
