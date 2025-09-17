import 'package:flutter/material.dart';

/// Widget icon
///
/// ```dart
/// fullPickerWidgetIcon: FullPickerPlusWidgetIcon.copy(
/// 	gallery: Icon(Icons.gamepad, size: 30),
/// ),
/// ```
class FullPickerPlusWidgetIcon {
  FullPickerPlusWidgetIcon();

  /// help for cheng widget icons
  FullPickerPlusWidgetIcon.copy({
    this.gallery,
    this.camera,
    this.file,
    this.voice,
    this.url,
  });

  Widget? gallery;
  Widget? camera;
  Widget? file;
  Widget? voice;
  Widget? url;
}
