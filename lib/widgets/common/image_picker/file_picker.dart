import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mwani/managers/permission.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/toast.dart';
import 'package:mwani/widgets/common/image_picker/img_picker.dart';

class CustomBottomSheet extends StatefulWidget {
  final Function()? onCameraSelect;
  final Function()? onGallerySelect;
  final Function()? onFileSelect;
  final Function()? onCancelSelect;
  final String cancelLabel;
  const CustomBottomSheet(
      {Key? key,
      this.onCameraSelect,
      this.onGallerySelect,
      this.onFileSelect,
      this.onCancelSelect,
      this.cancelLabel = 'Cancel'})
      : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  File? selectedFile;

  handleTakePhoto() async {
    bool granted = await getCameraPermission();
    if (granted) {
      XFile? _imgFile =
      await ImagePicker().pickImage(source: ImageSource.camera);
      if (_imgFile != null) {
        setState(() {
          selectedFile = File(_imgFile.path);
        });
      }
      Navigator.pop(context, selectedFile);
    } else {
      Navigator.of(context).pop();
      permissionDialog(
          context: context,
          title: 'Permission Error',
          body: 'Allow Camera permission in settings');
    }
  }

  handleGetPhoto() async {
    bool success = await getGalleryPermission();
    if (success) {
      File? file = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ImagePickScreen(
          onSubmit: (file) {
            Navigator.of(context).pop(file);
          },
        ),
      ));

      if (file != null) {
        setState(() {
          selectedFile = file;
        });
      }
      Navigator.pop(context, selectedFile);
    } else {
      Navigator.of(context).pop();
      permissionDialog(
          context: context,
          title: 'Permission Error',
          body: 'Allow storage permission in settings');
    }
  }

  handleGetFile() async {
    bool success = await getStoragePermission();
    if (success) {
      File? file;
      FilePickerResult? result = await FilePicker.platform.pickFiles(allowedExtensions: ['pdf', 'doc'], type: FileType.custom);

      if (result != null) {
        file = File(result.files.single.path!);
      } else {
        // User canceled the picker
      }

      if (file != null) {
        setState(() {
          selectedFile = file;
        });
      }
      Navigator.pop(context, selectedFile);
    } else {
      Navigator.of(context).pop();
      permissionDialog(
          context: context,
          title: 'Permission Error',
          body: 'Allow storage permission in settings');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // divider
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
                color: AppColor.of(context).grey, borderRadius: BorderRadius.circular(20)),
          ),
        ),

        // title
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choose',
                style: AppText.of(context).headingStyle2(size: 18, color: AppColor.of(context).blueBerry5),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: AppColor.of(context).red,
                    size: 20,
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            color: AppColor.of(context).grey1,
            height: 0,
            thickness: 2,
          ),
        ),

        // camera
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.cameraRetro,
            color: AppColor.of(context).darkGrey,
            size: 20,
          ),
          title: Text(
            'Select From Camera',
            style: AppText.of(context).bodyStyle1(size: 16, color: AppColor.of(context).txtColor),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColor.of(context).darkGrey,
            size: 18,
          ),
          onTap: () => handleTakePhoto(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            color: AppColor.of(context).lightGrey,
            height: 0,
            thickness: 1,
          ),
        ),

        // gallery
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.images,
            color: AppColor.of(context).darkGrey,
            size: 20,
          ),
          title: Text(
            'Select From Gallery',
            style: AppText.of(context).bodyStyle1(size: 16, color: AppColor.of(context).txtColor),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColor.of(context).darkGrey,
            size: 18,
          ),
          onTap: () => handleGetPhoto(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            color: AppColor.of(context).lightGrey,
            height: 0,
            thickness: 1,
          ),
        ),

        // file
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.file,
            color: AppColor.of(context).darkGrey,
            size: 20,
          ),
          title: Text(
            'Select From Explorer',
            style: AppText.of(context).bodyStyle1(size: 16, color: AppColor.of(context).txtColor),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColor.of(context).darkGrey,
            size: 18,
          ),
          onTap: () => handleGetFile(),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
