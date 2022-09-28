class ScreenArguments {
  final String? title;
  final String? subtitle;
  final bool? isVisible;

  ScreenArguments({
    this.title,
    this.subtitle,
    this.isVisible,
  });

  ScreenArguments.fromJson(
    Map<String, dynamic> json,
  )   : title = json['title'],
        isVisible = json['isVisible'],
        subtitle = json['subtitle'];
}
