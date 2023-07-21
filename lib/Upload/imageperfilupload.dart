import 'dart:io';

import 'package:app_vestimenta/Upload/selectimg.dart';
import 'package:app_vestimenta/Upload/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImagePerfilUpload extends StatefulWidget {
  const ImagePerfilUpload({super.key});

  @override
  State<ImagePerfilUpload> createState() => _ImagePerfilUploadState();
}

class _ImagePerfilUploadState extends State<ImagePerfilUpload> {
  // ignore: non_constant_identifier_names
  File? image_to_upload;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cambiar Imagen de Perfil')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromARGB(133, 114, 157, 172),
                  Color.fromARGB(75, 103, 121, 182),
                  Color.fromARGB(198, 128, 175, 138),
                  Color.fromARGB(18, 90, 154, 175),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  border:
                                      Border.all(width: 5, color: Colors.blue)),
                              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              width: 250,
                              height: 350,
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    image_to_upload != null
                                        ? Image.file(image_to_upload!)
                                        : SvgPicture.asset(
                                            'assets/images/perfilavatar.svg'),
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(204, 48, 201, 150),
                                              Color.fromARGB(169, 213, 231, 44),
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight),
                                      ),
                                      height: 20,
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: ElevatedButton(
                                          style: const ButtonStyle(
                                              shadowColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.transparent),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.transparent)),
                                          onPressed: () async {
                                            final imagen = await getImage();
                                            setState(() {
                                              if (imagen?.path == null) {
                                                return;
                                              } else {
                                                image_to_upload =
                                                    File(imagen!.path);
                                              }
                                            });
                                          },
                                          child:
                                              const Text('Seleccionar Imagen')),
                                    ),
                                  ])),
                        ],
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(204, 89, 219, 255),
                                Color.fromARGB(169, 176, 80, 255),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                        height: 50,
                        width: 200,
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                shadowColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.transparent)),
                            onPressed: () async {
                              final uploaded =
                                  await uploadImage(image_to_upload!);

                              if (uploaded) {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Imagen subida Correctamente")));
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Error al subir la imagen")));
                              }
                            },
                            child: const Text(
                              'Cambiar Perfil',
                              style: TextStyle(fontFamily: 'Ultra'),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
