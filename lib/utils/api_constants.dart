

import 'dart:math';

class ApiConstants{
  static String base_url = 'https://dev.progressapp.live/api';

  static  String generate6DigitId() {
    Random random = Random();
    int randomNumber = random.nextInt(900000) + 100000;
    return randomNumber.toString();
  }

}

// Future<void> customUrlLauncher(String url) async {
//   if (await canLaunchUrl(Uri.parse(url))) {
//     await launchUrl(Uri.parse(url));
//   } else {
//     appToast('Failed to open the link');
//   }
// }