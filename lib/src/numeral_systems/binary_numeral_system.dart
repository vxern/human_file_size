import 'package:human_file_size/src/numeral_systems/numeral_system.dart';
import 'package:human_file_size/src/unit.dart';

/// {@template BinaryNumeralSystem}
/// The binary numeral system with the factor between sequential magnitudes
/// being 1024 or 2^10. Commonly used in Linux systems.
///
/// The prefixes belonging to this system are kibi-, mebi-, gibi-, tebi-,
/// pebi-, exbi-, zebi-, and yobi-.
///
/// Prefixes are abbreviated as Ki, Mi, Gi, Ti, Pi, Ei, Zi, and Yi
/// respectively.
///
/// Example units include Kibibits (Kib/Kibit) and Mebibytes (MiB/Mibyte).
/// {@endtemplate}
class BinaryNumeralSystem extends NumeralSystem {
  static final List<Unit> _units = List.unmodifiable([
    Unit.bit,
    Unit.byte,
    Unit.kibibit,
    Unit.kibibyte,
    Unit.mebibit,
    Unit.mebibyte,
    Unit.gibibit,
    Unit.gibibyte,
    Unit.tebibit,
    Unit.tebibyte,
    Unit.pebibit,
    Unit.pebibyte,
    Unit.exbibit,
    Unit.exbibyte,
    Unit.zebibit,
    Unit.zebibyte,
    Unit.yobibit,
    Unit.yobibyte,
  ]);

  static final List<Unit> _unitsBit = List.unmodifiable([
    Unit.bit,
    Unit.kibibit,
    Unit.mebibit,
    Unit.gibibit,
    Unit.tebibit,
    Unit.pebibit,
    Unit.exbibit,
    Unit.zebibit,
    Unit.yobibit,
  ]);

  static final List<Unit> _unitsByte = List.unmodifiable([
    Unit.byte,
    Unit.kibibyte,
    Unit.mebibyte,
    Unit.gibibyte,
    Unit.tebibyte,
    Unit.pebibyte,
    Unit.exbibyte,
    Unit.zebibyte,
    Unit.yobibyte,
  ]);

  @override
  List<Unit> get units => switch (unitMagnitude) {
        UnitMagnitude.bits => _unitsBit,
        UnitMagnitude.bytes => _unitsByte,
        _ => _units,
      };

  /// Returns an instance of [BinaryNumeralSystem].
  const BinaryNumeralSystem({super.unitMagnitude});
}

/// Alias of [BinaryNumeralSystem].
@Deprecated('Use [BinaryNumeralSystem] instead.')
typedef BinarylSystem = BinaryNumeralSystem;
