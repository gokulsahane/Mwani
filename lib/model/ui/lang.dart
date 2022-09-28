class LanguageOption{

  String? imageAssetPath;
  String? title;
  String? code;

  LanguageOption({this.imageAssetPath,this.title, this.code});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setCode(String getCode){
    code = getCode;
  }

  String getImageAssetPath(){
    return imageAssetPath!;
  }

  String getTitle(){
    return title!;
  }

  String getCode(){
    return code!;
  }

}