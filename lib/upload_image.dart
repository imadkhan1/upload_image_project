import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;
  final picker = ImagePicker();
  bool showspinner = false;

  Future getImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print('No image selected.');
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showspinner = true;
    });
    var stream = http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var request = http.MultipartRequest('POST', uri);
    request.fields['title'] = 'Static Title';
    var multipartFile =
        http.MultipartFile('image', stream, length, filename: image!.path);
    request.files.add(multipartFile);
    var response = await request.send();
    if (response.statusCode == 200) {
      setState(() {
        showspinner = false;
      });
      print('Image uploaded');
    } else {
      print('Image not uploaded');
      setState(() {
        showspinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          title: const Center(
              child: Text(
            'Upload Image',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                  child: image == null
                      ? const Center(child: Text('Pick Image', style: TextStyle(fontSize: 20, color: Colors.black),))
                      : Container(
                          child: Center(
                              child: Image.file(
                            File(image!.path).absolute,
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.3,
                          )),
                        )),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'Upload',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
