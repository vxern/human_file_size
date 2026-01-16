import 'package:human_file_size/src/numeral_systems/numeral_system.dart';
import 'package:human_file_size/src/unit.dart';

/// {@template DecimalNumeralSystemByteOnly}
/// The decimal numeral system with the factor between sequential magnitudes
/// being 1000 or 10^3. This is the common system used to represent sizes of
/// data for regular users.
///
/// The prefixes belonging to this system are kilo-, mega-, giga-, tera-,
/// peta-, exa-, zetta-, and yotta-.
///
/// Prefixes are abbreviated as K, M, G, T, P, E, Z, and Y respectively.
///
/// This class will only return byte based units.
/// {@endtemplate}
class DecimalNumeralSystemByteOnly extends NumeralSystem {
  static final List<Unit> _units = List.unmodifiable([
    Unit.byte,
    Unit.kilobyte,
    Unit.megabyte,
    Unit.gigabyte,
    Unit.terabyte,
    Unit.petabyte,
    Unit.exabyte,
    Unit.zettabyte,
    Unit.yottabyte,
  ]);

  @override
  List<Unit> get units => _units;

  /// Returns an instance of [DecimalNumeralSystemByteOnly].
  const DecimalNumeralSystemByteOnly();
}
