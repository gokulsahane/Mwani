import 'package:mwani/model/ui/req_body.dart';

class Request {
  final int index;
  final bool showArrow;
  final bool showDelete;
  final bool showEdit;
  final String title;
  final List<RequestBody> subFields;

  Request({
    required this.index,
    this.showArrow = false,
    this.showDelete = false,
    this.showEdit = false,
    required this.title,
    this.subFields = const []
  });
}