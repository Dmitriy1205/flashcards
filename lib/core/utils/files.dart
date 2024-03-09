import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'extract_filename.dart';

Future<bool> isFileDownloaded(String filename) async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String filePath = '${appDocDir.path}/$filename';
  return File(filePath).exists();
}

Future<OpenResult> openFile(String filename) async{
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String filePath = '${appDocDir.path}/$filename';
  return OpenFile.open(filePath, type: Platform.isAndroid ? "application/pdf" : "com.adobe.pdf");
}

Future<void> downloadFile(String remoteUrl) async{
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String filePath = '${appDocDir.path}/${extractFilename(remoteUrl)}';
  await FirebaseStorage.instance.ref(remoteUrl).writeToFile(File(filePath));
}