![logo](https://github.com/23amitkumar/full_picker_plus/assets/20955005/10d10dc4-31fe-47e5-86fe-48f91141af47)

# Full picker plus
[![pub package](https://img.shields.io/pub/v/full_picker.svg)](https://pub.dev/packages/full_picker)</br>
A Flutter package that helps you select files in different modes

## Features
* Multi File picker
* Video Compressor
* Image Cropper
* Custom Camera
* Custom Name For Files
* Voice recorder
* URL picker
* Support Material 1,2,3

## Example App
<img src="https://raw.githubusercontent.com/mbfakourii/full_picker/master/example/screenshots/example.gif" width="300" height="550" />

## Usage
Quick simple usage example:

```dart
FullPickerPlus(
  context: context,
  prefixName: "test",
  file: true,
  image: true,
  video: true,
  videoCamera: true,
  imageCamera: true,
  voiceRecorder: true,
  videoCompressor: false,
  imageCropper: false,
  multiFile: true,
  url: true,
  onError: (int value) {
    print(" ----  onError ----=$value");
  },
  onSelected: (value) {
    print(" ----  onSelected ----");
  },
);
```

and use ```minSdkVersion 21``` in your Module-level build.gradle file

## Video Compressor

If you need to compress the video (only support Android And IOS), add the following

### iOS

Add the following to your _Info.plist_ file, located in `<project root>/ios/Runner/Info.plist`:

```
<key>NSPhotoLibraryUsageDescription</key>
<string>${PRODUCT_NAME} library Usage</string>
```

### Android

Add the following permissions in AndroidManifest.xml:

**API < 29**

```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"
android:maxSdkVersion="28"/>
```

**API >= 29**

```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

## Image Cropper
If you need to crop the image (only support Android And IOS), add the following

### Android

- Add UCropActivity into your AndroidManifest.xml

````xml
<activity
    android:name="com.yalantis.ucrop.UCropActivity"
    android:screenOrientation="portrait"
    android:theme="@style/Ucrop.CropTheme"/>
````
#### Note:
- From v1.2.0, you need to migrate your android project to v2 embedding ([detail](https://github.com/flutter/flutter/wiki/Upgrading-pre-1.12-Android-projects))

- The native plugin (uCrop) does not yet support Edge-to-Edge mode in Android 15. To work around this issue, please add the following code to your Android project (inside the android folder):
    - Add follwowing code to file `android/app/src/main/res/values/styles.xml`
  ```xml
  <resources>
    ....
    <style name="Ucrop.CropTheme" parent="Theme.AppCompat.Light.NoActionBar"/> <!--add this line-->
  </resources>
  ```

### iOS
- No configuration required

## Voice Recorder
If you need to voice recorder, add the following

### Android
```xml
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<!-- Optional, you'll have to check this permission by yourself. -->
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```
min SDK: 19 (maybe higher => encoder dependent)

### iOS
```xml
<key>NSMicrophoneUsageDescription</key>
<string>We need to access to the microphone to record audio file</string>
```
min SDK: 11.0

### macOS
```xml
<key>NSMicrophoneUsageDescription</key>
<string>We need to access to the microphone to record audio file</string>
```

## Multi Language
There is a possibility of customization for different languages in this package</br>

```dart
FullPickerPlusLanguage language = FullPickerPlusLanguage.copy(
    camera: S.current.camera,
    selectFile: S.current.selectFile,
    file: S.current.file,
    voiceRecorder: S.current.voiceRecorder,
    url: S.current.url,
    enterURL: S.current.enterURL,
    cancel: S.current.cancel,
    ok: S.current.ok,
    gallery: S.current.gallery,
    cropper: S.current.cropper,
    onCompressing: S.current.onCompressing,
    tapForPhotoHoldForVideo: S.current.tapForPhotoHoldForVideo,
    cameraNotFound: S.current.cameraNotFound,
    noVoiceRecorded: S.current.noVoiceRecorded,
    denyAccessPermission: S.current.denyAccessPermission);
    
FullPickerPlus(
  ...
  language: language,
  ...
);   
```

```S``` For [intl Package](https://pub.dev/packages/intl)

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).
