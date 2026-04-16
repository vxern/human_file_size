import 'package:human_file_size/human_file_size.dart';

/// Magnitude of units to return
enum UnitMagnitude {
  /// Only return bits based units
  bits,

  /// Only return bytes based units
  bytes,

  /// Return any unit
  any
}

/// Represents the numeral system of units.
abstract class NumeralSystem {
  /// A list of units in this numeral system, arranged in ascending order.
  List<Unit> get units;

  /// The magnitude of units to return.
  final UnitMagnitude unitMagnitude;

  /// Returns an instance of [NumeralSystem].
  const NumeralSystem({UnitMagnitude? unitMagnitude})
      : unitMagnitude = unitMagnitude ?? UnitMagnitude.any;

  /// {@macro BinaryNumeralSystem}
  const factory NumeralSystem.binary() = BinaryNumeralSystem;

  /// {@macro DecimalNumeralSystem}
  const factory NumeralSystem.decimal() = DecimalNumeralSystem;
}
