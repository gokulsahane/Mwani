import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/list_view.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;

class ImagePreview extends StatefulWidget {
  final List<File> attachments;
  const ImagePreview({Key? key, this.attachments = const []}) : super(key: key);

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {

  Future openFile({required File pickedFile}) async {
    final file = pickedFile;
    OpenFile.open(file.path);
  }



  @override
  Widget build(BuildContext context) {
    return CustomListView<File>(
        scrollPhysics: const ScrollPhysics(),
        elements: widget.attachments,
        padding: const EdgeInsets.only(top: 20),
        itemBuilder: (BuildContext context, int index) {
          File attachment = widget.attachments[index];
          String fileExt = p.extension(attachment.path);
          String basename = p.basename(attachment.path);
          String name = basename.split('/').last;
          return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
            child: CustomCard(
              child: ListTile(
                onTap: () async {
                  await openFile(pickedFile: attachment);
                },
                minLeadingWidth: 30,
                dense: true,
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImg.of(context).getFileIcon(ext: fileExt), height: 30,width: 30,),
                  ],
                ),
                title: Text(name.toString(), style: AppText.of(context).bodyStyle1(size: 16, color: AppColor.of(context).txtColor),maxLines: 1,overflow: TextOverflow.ellipsis,),
                subtitle: Text(fileExt.toString(), style: AppText.of(context).bodyStyle1(size: 14, color: AppColor.of(context).grey),maxLines: 1,overflow: TextOverflow.ellipsis,),
                trailing: Icon(Icons.open_in_browser, color: AppColor.of(context).secBlue,size: 20,),
              ),
            ),
          );
        });
  }
}
