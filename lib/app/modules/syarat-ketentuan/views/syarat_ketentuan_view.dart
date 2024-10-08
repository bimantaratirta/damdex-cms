import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/syarat_ketentuan_controller.dart';

class SyaratKetentuanView extends GetView<SyaratKetentuanController> {
  const SyaratKetentuanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const SelectableText(
          'Terms and Conditions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              'Terms and Conditions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'These terms and conditions apply to the Damdex app (hereby referred to as "Application") for mobile devices that was created by Damdex Indonesia (hereby referred to as "Service Provider") as a Free service.',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Upon downloading or utilizing the Application, you are automatically agreeing to the following terms. It is strongly advised that you thoroughly read and understand these terms prior to using the Application.',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Unauthorized copying, modification of the Application, any part of the Application, or our trademarks is strictly prohibited. Any attempts to extract the source code of the Application, translate the Application into other languages, or create derivative versions are not permitted.',
            ),
            SizedBox(height: 20),
            SelectableText(
              'The Service Provider is dedicated to ensuring that the Application is as beneficial and efficient as possible. As such, they reserve the right to modify the Application or charge for their services at any time and for any reason.',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Security & Responsibility',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'The Application stores and processes personal data that you have provided to the Service Provider in order to provide the Service. It is your responsibility to maintain the security of your phone and access to the Application.',
            ),
            SizedBox(height: 10),
            SelectableText(
              'Please note that the Application utilizes third-party services that have their own Terms and Conditions. Below are the links to the Terms and Conditions of the third-party service providers used by the Application:',
            ),
            SizedBox(height: 10),
            SelectableText(
              '- Google Play Services\n'
              '- Google Analytics for Firebase\n'
              '- Firebase Crashlytics',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Connectivity & Charges',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'Some functions of the Application require an active internet connection, which can be Wi-Fi or provided by your mobile network provider. The Service Provider cannot be held responsible if the Application does not function at full capacity due to lack of access to Wi-Fi or if you have exhausted your data allowance.',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Updates & Termination',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'The Service Provider may wish to update the Application at some point. The application is currently available as per the requirements for the operating system, and you will need to download the updates if you want to continue using the application. The Service Provider does not guarantee that it will always update the Application so that it is relevant to you and/or compatible with your operating system version.',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Changes to These Terms and Conditions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'The Service Provider may periodically update their Terms and Conditions. Therefore, you are advised to review this page regularly for any changes.',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Contact Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'If you have any questions or suggestions about the Terms and Conditions, please do not hesitate to contact the Service Provider at impact.team@damdex.com.',
            ),
          ],
        ),
      ),
    );
  }
}
