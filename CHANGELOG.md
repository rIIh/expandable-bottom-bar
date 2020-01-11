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
