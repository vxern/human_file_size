import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_styles/unit_style.dart';

/// {@template LongUppercaseUnitStyle}
/// The unit will be displayed in its long form with the prefix in lowercase.
///
/// For example, a kilobit will be shown as `Kbit` and a kilobyte will be
/// shown as `Kbyte`.
/// {@endtemplate}
class LongUppercaseUnitStyle extends UnitStyle {
  /// Returns an instance of [LongUppercaseUnitStyle].
  const LongUppercaseUnitStyle();

  @override
  String format(Unit unit) =>
      unit.symbols.longUppercase ?? unit.symbols.shortLowercase;
}

/// Alias of [LongUppercaseUnitStyle].
@Deprecated('Use [LongUppercaseUnitStyle] instead.')
typedef LongUppercaseStyle = LongUppercaseUnitStyle;
