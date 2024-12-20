import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_styles/unit_style.dart';

/// {@template LongLowercaseUnitStyle}
/// The unit will be displayed in its long form with the prefix in lowercase.
///
/// For example, a kilobit will be shown as `kbit` and a kilobyte will be
/// shown as `kbyte`.
/// {@endtemplate}
class LongLowercaseUnitStyle extends UnitStyle {
  /// Returns an instance of [LongLowercaseUnitStyle].
  const LongLowercaseUnitStyle();

  @override
  String format(Unit unit) =>
      unit.symbols.longLowercase ?? unit.symbols.shortLowercase;
}

/// Alias of [LongLowercaseUnitStyle].
@Deprecated('Use [LongLowercaseUnitStyle] instead.')
typedef LongLowercaseStyle = LongLowercaseUnitStyle;
