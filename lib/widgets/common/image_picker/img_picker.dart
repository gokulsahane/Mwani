import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mwani/managers/image.dart';
import 'package:mwani/managers/permission.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/loader.dart';
import 'package:mwani/utils/toast.dart';
import 'package:mwani/widgets/common/anim/scale_anim.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/image_picker/btm_gallery.dart';
import 'package:mwani/widgets/common/image_picker/img_holder.dart';
import 'package:photo_manager/photo_manager.dart';

class ImagePickScreen extends StatefulWidget {
  final Function(File file) onSubmit;
  const ImagePickScreen({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _ImagePickScreenState createState() => _ImagePickScreenState();
}

class _ImagePickScreenState extends State<ImagePickScreen> {
  bool loading = true;
  bool saving = false;
  List<AssetEntity> assets = [];
  AssetEntity? selectedAssets;
  List<AssetPathEntity> albumList = [];
  AssetPathEntity? currentAlbum;
  File? file;

  @override
  void initState() {
    fetchAssets();
    super.initState();
  }

  fetchAssets() async {
    if (currentAlbum == null) {
      final albums =
          await PhotoManager.getAssetPathList(type: RequestType.image);
      albumList = albums;
      currentAlbum = albums.first;
    }
    final recentAlbum = currentAlbum;
    final recentAssets = await recentAlbum!.getAssetListRange(
      start: 0,
      end: 1000000,
    );
    assets = recentAssets;
    loading = false;
    if (mounted) setState(() {});
  }

  handleTakePhoto() async {
    XFile? imgFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imgFile != null) {
      setState(() {
        file = File(imgFile.path);
      });
    }
  }

  // image container
  Widget imageContainer(
      {required File? file,
      required BuildContext context,
      bool isFull = false,
      Function()? onTap}) {
    return Stack(
      children: [
        Container(
          height: isFull
              ? screenSize(context).height
              : screenSize(context).height / 2,
          width: screenSize(context).width,
          color: Colors.black,
          alignment: Alignment.center,
          child: Image.file(
            file!,
            height: isFull
                ? screenSize(context).height
                : screenSize(context).height / 2,
            width: screenSize(context).width,
          ),
        ),
        if (isFull)
          Positioned(
              right: 10,
              top: 15,
              child: CustomCard(
                  child: IconButton(
                icon: Icon(
                  Icons.camera,
                  color: AppColor.of(context).primary,
                ),
                onPressed: onTap,
              )))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        automaticImplyLeading: true,
        title: 'Select Image',
        trailing: file == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(right: 5, top: 3),
                child: ElevatedButton(
                    onPressed: () async {
                      if (mounted) {
                        setState(() {
                          saving = true;
                        });
                      }
                      widget.onSubmit(file!);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: AppColor.of(context).lightBlue2,
                        padding: EdgeInsets.zero,
                        shape: const StadiumBorder()),
                    child: saving
                        ? SizedBox(
                            height: 15,
                            child: spinKit(context: context),
                          )
                        : Text(
                            'Save',
                            style: AppText.of(context)
                                .headingStyle1(size: 14, color: Colors.white),
                          )),
              ),
      ),
      body: loading
          ? spinKit(context: context)
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // file img container
                  if (file != null)
                    imageContainer(
                        file: file,
                        context: context,
                        isFull: assets.isEmpty,
                        onTap: fetchAssets),

                  // when file is null
                  if (file == null)
                    ScaleAnimation(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Image.asset(
                            AppImg.of(context).appLogo,
                            height: assets.isEmpty
                                ? screenSize(context).height
                                : screenSize(context).height / 2,
                            width: screenSize(context).width,
                          ),
                        ),
                      ),
                    ),

                  // img holder
                  if (assets.isNotEmpty)
                    BottomGallery(
                      item: albumList.map((selected) {
                        return DropdownMenuItem(
                          child: Text(
                            selected.name,
                            style: AppText.of(context)
                                .headingStyle2(size: 15, color: Colors.white60),
                          ),
                          value: selected,
                        );
                      }).toList(),
                      onChange: (value) {
                        currentAlbum = value;
                        fetchAssets();
                      },
                      currentAlbum: currentAlbum,
                      onCrop: () async {
                        // File? imgFile = await selectedAssets?.file;
                        if (file != null) {
                          file = await cropImage(imageFile: file!);
                          if (file == null) {
                            selectedAssets = null;
                          }
                          setState(() {});
                        }
                      },
                      onCamera: () async {
                        bool granted = await getCameraPermission();
                        if (granted) {
                          if (selectedAssets != null) {
                            setState(() {
                              selectedAssets = null;
                              file = null;
                            });
                          }
                          await handleTakePhoto();
                        } else {
                          permissionDialog(
                              context: context,
                              title: 'Permissions error',
                              body:
                                  'Please enable camera access permission in system settings');
                        }
                      },
                      onToggle: () {
                        assets = [];
                        if (mounted) setState(() {});
                      },
                      imgLength: assets.length,
                      itemBuilder: (_, index) {
                        return AssetThumbnail(
                            asset: assets[index],
                            onSelect: () async {
                              if (selectedAssets != assets[index]) {
                                selectedAssets = assets[index];
                                file = await selectedAssets?.file;
                                setState(() {});
                              } else {
                                selectedAssets = null;
                                file = null;
                                setState(() {});
                              }
                            },
                            selected: selectedAssets == assets[index]);
                      },
                      imgSelected: file != null,
                    )
                ],
              ),
            ),
    );
  }
}
