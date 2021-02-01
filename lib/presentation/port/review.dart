import 'package:flutter/cupertino.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:review_dialog/review_dialog.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

/// found in App Store Connect under General > App Information > Apple ID.
/// https://pub.dev/packages/in_app_review#openstorelisting
const _appStoreId = '1558989799';

/// in appかストアでのレビューを要求するダイアログを表示する
/// in app review の場合onStoreReviewedは呼ばれない
Future<void> requestReviewInAppOrStore(BuildContext context, {VoidCallback? onStoreReviewed}) async {
  final inAppReview = InAppReview.instance;
  if (await inAppReview.isAvailable()) {
    await inAppReview.requestReview();
  } else {
    await showReviewDialog(
      context,
      textDelegate: AppLocalizations.string(context).reviewDialogTextDelegate,
      onSupportSelected: () {
        onStoreReviewed?.call();
        requestStoreReview();
      },
    );
  }
}

void requestStoreReview() {
  InAppReview.instance.openStoreListing(appStoreId: _appStoreId);
}
