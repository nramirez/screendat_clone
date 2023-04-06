import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const Markdown(
        data: '''
Itrydat LLC ("us", "we", or "our") operates the Screendat mobile application and the Itrydat.com website (collectively referred to as the "Service").

This page informs you of our policies regarding the collection, use, and disclosure of personal information when you use our Service and the choices you have associated with that data.

By using the Service, you agree to the collection and use of information in accordance with this policy.

1. Information Collection and Use

We collect several different types of information for various purposes to provide and improve our Service to you.

Types of Data Collected:

a. Personal Data

While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you ("Personal Data"). Personally identifiable information may include, but is not limited to:

- Email address
- First name and last name
- Cookies and Usage Data

b. Usage Data

We may also collect information that your browser sends whenever you visit our Service or when you access the Service by or through a mobile device ("Usage Data").

2. Use of Data

Itrydat LLC uses the collected data for various purposes:

- To provide and maintain our Service
- To notify you about changes to our Service
- To allow you to participate in interactive features of our Service when you choose to do so
- To provide customer support
- To gather analysis or valuable information so that we can improve our Service
- To monitor the usage of our Service
- To detect, prevent, and address technical issues

3. Disclosure of Data

We may disclose your Personal Data in the good faith belief that such action is necessary to:

- Comply with a legal obligation
- Protect and defend the rights or property of Itrydat LLC
- Prevent or investigate possible wrongdoing in connection with the Service
- Protect the personal safety of users of the Service or the public
- Protect against legal liability

4. Security of Data

The security of your data is important to us, but remember that no method of transmission over the Internet, or method of electronic storage, is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.

5. Links to Other Sites

Our Service may contain links to other sites that are not operated by us. If you click on a third-party link, you will be directed to that third party's site.
''',
      ),
    );
  }
}
