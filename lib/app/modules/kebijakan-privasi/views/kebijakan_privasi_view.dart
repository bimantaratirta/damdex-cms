import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kebijakan_privasi_controller.dart';

class KebijakanPrivasiView extends GetView<KebijakanPrivasiController> {
  const KebijakanPrivasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const SelectableText(
          'Privacy Policy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              'Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'This privacy policy applies to the Damdex app (hereby referred to as "Application") for mobile devices that was created by Damdex Indonesia (hereby referred to as "Service Provider") as a Free service. This service is intended for use "AS IS".',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Information Collection and Use',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'The Application collects information when you download and use it. This information may include information such as:\n\n'
              '- Your device\'s Internet Protocol address (e.g. IP address)\n'
              '- The pages of the Application that you visit, the time and date of your visit, the time spent on those pages\n'
              '- The time spent on the Application\n'
              '- The operating system you use on your mobile device\n\n'
              'The Application collects your device\'s location, which helps the Service Provider determine your approximate geographical location and make use of in below ways:\n\n'
              '- Geolocation Services: The Service Provider utilizes location data to provide features such as personalized content, relevant recommendations, and location-based services.\n'
              '- Analytics and Improvements: Aggregated and anonymized location data helps the Service Provider to analyze user behavior, identify trends, and improve the overall performance and functionality of the Application.\n'
              '- Third-Party Services: Periodically, the Service Provider may transmit anonymized location data to external services. These services assist them in enhancing the Application and optimizing their offerings.',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Third Party Access',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'Only aggregated, anonymized data is periodically transmitted to external services to aid the Service Provider in improving the Application and their service. The Service Provider may share your information with third parties in the ways that are described in this privacy statement.\n\n'
              'Please note that the Application utilizes third-party services that have their own Privacy Policy about handling data. Below are the links to the Privacy Policy of the third-party service providers used by the Application:\n\n'
              '- Google Play Services\n'
              '- Google Analytics for Firebase\n'
              '- Firebase Crashlytics',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Opt-Out Rights',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'You can stop all collection of information by the Application easily by uninstalling it. You may use the standard uninstall processes as may be available as part of your mobile device or via the mobile application marketplace or network.',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Data Retention Policy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'The Service Provider will retain User Provided data for as long as you use the Application and for a reasonable time thereafter. If you\'d like them to delete User Provided Data that you have provided via the Application, please contact them at impact.team@damdex.com and they will respond in a reasonable time.',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Children',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'The Service Provider does not use the Application to knowingly solicit data from or market to children under the age of 13. The Application does not address anyone under the age of 13.',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Security',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'The Service Provider is concerned about safeguarding the confidentiality of your information. The Service Provider provides physical, electronic, and procedural safeguards to protect information the Service Provider processes and maintains.',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Changes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'This Privacy Policy may be updated from time to time for any reason. The Service Provider will notify you of any changes to the Privacy Policy by updating this page with the new Privacy Policy.',
            ),
            SizedBox(height: 20),
            SelectableText(
              'Your Consent',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            SelectableText(
              'By using the Application, you are consenting to the processing of your information as set forth in this Privacy Policy now and as amended by us.',
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
              'If you have any questions regarding privacy while using the Application, or have questions about the practices, please contact the Service Provider via email at impact.team@damdex.com.',
            ),
          ],
        ),
      ),
    );
  }
}
