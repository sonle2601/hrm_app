import 'dart:io';

import 'package:employee_manager/test2.dart';
import 'package:employee_manager/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class AnhCanCuoc extends StatefulWidget {
  const AnhCanCuoc({Key? key}) : super(key: key);

  @override
  State<AnhCanCuoc> createState() => _AnhCanCuocState();
}

class _AnhCanCuocState extends State<AnhCanCuoc> {
  final cloudinary = CloudinaryPublic('dtxkcvzg4', 'n1bn55kx');
  String? _imageUrl;

  Future<void> _pickAndUploadImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      File? croppedFile = await _cropImage(pickedImage.path);
      if (croppedFile != null) {
        final response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(croppedFile.path),
        );
        if (response != null && response.secureUrl != null) {
          setState(() {
            _imageUrl = response.secureUrl;
            print("hello" + _imageUrl.toString());
          });
        } else {
          print('Upload failed.');
        }
      } else {
        print('Image cropping failed.');
      }
    }
  }

  Future<File?> _cropImage(String imagePath) async {
    ImageCropper imageCropper = ImageCropper();
    File? croppedFile = await imageCropper.cropImage(
      sourcePath: imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 4, ratioY: 3),
      androidUiSettings: const AndroidUiSettings(
        toolbarTitle: 'Chỉnh sửa ảnh',
        toolbarColor: Colors.deepOrange,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: true,
      ),
      iosUiSettings: const IOSUiSettings(
        minimumAspectRatio: 4 / 3,
        aspectRatioLockEnabled: true,
      ),
    );
    return croppedFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chứng minh nhân dân'),
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Chọn ảnh"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.camera),
                            title: const Text("Chụp ảnh"),
                            onTap: () {
                              Navigator.of(context).pop();
                              _pickAndUploadImage(ImageSource.camera);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.photo),
                            title: const Text("Chọn ảnh từ thư viện"),
                            onTap: () {
                              Navigator.of(context).pop();
                              _pickAndUploadImage(ImageSource.gallery);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: 350,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                // padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: _imageUrl != null
                      ? Image.network(
                    _imageUrl!,
                    fit: BoxFit.cover,
                  )
                      : Column(
                        children: [
                          SizedBox(height: 20,),
                          Image.asset(
                    "assets/images/add_photo.png",
                    height: 80,
                  ),
                          const SizedBox(height: 20),
                          const Text(
                            "Ảnh chứng minh nhân dân\n(mặt trước)",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
void main() {
  runApp(GetMaterialApp(
    home: HomeDemo(),
  ));
}

