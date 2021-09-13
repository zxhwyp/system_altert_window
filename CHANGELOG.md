## 0.4.4

* Fixed issues in prefMode not being honored by the permissions and close layout calls

## 0.4.3+1

* Fixed prefMode crash

## 0.4.3

* Added support for prefMode to SystemAlertWindow. Using this users can force SystemAlertWindow to show overlay on Android 11 (prefMode = OVERLAY) and Bubble in Android 10 (prefMode = BUBBLE)

## 0.4.2+2

* Fixed the return types of request/check permission methods

## 0.4.2+1

* Fixed the return types of request/check permission methods

## 0.4.2 - Breaking Changes

* Separated request permissions and check permissions

## 0.4.1+1

* Fixed a crash in system alert window while closing the window

## 0.4.1

* Fixed a crash in system alert window if permission is not given

## 0.4.0+1

* Updated the readme + Fixed issues in pubspec file

## 0.4.0

* Added bubble support for Android 11 and Android Go versions

## 0.3.2+2

* Fixed a crash while checking app permissions

## 0.3.2+1

* Updated the readme file, as gifs are not displaying on pub packages

## 0.3.2

* Updated the readme file. Now system alert window is draggable irrespective of it's width

## 0.3.1

* Fixed a rare crash, while updating system alert window. Now, update window method will consider the given width and height

## 0.3.0

* Migrated Overlay window to a new service and added notification to prevent it from getting unresponsive during long runtime

## 0.2.2+3

* Fixed a rare crash, while updating system alert window

## 0.2.2+2

* Added retries for callback events + added logs to identify errors (if any)

## 0.2.2+1

* Fixed a rare issue, window is not updating, Removed focus to the window, to allow keyboard interactions behind it

## 0.2.2

* Fixed a rare issue, callback of button click are not working

## 0.2.1+4

* Fixed a rare crash, while opening system alert window

## 0.2.1+3

* Fixed a crash, while closing system alert window

## 0.2.1+2

* Added logs to debug click call back events.

## 0.2.1+1

* Updated readme. Added debug logs to identify the crash while invoking callback.

## 0.2.1

* Added support for background dispatch of click events. So that the click events are not missed, in case the app is destroyed while displaying the overlay window.

## 0.2.0 - Breaking Changes

* Added support for multiple buttons in the footer. Please refer to the updated example

## 0.1.5+1

* Fixed the casting issue in onClick callback.

## 0.1.5 - Breaking Changes

* Refactored the code and replaced registerCallBack with registerOnClickListener. Please refer to the updated example.

## 0.1.4+6

* Now body and footer are optional

## 0.1.4+5

* Fixed issue with ButtonPosition.TRAILING alignment

## 0.1.4+4

* Fixed issue with bubble configuration on Android Q

## 0.1.4+3

* Fixed minimum required API version for bubbles + Optimized the exports of systemAlertWindow models

## 0.1.4+2

* Fixed an issue where overlay window is crashing during update overlay window call

## 0.1.4+1

* Fixed an issue where multiple overlay windows are creating during update overlay window call

## 0.1.4

* Fixed overlay window issue with older Android versions

## 0.1.3+1

* Fixed a crash with updateSystemWindow method for android 9 and below

## 0.1.3

* Fixed a bug in closeSystemWindow method
* Improved permissions checking logic
* Added support for updating the system alert window

## 0.1.2

* Moved bubble notification to foreground service, to allow the bubble to display in all cases
* Fixed the launcher icons of the example

## 0.1.1+1

* Added logging + Made minor changes to fix crashes with bubbles

## 0.1.1 - Breaking Changes

* Renamed the models to avoid conflicts with the native libraries

## 0.1.0

* Added support to close the system alert window
* Improved the permissions API to include support for Android 10

## 0.0.1

* Initial release (Working only for Android)
