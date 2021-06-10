import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowFiles extends StatelessWidget {
  final List<File> files;
  final bool buttonDeleteIsVisible;
  final Function(int)? deleteFile;

  const ShowFiles(
      {required this.files,
      required this.buttonDeleteIsVisible,
      this.deleteFile});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(4),
        itemCount: files.length,
        itemBuilder: (BuildContext context, int index) {
          var file = files[index];

          return FutureBuilder<bool>(
              future: file.exists(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.data == true) {
                  if (file.path.endsWith('.webp')) {
                    return _buildImage(context, file, index);
                  } else {
                    return _buildDocument(context, file, index);
                  }
                } else {
                  return _buildDeletedFile(context, index);
                }
              });
        });
  }

  _buildImage(context, File file, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
                // height: 90,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image.file(file, height: 90, fit: BoxFit.cover)),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black45,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(file.path.split('/').last,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(_getFileSize(file),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 10),
                    Visibility(
                      visible: buttonDeleteIsVisible,
                      child: InkWell(
                          onTap: () =>
                              (deleteFile != null) ? deleteFile!(index) : null,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(FontAwesomeIcons.trash,
                                color: Colors.red, size: 20),
                          )),
                    ),
                    SizedBox(width: 2)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDocument(context, File file, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(FontAwesomeIcons.fileArchive,
                        color: Colors.green, size: 55),
                  ],
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black45,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(file.path.split('/').last,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(_getFileSize(file),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 10),
                    Visibility(
                      visible: buttonDeleteIsVisible,
                      child: InkWell(
                          onTap: () =>
                              (deleteFile != null) ? deleteFile!(index) : null,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(FontAwesomeIcons.trash,
                                color: Colors.red, size: 20),
                          )),
                    ),
                    SizedBox(width: 2)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDeletedFile(context, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.remove_circle,
                        color: Colors.red, size: 55),
                  ],
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black45,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                          'This file was deleted or move from his directory',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text('0 B',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 10),
                    Visibility(
                      visible: buttonDeleteIsVisible,
                      child: InkWell(
                          onTap: () =>
                              (deleteFile != null) ? deleteFile!(index) : null,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(FontAwesomeIcons.trash,
                                color: Colors.red, size: 20),
                          )),
                    ),
                    SizedBox(width: 2)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getFileSize(File file) {
    final u = Utils();
    return u.formatBytes(file.readAsBytesSync().lengthInBytes, 2);
  }

  Future<List<File>> _checkIfFilesExists(List<File> files) async {
    List<File> _files = [];

    for (var file in files) {
      if (await file.exists()) {
        _files.add(file);
      }
    }
    return _files;
  }
}
