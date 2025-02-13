import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerHelper {
  static final ImagePicker _imagePicker = ImagePicker();

  // Pick a single file
  static Future<PlatformFile?> pickSingleFile({
    FileType fileType = FileType.any,
    String? dialogTitle,
    List<String>? allowedExtensions,
    bool lockParentWindow = false,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: fileType,
        allowMultiple: false,
        dialogTitle: dialogTitle,
        allowedExtensions: allowedExtensions,
        lockParentWindow: lockParentWindow,
        allowCompression: true,
        compressionQuality: 70,
      );
      return result?.files.first;
    } catch (e) {
      log("Error picking files: $e", name: "File Picker Helper");
      return null;
    }
  }

  // Pick multiple files
  static Future<List<PlatformFile>?> pickMultipleFiles({
    FileType fileType = FileType.any,
    String? dialogTitle,
    List<String>? allowedExtensions,
    bool lockParentWindow = false,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: fileType,
        allowMultiple: true,
        dialogTitle: dialogTitle,
        allowedExtensions: allowedExtensions,
        lockParentWindow: lockParentWindow,
        allowCompression: true,
        compressionQuality: 70,
      );
      return result?.files;
    } catch (e) {
      log("Error picking files: $e", name: "File Picker Helper");
      return null;
    }
  }

  static Future<void> chooseSingleFile(
      Future<void> Function(XFile file) onFileDone) async {
    // Pick a single file
    PlatformFile? file = await FilePickerHelper.pickSingleFile();

    if (file != null) {
      log('File name: ${file.name}', name: 'File Picker');
      log('File path: ${file.path}', name: 'File Picker');
      log('File size: ${file.size}', name: 'File Picker');
      log('File extension: ${file.extension}', name: 'File Picker');
      await onFileDone(file.xFile);
    } else {
      log('No file selected.', name: 'File Picker');
      // showToast(msg: "لم يتم اختيار ملف");
    }
  }

  static Future<void> chooseMultipleFiles(
      Future<void> Function(PlatformFile file) onFilesDone) async {
    // Pick multiple files
    List<PlatformFile>? files = await FilePickerHelper.pickMultipleFiles();

    if (files != null && files.isNotEmpty) {
      for (PlatformFile file in files) {
        log('File name: ${file.name}', name: 'File Picker');
        log('File path: ${file.path}', name: 'File Picker');
        log('File size: ${file.size}', name: 'File Picker');
        log('File extension: ${file.extension}', name: 'File Picker');
        await onFilesDone(file);
      }
    } else {
      log('No files selected.', name: 'File Picker');
      // showToast(msg: "لم يتم اختيار ملف");
    }
  }

  // Capture an image from the camera
  static Future<void> captureImage(
      Future<void> Function(XFile file) onFileDone) async {
    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        log('Image captured: ${image.path}', name: 'Camera');
        log('Image size: ${(await image.readAsBytes()).length / 1024}',
            name: 'Camera');
        await onFileDone(image);
      }
    } catch (e) {
      log("Error capturing image: $e", name: "File Picker Helper");
      // showToast(msg: "لم يتم التقاط الصورة بنجاح");
    }
  }

  static Future<void> chooseSingleImageFile(
      Future<void> Function(XFile file) onFileDone) async {
    PlatformFile? file =
        await FilePickerHelper.pickSingleFile(fileType: FileType.image);

    if (file != null) {
      log('Image file selected: ${file.name}', name: 'File Picker');
      await onFileDone(file.xFile);
    } else {
      log('No image file selected.', name: 'File Picker');
      // showToast(msg: "لم يتم اختيار ملف صورة");
    }
  }

  static Future<void> chooseMultipleImageFiles(
      Future<void> Function(XFile file) onFilesDone) async {
    List<PlatformFile>? files =
        await FilePickerHelper.pickMultipleFiles(fileType: FileType.image);

    if (files != null && files.isNotEmpty) {
      for (PlatformFile file in files) {
        log('Image file selected: ${file.name}', name: 'File Picker');
        await onFilesDone(file.xFile);
      }
    } else {
      log('No image files selected.', name: 'File Picker');
      // showToast(msg: "لم يتم اختيار ملفات صور");
    }
  }
}
