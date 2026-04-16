## 0.7.0

- Added `PrettyQuantityDisplayMode`. (@akiller)
- Added `unitMagnitude` to `BinaryNumeralSystem` and `DecimalNumeralSystem`. (@akiller)

## 0.6.1

- Added `collection` as a dev dependency. (@vxern)
- Improved test suite by simplifying tests and adding more test cases. (@vxern)

## 0.6.0

- Split up the previously monolithic files into a file per class. (@vxern)
- Split up test files to match the layout of the codebase. (@vxern)
- Moved defaults into a new file `defaults.dart`. (@vxern)
- Renamed: (@vxern)
  - `BinarySystem` -> `BinaryNumeralSystem`
  - `DecimalSystem` -> `DecimalNumeralSystem`
  - `BestFitConversion` -> `BestFitUnitConversion`
  - `LongLowercaseStyle` -> `LongLowercaseUnitStyle`
  - `LongUppercaseStyle` -> `LongUppercaseUnitStyle`
  - `ShortLowercaseStyle` -> `ShortLowercaseUnitStyle`
  - `ShortUppercaseStyle` -> `ShortUppercaseUnitStyle`
- Added namespaced, enum-like constructors: (@vxern)
  - `NumeralSystem.binary()`
  - `NumeralSystem.decimal()`
  - `OutputFormat.simple()`
  - `QuantityDisplayMode.custom()`
  - `QuantityDisplayMode.intl()`
  - `QuantityDisplayMode.simple()`
  - `UnitConversion.bestFit()`
  - `UnitConversion.specific()`
  - `UnitStyle.longLowercase()`
  - `UnitStyle.longUppercase()`
  - `UnitStyle.shortLowercase()`
  - `UnitStyle.shortUppercase()`

## 0.5.1

- Added missing piece of documentation. (@vxern)

## 0.5.0

- Added `OutputFormatter` to format the produced output. (@vxern)

## 0.4.0

- Added `intl` as a dependency. (@vxern)
- Added `IntlQuantityDisplayMode`. (@vxern)
- Renamed `SimpleDisplayMode` to `SimpleQuantityDisplayMode` for consistency. (@vxern)
- Deprecated `CustomQuantityDisplayMode` in favour of concrete implementations of `QuantityDisplayMode`. (@vxern)

## 0.3.0

- Added method `bytes` to `Unit` for more natural comparisons. (@vxern)

## 0.2.0

- Renamed base method from `fileSizeToString` to `humanFileSize()`. (@vxern)
- Added extension method `humanFileSize` on `num`. (@vxern)

## 0.1.2

- Fixed pub.dev score. (@vxern)

## 0.1.1

- Fixed pub.dev score. (@vxern)

## 0.1.0

- Initial version. (@vxern)
