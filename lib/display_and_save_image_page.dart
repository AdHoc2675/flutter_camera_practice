import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class DisplayAndSaveImagePage extends StatefulWidget {
  const DisplayAndSaveImagePage({super.key, required this.imagePath});
  final String imagePath;

  DisplayAndSaveImagePageState createState() =>
      DisplayAndSaveImagePageState(imagePath: this.imagePath);
}

class DisplayAndSaveImagePageState extends State<DisplayAndSaveImagePage> {
  DisplayAndSaveImagePageState({
    Key? key,
    required this.imagePath,
  });

  final String imagePath;
  final String albumName = 'Media';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GallerySaver.saveImage(imagePath, albumName: albumName)
              .then((value) => print('>>>> save value= $value'))
              .catchError((err) {
            print('error :( $err');
          });
        },
        child: Icon(
          Icons.save,
        ),
      ),
    );
  }
}
