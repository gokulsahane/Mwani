import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:photo_manager/photo_manager.dart';

class BottomGallery extends StatelessWidget {
  final List<DropdownMenuItem<AssetPathEntity>>? item;
  final void Function(AssetPathEntity?)? onChange;
  final AssetPathEntity? currentAlbum;
  final Function()? onToggle;
  final Function()? onCrop;
  final Function()? onCamera;
  final int? imgLength;
  final bool imgSelected;
  final Widget Function(BuildContext, int) itemBuilder;

  const BottomGallery(
      {Key? key,
        required this.item,
        this.onChange,
        this.currentAlbum,
        this.onToggle,
        this.onCrop,
        this.onCamera,
        this.imgLength,
        required this.itemBuilder,
        this.imgSelected = false
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.of(context).black1,
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: isPortrait(context) ? (screenSize(context).height / 16.254) : (screenSize(context).width / 16.254),
            width: screenSize(context).width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            // color: blue3,
            decoration: BoxDecoration(
                color: AppColor.of(context).black1,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenSize(context).width / 2.4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        elevation: 10,
                        hint: Text('Select Album',
                          style: AppText.of(context).bodyStyle1(size: 15, color: Colors.white60),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white60,),
                        isDense: false,
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(10),
                        dropdownColor: AppColor.of(context).black1,
                        items: item,
                        underline: const Divider(height: 0, color: Colors.black54,),
                        onChanged: onChange,
                        value: currentAlbum,
                        // borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white60,
                      ),
                      onPressed: onCamera,
                    ),
                    if(imgSelected)
                      IconButton(
                        icon: const Icon(
                          Icons.crop,
                          color: Colors.white60,
                        ),
                        onPressed: onCrop,
                      ),
                    if(imgSelected)
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: AppColor.of(context).red,
                        ),
                        onPressed: onToggle,
                      )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 2, crossAxisSpacing: 2),
              itemCount: imgLength,
              itemBuilder: itemBuilder,
            ),
          ),
          // const SizedBox(height: 80),
        ],
      ),
    );
  }
}
