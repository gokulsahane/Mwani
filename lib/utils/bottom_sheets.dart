import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mwani/widgets/common/image_picker/file_picker.dart';
import 'package:mwani/widgets/profile/dependent_sheet.dart';
import 'package:mwani/widgets/self_service/self_service_sheet.dart';

// choose b/w update or delete
Future<int?> dependentOption(parentContext) async {
  final value = await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      context: parentContext,
      builder: (context) {
        return const DependentSheet();
      });
  return value;
}

// choose self service
Future<int?> selfServiceOption(parentContext) async {
  final value = await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      context: parentContext,
      builder: (context) {
        return const SelfServiceSheet();
      });
  return value;
}

// choose file
Future<File?> selectFile(parentContext) async {
  File? file = await showModalBottomSheet(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    context: parentContext,
    builder: (BuildContext context) {
      return const CustomBottomSheet();
    },
  );
  return file;
}
