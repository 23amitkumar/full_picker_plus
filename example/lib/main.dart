import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:full_picker_example/utils.dart';
import 'package:full_picker_plus/full_picker_plus.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.black),
      ),
      home: const FilePickerTest(),
    );
}


class FilePickerTest extends StatefulWidget {
  const FilePickerTest({super.key});

  @override
  State<FilePickerTest> createState() => _FilePickerTestState();
}

class _FilePickerTestState extends State<FilePickerTest> {
  ValueNotifier<double> onProgress = ValueNotifier<double>(0);

  String info = 'Not Selected !';

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Picker Example')),
        body: Column(
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Open Picker',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              onPressed: () {
                FullPickerPlus(
                  context: context,
                  prefixName: 'test',
                  file: true,
                  voiceRecorder: true,
                  video: true,
                  videoCamera: true,
                  imageCamera: true,
                  imageCropper: true,
                  multiFile: true,
                  // fullPickerWidgetIcon: FullPickerPlusWidgetIcon.copy(
                  //   gallery: Icon(Icons.gamepad, size: 30),
                  // ),
                  url: true,
                  onError: (final int value) {
                    if (kDebugMode) {
                      print(' ----  onError ----=$value');
                    }
                  },
                  onSelected: (final FullPickerPlusOutput value) async {
                    if (kDebugMode) {
                      print(' ----  onSelected ----');
                    }

                    if (value.fileType != FullPickerPlusType.url) {
                      info = '';
                      for (int i = 0; i < value.name.length; i++) {
                        final String fileSizeInt = fileSize(
                          await value.xFile[i]!.readAsBytes(),
                        );

                        info =
                            '${info}File Type :${value.fileType}\nPath File :${value.name[i]}\nSize File :$fileSizeInt\n--------\n';
                      }
                    } else {
                      info = value.data as String;
                    }

                    setState(() {});
                  },
                );
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Output :\n\n$info',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
