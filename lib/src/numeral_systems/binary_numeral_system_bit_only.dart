import 'package:human_file_size/src/numeral_systems/numeral_system.dart';
import 'package:human_file_size/src/unit.dart';

/// {@template BinaryNumeralSystemBitOnly}
/// The binary numeral system with the factor between sequential magnitudes
/// being 1024 or 2^10. Commonly used in Linux systems.
///
/// The prefixes belonging to this system are kibi-, mebi-, gibi-, tebi-,
/// pebi-, exbi-, zebi-, and yobi-.
///
/// Prefixes are abbreviated as Ki, Mi, Gi, Ti, Pi, Ei, Zi, and Yi
/// respectively.
///
/// This class will only return bit based units.
/// {@endtemplate}
class BinaryNumeralSystemBitOnly extends NumeralSystem {
  static final List<Unit> _units = List.unmodifiable([
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

  @override
  List<Unit> get units => _units;

  /// Returns an instance of [BinaryNumeralSystemBitOnly].
  const BinaryNumeralSystemBitOnly();
}
