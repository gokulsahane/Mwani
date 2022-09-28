import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mwani/widgets/common/btn.dart';

class ErrorScreen extends StatelessWidget {
  final dynamic error;
  final Function()? onRefresh;
  const ErrorScreen({Key? key, this.error, this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.error),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("$error"),
            AppButton(
              onPressed: onRefresh,
              child: Text(AppLocalizations.of(context)!.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
