import 'dart:io';
import 'dart:ui';

import 'package:chesstip/components/anexo.dart';
import 'package:chesstip/screens/photo_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class CameraScreen extends StatefulWidget {
  CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? arquivo;
  final picker = ImagePicker();

  Future getFileFromGallery() async {
    // PickedFile? file = await picker.getImage(source: ImageSource.gallery);

    // if (file != null) {
    //   setState(() => arquivo = File(file.path));
    // }
  }

  showPreview(file) async {
    File? arq = await Get.to(() => PhotoPreviewScreen(file: file));

    if (arq != null) {
      setState(() => arquivo = arq);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mude sua Foto de Perfil'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (arquivo != null) Anexo(arquivo: arquivo!),
                ElevatedButton.icon(
                  onPressed: () => Get.to(
                    () => CameraCamera(onFile: (file) => showPreview(file)),
                  ),
                  icon: Icon(Icons.camera_alt),
                  label: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Tire uma foto'),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      textStyle: TextStyle(
                        fontSize: 18,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('ou'),
                ),
                OutlinedButton.icon(
                  icon: Icon(Icons.attach_file),
                  label: Text('Selecione um arquivo'),
                  onPressed: () => getFileFromGallery(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
