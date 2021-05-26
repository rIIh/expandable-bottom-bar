### [2.0.2](https://github.com/rIIh/expandable-bottom-bar/compare/v2.0.1...v2.0.2) (2021-05-26)


### :zap: Refactoring

* **ci:** format code on publish pipeline ([3f7462f](https://github.com/rIIh/expandable-bottom-bar/commit/3f7462f92cdfac6c782f0832e36becf159580ad0))

### [2.0.1](https://github.com/rIIh/expandable-bottom-bar/compare/v2.0.0...v2.0.1) (2021-05-24)


### :memo: Documentation

* fix readme preview ([7fbf2c1](https://github.com/rIIh/expandable-bottom-bar/commit/7fbf2c168e2437519ce658cc0a1dbc04563151d5))

## [2.0.0](https://github.com/rIIh/expandable-bottom-bar/compare/v1.0.2...v2.0.0) (2021-05-24)


### ⚠ BREAKING CHANGES

* now package uses Dart SDK >= 2.12.0

### :sparkles: Features

* add full size calculation and update example ([2607bcb](https://github.com/rIIh/expandable-bottom-bar/commit/2607bcba6eddf24014b9494ed3377484eaefdcd0))
* migrate to null-safety ([fddbb3f](https://github.com/rIIh/expandable-bottom-bar/commit/fddbb3f5a470f19e79eb4dba7238a42031490a0b))


### :zap: Refactoring

* **example:** remove unused import ([a0bf568](https://github.com/rIIh/expandable-bottom-bar/commit/a0bf56896a18ad0d018d605c44ceffb2ee894f5f))

## [1.0.0] - 11 January 2020

**Breaking**

* Changed isOpen from a method to a getter.

**Backwards-compatible:**

* Documented public members & methods

* Replaced deprecated inheritFromWidgetOfExactType with findAncestorWidgetOfExactType

* Added getters isOpen, isOpening, isClosed, isClosing

* Changed to AnimationStatus for status checking

* Controller notifies listeners when animation status is updated, not just on completion

* Added optional named velocity parameter to close, open and swap methods

* Clarified deprecation message for animation getter

## [0.1.1] - 18 May 2019

* Pub Hub deployed

## [0.0.1] - 09 May 2019

* Initial release
