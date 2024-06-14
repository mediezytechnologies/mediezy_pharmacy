import 'dart:io';

import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Privacy policy"),
          centerTitle: true,
        ),
        bottomNavigationBar: Platform.isIOS
            ? SizedBox(
                height: size.height * 0.038,
                width: double.infinity,
              )
            : const SizedBox(),
        body: FadedSlideAnimation(
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const VerticalSpacingWidget(height: 10),
                  Text(
                    '''Your privacy is critically important to us.\nMediezy is located at:\n\n3rd Floor, 3E, Chandra tower, Near Vytilla junction, Kochi, Ernakulam, Kerala,682019, India.\n\nIt is Mediezy's policy to respect your privacy regarding any information we may collect while operating our website/App. This Privacy Policy applies to mediezy.com (hereinafter, "us", "we", or " www.mediezy.com"). We respect your privacy and are committed to protecting personally identifiable information you may provide us through the Website. We have adopted this privacy policy ("Privacy Policy") to explain what information may be collected on our Website, how we use this information, and under what circumstances we may disclose the information to third parties. This Privacy Policy applies only to information we collect through the Website and does not apply to our collection of information from other sources. This Privacy Policy, together with the Terms and conditions posted on our Website, set forth the general rules and policies governing your use of our Website. Depending on your activities when visiting our Website, you may be required to agree to additional terms and conditions.\n\nWebsite Visitors\nLike most website operators, Mediezy collects non-personally-identifying information of the sort that web browsers and servers typically make available, such as the browser type, language preference, referring site, and the date and time of each visitor request. Mediezy's purpose in collecting non-personally identifying information is to better understand how Mediezy's visitors use its website. From time to time, Mediezy may release non-personally-identifying information in the aggregate, e.g., by publishing a report on trends in the usage of its website. Mediezy also collects potentially personally-identifying information like Internet Protocol (IP) addresses for logged in users and for users leaving comments on mediezy.com blog posts. Mediezy only discloses logged in user and commenter IP addresses under the same circumstances that it uses and discloses personally-identifying information as described below\n\nGathering of Personally-Identifying Information\nCertain visitors to Mediezy's websites choose to interact with Mediezy in ways that require Mediezy to gather personally-identifying information. The amount and type of information that Mediezy gathers depends on the nature of the interaction. For example, when a visitor visits a doctor or any health care provider as well as when we ask visitors who sign up for a blog at mediezy.com to provide a username and email address.\n\nSecurity\nThe security of your Personal Information is important to us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Information, we cannot guarantee its absolute security.\n\nAdvertisements\nAds appearing on our website that will be delivered to users by us only. We or our advertising partners are not using cookies for any kind of advertisement.\n\nLinks To External Sites \nOur Service may contain links to external sites that are not operated by us. If you click on a third party link, you will be directed to that third party's site. We strongly advise you to review the Privacy Policy and terms and conditions of every site you visit. We have no control over, and assume no responsibility for the content, privacy policies or practices of any third party sites, products or services.
      \n\nmediezy.com uses Google AdWords for remarketing\nmediezy.com uses the remarketing services to advertise on third party websites (including Google) to previous visitors to our site. It could mean that we advertise to previous visitors who haven't completed a task on our site, for example using the contact form to make an enquiry. This could be in the form of an advertisement on the Google search results page, or a site in the Google Display Network. Third-party vendors, including Google, use cookies to serve ads based on someone's past visits. Of course, any data collected will be used in accordance with our own privacy policy and Google's privacy policy. You can set preferences for how Google advertises to you using the Google Ad Preferences page, and if you want to you can opt out of interest-based advertising entirely by cookie settings or permanently using a browser plugin.\n\nProtection of Certain Personally-Identifying Information
      Mediezy discloses potentially personally-identifying and personally-identifying information only to those of its employees, contractors, affiliated persons and organizations and health care providers that (i) need to know that information in order to process it on Mediezy's behalf or to provide services available at Mediezy's website, and (ii) that have agreed not to disclose it to others. Some of those employees, contractors and affiliated organizations may be located outside of your home country; by using Mediezy's website, you consent to the transfer of such information to them. Mediezy will not rent or sell potentially personally-identifying and personally-identifying information to anyone. Other than to its employees, contractors and affiliated organizations, as described above, Mediezy discloses potentially personally-identifying and personally-identifying information only in response to a subpoena, court order or other governmental request, or when Mediezy believes in good faith that disclosure is reasonably necessary to protect the property or rights of Mediezy, third parties or the public at large. If you are a registered user of mediezy.com and have supplied your email address, Mediezy may occasionally send you an email to tell you about new features, solicit your feedback, or just keep you up to date with what's going on with Mediezy and our products. We primarily use our blog / email / messaging service to communicate this type of information, so we expect to keep this type of email to a minimum. If you send us a request (for example via a support email or via one of our feedback mechanisms), we reserve the right to publish it in order to help us clarify or respond to your request or to help us support other users. Mediezy takes all measures reasonably necessary to protect against unauthorized access, use, alteration or destruction of potentially personally-identifying and personally-identifying information.
      \n\nAggregated Statistics\nMediezy may collect statistics about the behavior of visitors to its website. Mediezy may display this information publicly or provide it to others. However, Mediezy does not disclose your personally-identifying information unless mandated by law.\n\nAffiliate Disclosure\nThis site uses affiliate links and does earn a commission from certain links. This does not affect your purchases or the price you may pay.\n\nCookies\nTo enrich and perfect your online experience, Mediezy uses "Cookies", similar technologies and services provided by others to display personalized content, appropriate advertising and store your preferences on your computer. A cookie is a string of information that a website stores on a visitor's computer, and that the visitor's browser provides to the website each time the visitor returns. Mediezy uses cookies to help Mediezy identify and track visitors, their usage of mediezy.com, and their website access preferences. Mediezy visitors who do not wish to have cookies placed on their computers should set their browsers to refuse cookies before using Mediezy's websites, with the drawback that certain features of Mediezy's websites may not function properly without the aid of cookies. By continuing to navigate our website without changing your cookie settings, you hereby acknowledge and agree to Mediezy's use of cookies.\n\nBusiness Transfers\nIf Mediezy, or substantially all of its assets, were acquired, or in the unlikely event that Mediezy goes out of business or enters bankruptcy, user information would be one of the assets that is transferred or acquired by a third party. You acknowledge that such transfers may occur, and that any acquirer of Mediezy may continue to use your personal information only as set forth in this policy.\n\nPrivacy Policy Changes\nMediezy may change its Privacy Policy from time to time, and in Mediezy's sole discretion. Mediezy encourages visitors to frequently check this page for any changes to its Privacy Policy. Your continued use of this site after any change in this Privacy Policy will constitute your acceptance of such change.\n\n''',
                    style:
                        TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
