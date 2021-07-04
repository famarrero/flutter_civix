import 'package:flutter_civix/src/core/failure/failures.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

abstract class UrlLauncherManager {
  Future<CallPhoneFailure?> callPhone(String phoneNumber);

  Future<SendEmailFailure?> sendEmail(String emailAddress);

  Future<OpenUrlFailure?> openUrl(String url);
}

class UrlLauncherManagerImpl extends UrlLauncherManager {
  Future<CallPhoneFailure?> callPhone(String phoneNumber) async {
    String fullUrl = 'tel:+53$phoneNumber';
    if (await UrlLauncher.canLaunch(fullUrl)) {
      await UrlLauncher.launch(fullUrl);
    } else {
      print(S.current.callCouldNotBeMade);
      return CallPhoneFailure(S.current.callCouldNotBeMade);
    }
  }

  Future<SendEmailFailure?> sendEmail(String emailAddress) async {
    String fullUrl = 'mailto:$emailAddress?body=\n\n\n\nEnviado a través de la aplicación Civix';
    if (await UrlLauncher.canLaunch(fullUrl)) {
      await UrlLauncher.launch(fullUrl);
    } else {
      return SendEmailFailure(S.current.emailCouldNotBeSend);
    }
  }

  Future<OpenUrlFailure?> openUrl(String url) async {
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(
        url,
        forceWebView: false,
        forceSafariVC: false
      );
    } else {
      return OpenUrlFailure(S.current.urlCouldNotBeOpen);
    }
  }
}
