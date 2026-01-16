import 'package:human_file_size/src/numeral_systems/numeral_system.dart';
import 'package:human_file_size/src/unit.dart';

/// {@template BinaryNumeralSystemByteOnly}
/// The binary numeral system with the factor between sequential magnitudes
/// being 1024 or 2^10. Commonly used in Linux systems.
///
/// The prefixes belonging to this system are kibi-, mebi-, gibi-, tebi-,
/// pebi-, exbi-, zebi-, and yobi-.
///
/// Prefixes are abbreviated as Ki, Mi, Gi, Ti, Pi, Ei, Zi, and Yi
/// respectively.
///
/// This class will only return byte based units.
/// {@endtemplate}
class BinaryNumeralSystemByteOnly extends NumeralSystem {
  static final List<Unit> _units = List.unmodifiable([
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
  List<Unit> get units => _units;

  /// Returns an instance of [BinaryNumeralSystemByteOnly].
  const BinaryNumeralSystemByteOnly();
}
