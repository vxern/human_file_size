import 'package:decimal/decimal.dart';
import 'package:human_file_size/src/quantity_display_modes/quantity_display_mode.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:intl/intl.dart';

/// A resolver for the number of decimal places to use for a given unit.
typedef DecimalPlacesResolver = int Function(Decimal quantity, Unit unit);

/// Default implementation of [DecimalPlacesResolver].
/// Example:
/// 512 bytes: 512 B
/// 128.43 kilobytes: 128 KB
/// 1.01442 megabytes: 1.0 MB
/// 1.44112 megabytes: 1.4 MB
/// 1.23446 gigabytes: 1.23 GB
/// 2.34507 terabytes: 2.345 TB
DecimalPlacesResolver defaultDecimalPlacesResolver = (quantity, unit) {
  if (unit == Unit.bit ||
      unit == Unit.byte ||
      unit == Unit.kilobit ||
      unit == Unit.kilobyte ||
      unit == Unit.kibibit ||
      unit == Unit.kibibyte) {
    return 0;
  }

  if (unit == Unit.megabit ||
      unit == Unit.megabyte ||
      unit == Unit.mebibit ||
      unit == Unit.mebibyte) {
    return 1;
  }

  if (unit == Unit.gigabit ||
      unit == Unit.gigabyte ||
      unit == Unit.gibibit ||
      unit == Unit.gibibyte) {
    return 2;
  }

  if (unit == Unit.terabit ||
      unit == Unit.terabyte ||
      unit == Unit.tebibit ||
      unit == Unit.tebibyte) {
    return 3;
  }

  return 4;
};

/// {@template PrettyQuantityDisplayMode}
/// A [QuantityDisplayMode] that formats the quantity with a fixed number of
/// decimal places dependant on the the unit.
///
/// This should result in a cleaner string when used for e.g., a download
/// progress bar that's constantly updating values and transitioning between
/// different units, e.g., from Bytes to Kilobytes to Megabytes.
/// {@endtemplate}
class PrettyQuantityDisplayMode extends QuantityDisplayMode {
  /// Resolver to use to determine the number of decimal places to use for a
  /// given unit.
  late final DecimalPlacesResolver decimalPlacesResolver;

  /// Optionally format with Intl numberFormat, e.g.:
  /// en_GB returns 123,456.78
  /// de_DE returns 123.456,67
  final String? locale;

  /// Cache of NumberFormat instances by decimalPlaces
  final Map<int, NumberFormat> _formatCache = {};

  /// Returns an instance of [PrettyQuantityDisplayMode].
  PrettyQuantityDisplayMode({
    DecimalPlacesResolver? decimalPlacesResolver,
    this.locale,
  }) {
    this.decimalPlacesResolver =
        decimalPlacesResolver ?? defaultDecimalPlacesResolver;
  }

  @override
  String format(Decimal quantity, {required Unit unit}) {
    final decimalPlaces = decimalPlacesResolver(quantity, unit);

    if (locale != null) {
      final formatter = _formatCache.putIfAbsent(
        decimalPlaces,
        () => NumberFormat.decimalPatternDigits(
          locale: locale,
          decimalDigits: decimalPlaces,
        ),
      );

      /// Formatter doesn't accept decimals, toDouble() may lose a tiny amount
      /// of precision.
      return formatter.format(quantity.toDouble());
    }

    return quantity.toStringAsFixed(decimalPlaces);
  }
}
