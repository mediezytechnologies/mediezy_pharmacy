import 'dart:io';

import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';

class TermsandConditionsScreen extends StatelessWidget {
  const TermsandConditionsScreen({super.key});

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
          title: const Text("Terms & Conditions"),
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
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The platform facilitates the services offered by various health care providers to the Users (hereinafter defined). The Users agree and acknowledge that Mediezy is not the vendor/ Medical Service Provider of the Services (as hereinafter defined) and Mediezy shall in no manner be deemed to be the Medical Service Provider of the Services on the Platform. Mediezy is only facilitating to the User the access to the Platform for the purpose of access and purchase of the Services from the Medical Service Providers. The Platform enables the Users/registered members of the Platform to obtain a list of third party health care/ Medical Service Providers available in a specific geographical area. Please note that Mediezy merely provides a generic list of all available health care and emergency care providers in a particular geographical area and does not endorse or provide any representations or warranties in respect of their quality, efficiency, specialization, skill, expertise or availability of such health care and emergency care providers.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "NATURE AND APPLICABILITY OF TERMS :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "Please carefully go through these terms and conditions (“Terms of Use”) and the privacy policy available at https://www.mediezy.com/privacy-policy(“Privacy Policy”) before you decide to access the Platform or avail the Services made available through the Platform by Mediezy. These Terms of Use and the Privacy Policy together constitute a legal agreement (“Agreement”) between you and Mediezy in connection with your visit to the Platform and your use of the Services.The Agreement is published in compliance of, and is governed by the provisions of Indian law, including but not limited to :\n1.The Indian Contract Act, 1872;\n2.The (Indian) Information Technology Act, 2000\n3.The rules, regulations, guidelines and clarifications framed there under, including the (Indian) Information Technology (Reasonable Security Practices and Procedures and Sensitive Personal Information) Rules, 2011 (the “SPI Rules”), and the (Indian) Information Technology (Intermediaries Guidelines) Rules, 2011 (the “IG Rules”).\n4.You expressly understand and agree that, to the maximum extent permitted by applicable law, the access to Platform, materials, Services and the information contained on the Platform is provided 'as is' and 'as available' basis without any warranty of any kind, expressed or implied, including but not limited to, the implied warranties of merchantability, fitness for a particular purpose, title and non-infringement.\n5.Without limiting the foregoing, Mediezy makes no warranty that the Platform or the Services will meet your requirements or your use of the Platform or the Services will be uninterrupted, timely, secure or error-free; the results that may be obtained from the use of the Platform or Services will be effective, accurate or reliable; the quality of the Platform or Services will meet your expectations; or that any errors or defects in the Platform, Services or other materials will be corrected.\n6.No advice or information, whether oral or written or otherwise, obtained by you from the Medical Service Provider through or from use of the Platform/Services shall create any warranty not expressly stated in these Terms of Use.\n7.You are solely responsible for any and all acts or omissions taken or made in reliance on the Platform, Services or the information in the Platform, including inaccurate or incomplete information.\n8.It is expressly agreed that in no event shall Mediezy be liable for any special, direct, indirect, incidental, consequential, remote, punitive or exemplary damages, including but not limited to, loss of profits or revenues, loss of use, or loss of information or data, whether a claim for any such liability or damages is premised upon breach of contract, breach of warranty, negligence, strict liability, or any other theory of liability, even if Mediezy have been apprised of the possibility or likelihood of such damages occurring.\n9.If you are registering an account or using the Platform on behalf of an individual or entity other than yourself, you represent that you are authorized by such individual or entity to accept these Terms of use on such individual's or entity's behalf.The Agreement applies to you whether you are :\n1.A Service Provider or health care service provider (whether an individual professional or an organization) or similar institution wishing to be listed, or already listed, on the Platform, including designated, authorized associates of such practitioners or institutions (“Medical Service Provider” or “Health Care Practitioner”, “you” or “User”); or\n2.A patient, his/her representatives or affiliates, searching for Service Provider or Heath Care Practitioners through the Platform (“End-User”, “you” or “User”); or\n3.Otherwise a user of the Platform (“you” or “User”).Everything Mediezy offers on the Platform is referred to in these Terms of Use collectively as the 'Services'. This Agreement applies to those Services made available by Mediezy on the Platform, which are offered free of charge or on chargeable basis to the Users including the following :\n1.For Medical Service Providers / Health Care Practitioners: Listing of Medical Service Providers / Health Care Practitioners and their profiles and contact details, to be made available to the other Users and visitors to the Platform;\n2.For other Users: Facility to (i) create and maintain ‘Health Accounts’, (ii) search for Health Care Practitioners by name, category, speciality, and geographical area, or any other criteria that may be developed and made available by Mediezy, and (iii) to make appointments with Health Care Practitioners / Medical Service Providers.Based on the sole discretion of Mediezy, the services offered through the Platform/app are subject to change., Accordingly, the Agreement will apply to your visit to and your use of the Platform to avail the Services, as well as to all information provided by you on the Platform at any given point in time. To actively participate or store your information, you must register as a member and authorize the use and disclosure of your personal and health information for purposes of allowing us to provide the Services and as otherwise disclosed in our Privacy Policy. Your access to use of the Platform and the Services will be solely at the discretion of Mediezy.To actively participate or store your information, you must register as a member and authorize the use and disclosure of your personal and health information for purposes of allowing us to provide the Services and as otherwise disclosed in our Privacy Policy. Your access to use of the Website and the Services will be solely at the discretion of Mediezy.The use of the Platform involves utility charges, Subscription charges etc as decided from time to time. The site may also have advertisements.BY USING THE Platform, AND/OR BY REGISTERING WITH US, YOU SIGNIFY THAT YOU AGREE TO THESE TERMS OF USE, including that you consent to the information disclosed in our Privacy Policy which is incorporated herein by reference.This Agreement defines the terms and conditions under which you are allowed to use the Platform and describes the manner in which Mediezy shall treat your account while you are registered as a member with us. If you have any questions about any part of the Agreement, feel free to contact us at support@mediezy.com.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "CONDITIONS OF USE :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "You should be 18 years of age or older to register, use the Services, or visit or use the Platform in any manner. By registering, visiting and using the Platform or accepting this Agreement, you represent and warrant to Mediezy that you are 18 years of age or older, and that you have the right, authority and capacity to use the Platform and the Services available through the Platform, and agree to and abide by this Agreement.If you are below 18 and register for the services through your guardian, you give deemed consent of parents and guardians and are bound by the policy and rules of Mediezy. Mediezy does not disallow anyone from registering as a patient and using the services.\nTerms of use (excluding practitioners)",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "NO DOCTOR-PATIENT RELATIONSHIP :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "The content, text, data, images, graphics, information, feedback, suggestions, guidance, ratings and other material (Hereafter collectively, “Information”) that is provided to you on the Platform (including information provided in direct response to your questions/postings) are gathered directly or indirectly and/or provided by individuals in the medical profession, the provision of such Information does not create a medical professional/patient relationship, and does not constitute an opinion, medical advice, recommendation or diagnosis or treatment of any particular condition, but is provided to assist you with locating appropriate medical care from a qualified doctor/ physicians/ surgeons, chemist/ pharmacist, hospitals/clinics, laboratories or ambulances.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "NOT FOR EMERGENCY USE :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "It is hereby expressly clarified that, the Information that you obtain or receive from Mediezy, and its employees, contractors, partners, sponsors, advertisers, licensors or otherwise on the Platform is for informational and scheduling purposes only. Furthermore, Mediezy does not in any way endorse any individual described herein. Mediezy makes no guarantees, representations or warranties, whether expressed or implied, with respect to professional qualifications, quality of work, expertise or other information provided on the Platform. Mediezy does not provide medical advice nor does it guarantee the availability of any Medical Service Provider / Health Care Practitioner at any particular time. All medically related information comes from independent health care professionals and organizations. In no event shall Mediezy be liable to you or anyone else for any decision made or action taken by you in reliance on such information. Further Mediezy will not be liable for rejected or otherwise unfulfilled appointments or any injury resulting therefrom, or for any other injury resulting from the use of the Platform or Services whatsoever.The information provided on the Platform and in any other communications from or provided through Mediezy is not intended as a substitute for, nor does it replace, professional medical advice, diagnosis, or treatment. Do not disregard, avoid or delay obtaining medical advice from a qualified health care professional because of something you may have read on the Platform. Your use of information provided on the Platform is solely at your own risk. Nothing stated or posted on the Platform or available through any Services is intended to be, and must not be taken to be, the practice of medicine or the provision of medical care.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "MEDICAL ADVICE DISCLAIMER :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "Mediezy does not recommend or endorse any specific tests, therapy, drugs, medicines, doctors, procedures, opinions, or other information that may appear on the Platform. If you rely on any of the Information provided by the Platform, you do so solely at your own risk.You are strongly advised to perform your own investigation prior to selecting a doctor or any Services selected from the Platform by making, confirming telephone calls to the appropriate licensing authorities to verify listed credentials and education, and to further verify information about a particular doctor, chemist, laboratory, hospital/clinic by confirming with the related authority, the medical association relative to the Doctor’s specialty or medical board.Neither the Platform nor Mediezy takes any responsibility for verification in terms of qualification of a doctor. A doctor or any other Service provider is verified as a “Registered Service Provider” on the basis of the documents uploaded by them. Neither the Platform nor Mediezy is responsible for errors in the documents uploaded by the doctor or other service provider.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "BOOKING AN APPOINTMENT :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "In connection with using the Platform and the Services to locate and book appointments with doctors, Allied health, ambulance or laboratory, you understand that:\n1.You are ultimately responsible for choosing the doctor or other verticals.\n2.Mediezy selects Services to be listed on the Platform with or without the consent of the doctors or laboratories. This information is collected for the purpose of facilitating interaction with the End Users and other Users.\n3.Mediezy is not liable if a confirmed appointment is later cancelled by a practitioner or the same practitioner is not available for the appointment.\n4.You agree that Mediezy may contact you through telephone, email, SMS,Whatsapp or any other electronic means of communication for the purpose of appointment management,confirmation of my credentials provided by me.i hereby authorize the Company(Mediezy) and its business associates to continue contacting me via any of the modes of communication listed above,till such time as i expressly opt-out/unsubscribe from the service offered by the company.Till such time,the company and its business associates shall have all rights to continue communicating with me and i shall completely indemnify them against any liability that may arise as a result of such authorization to communicate.Such indemnification shall extend to court cases and suits and all lawyer/advocate fees,even if the dispute is never subjected to judicial scrutiny.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "PRESCRIPTION :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "A digitally signed prescription validates the authenticity of the prescriptions issued by the Service Providers and keeps them accountable.A Service Provider shall not issue a prescription through the review/feedback mechanism.Prescription shall be a user’s primary guide for medical assistance as opposed to other general information/content available on the Platform.The Service Provider shall maintain the privacy of the data generated for the patients as per the governing laws.The patients shall be responsible for sharing their data including prescriptions and reports inside as well as outside the platform.Platform/LISTING ALGORITHM :Mediezy will provide you with lists and/or profile previews of Services which may be suitable to deliver the health care that you are seeking based on information that you provide to Mediezy (proximity to your geographical location, specialty or name).These listings of Health Care Practitioners do not represent any fixed objective ranking or endorsement by Mediezy. Mediezy will not be liable for any change in the relevance of the Health Care Practitioners on search results, which may take place from time to time.The listing of Health Care Practitioners will be based on automated computation of the various factors including inputs made by the Users including their comments and feedback. Such factors may change from time to time, in order to improve the listing algorithm.Mediezy in no event will be held responsible for the accuracy and the relevancy of the listing order of the Practitioners on the Platform. Mediezy does not recommend or endorse any Health care Practitioner, does not make any representations or warranties with respect to these Health Care Practitioners or the quality of the healthcare services they may provide.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "CONTENT/INFORMATION ON THE Platform :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "The Platform may be linked to the Platform of third parties, affiliates and business partners. Mediezy has no control over, and is not liable or responsible for content, accuracy, validity, reliability, quality of such Platforms or made available by/through our Platform. Inclusion of any link on the Platform does not imply that Mediezy endorses the linked site. User may use the links and these services at User’s own risk.Mediezy makes the Platform available as a service to consumers and providers for the purposes of providing an informative and educational resource. Mediezy may, but have no obligation to, have Information posted on the Platform reviewed by the Platform’s editorial personnel. It is important to note, however, that the timeliness and accuracy of any or all of the Information is not guaranteed. Neither the authors, the editorial personnel, nor any other party who has been involved in the preparation or publication of this work can assure you that the Information contained herein is in every respect accurate or complete, and they are not responsible for any errors or omissions or for the results obtained from the use of such Information.All of the Information available on or through the Services and/or the Platform, including without limitation, text, photographs, is owned by us and our licensors and is protected by copyright, trademark, patent, and trade secret laws, other proprietary rights, and international treaties. You acknowledge that the Services and any underlying technology or software used in connection with the Services contain Mediezy’s proprietary information. Mediezy gives you permission to use the aforementioned content for personal, non-commercial purposes only and do not transfer any intellectual property rights to you by virtue of permitting your use of the Services.You may print, download, and store information from the Platform for your own convenience, but you may not copy, distribute, republish (except as permitted in this paragraph), sell, or exploit any of the content, or exploit the Platform in whole or in part, for any commercial gain or purpose whatsoever. Except as is expressly and unambiguously provided herein, Mediezy and its suppliers do not grant you any express or implied rights, and all rights in the Platform and the Services not expressly granted by Mediezy to you are retained by Mediezy.You are encouraged to independently confirm the Information contained herein with other sources and to seek the advice of a qualified physician",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "HEALTH CARE PRACTITIONER INFORMATION :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "Medical Service Provider / Health Care Practitioner and practice information found on the Platform is intended for general reference purposes only. Medical Service Provider information found on the Platform is both self-reported, by the Medical Service Provider and/or office staff, and/or collected from multiple other data sources that may not be confirmed by the Medical Service ProviderSuch information often changes frequently and may become out of date or inaccurate. Mediezy uses reasonable efforts to ensure that Doctors/Laboratories /Chemists/Hospitals/ Ambulances only participate in the Services if they hold active medical licenses and all certifications necessary to practice any specialty of the services offered by them to patients.Mediezy may also exclude any User or Health Care Provider who, in Mediezy’s discretion, have engaged in inappropriate or unprofessional conduct without assigning any reasoning. Neither the Platform nor Mediezy provides any advice or qualification certification about any particular Medical Service Provider. Our relationship with Medical Service Providers in a particular area is based on criteria Mediezy established. You are encouraged to independently verify any such information. A Doctor authenticated by Mediezy is authenticated as per documents submitted by the Service Provider as a doctor. Mediezy does not guarantee the authenticity of the documents submitted.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "DEATH OF USER :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "On the Death of the User the Platform can be claimed by the Registered Nominee or anyone with access to the User’s Credentials or by an authentic Claimant. Mediezy shall not be responsible for any wrong claim or the misuse of such Claim. Mediezy shall not be responsible for the labeling of death of the User by a Service Provider. • Since any data involves multiple users or forms part of a system , the Data of any user cannot be deleted from the system. A user can make his profile inactive but his profile can still be searched with provision of such activity being reported as inappropriate if need be.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "USER INFORMATION :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "As part of the registration process, you will provide a mobile number, authentication and create a password. Emails and finger print may be requested. These are your credentials for accessing the Services that are only available to members ('Credentials'). You should keep your Credentials private and not share your Credentials with anyone else. You are responsible for notifying us if your password has been hacked or stolen. You may notify us by sending an email to support@mediezy.com.In order to register, you must provide certain personal and medical information about yourself. You may voluntarily submit, and hereby authorize Mediezy, its employees, agents and others operating on its behalf, to use and/or disclose personal and health-related information about you, including, without limitation, your name, address, contact information; medical and social history; current medical needs; and other information that is either requested by Mediezy or volunteered by you ('Personal Information') in order to provide the Services to you, in accordance with our Privacy Policy. The user is expected to read and understand the Privacy Policy, so as to ensure that the user has complete knowledge of the agreement he/she is entering into. Please review it carefully, as your use of the Platform constitutes your agreement to the Privacy Policy.User information may be shared as required to maintain the flow of information as required to service the user. This may include use of information provided directly and use of information by those indirectly connected to service the user.By accepting these Terms of Use and registering on the Platform, you consent to having data such as the working diagnosis, past medical records and prescriptions to be seen by the Medical Services Providers who have access to such records in order to provide Services to you.Mediezy further reserves the right to use your data towards purposes, like but not exclusive to, such as Statistical analysis, Geo Social analysis, Information System generation etc. Your personal Data is shared within the system where it is mandatory to maintain the services, where Mediezy feels it necessary and as may be requested by Statutory Government Bodies in accordance with Legal/ Financial or any such Requirements.As a Patient, you give permission for your medical records to be seen by Doctors and Health care providers who have access to your profile.As a Doctor, you give permission for your prescriptions to be seen by Health care workers whom the Patient has given access to.It is hereby informed that maintaining the confidentiality of the user’s account is the responsibility of the user. Therefore, notification has to be made immediately to Mediezy regarding any suspected unauthorized use of the account. Mediezy will not be liable for any losses caused by such unauthorized use of your account. However, you may be liable for losses caused to Mediezy or such other parties as the case may be due to any such unauthorized use of your account.By accepting these Terms of Use and by registering on the Platform, you consent to be contacted by Mediezy and by the Medical Service Providers and You further consent to receive emails,calls and messages (SMS,whatsapp) notifications and information at any time from us and from Medical Service Providers.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "PROHIBITED / RESTRICTED USE :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "1.You are responsible for all use of the Platform and for all use of your Credentials, including use by others to whom you have given your Credentials.\n2.You may use the Platform and the Services for lawful purposes only.\n3.You may not use the Platform in any manner that could damage, disable, overburden, or impair our servers or networks, or interfere with any other party's use and enjoyment of the Platform or the Services.\n4.You may not attempt to gain unauthorized access to any of the Services, user accounts, or computer systems or networks, through hacking, password mining or any other means.Without limiting any of the foregoing, you agree that you shall not (and you agree not to allow any third party to) :\n1.Copy, modify, adapt, translate, or reverse engineer any portion of the Platform, its content or materials and/or the Services;\n2.Remove any copyright, trademark or other proprietary rights notices contained in or on the Platform and/or the Services or in or on any content or other material obtained via the Platform and/or the Services;\n3.Use any robot, spider, Platform search/retrieval application, or other automated device, process or means to access, retrieve or index any portion of the Platform and/or the Services;\n4.Re-format or frame any portion of the web pages that are part of the Platform and/or the Services;\n5.Fraudulently misuse the Services by scheduling an appointment with a Medical Service Provider which you have no intention of keeping;\n6.Create user accounts by automated means or under false or fraudulent pretenses;\n7.Collect or store personal data about other users in connection with the prohibited activities described in this paragraph;\n8.Or use any means, including software means, to conduct web scraping of any portion of the Platform, its content or materials and/or the Services.\n9.Reproduce the Platform content, display, distribute or otherwise use the content in any way for any public or commercial purpose or for personal gain.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "TERMINATION/ SUSPENSION :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "If Mediezy determines that you have provided fraudulent, inaccurate, or incomplete information, including through feedback, Mediezy reserves the right to immediately suspend your access to the Platform or any of your accounts with Mediezy and makes such declaration on the Platform alongside your name/your clinic’s or centre’s name as determined by Mediezy for the protection of its business and in the interests of Users.Mediezy reserves the right to suspend or terminate your access to the Platform or any of your accounts with Mediezy at any time on its sole discretion if (a) you are in breach of these Terms; or (b) your use of the Platform or your accounts with Mediezy could cause risk of harm or loss to Mediezy or other users; or (c) any other reason deemed appropriate by Mediezy. For avoidance of doubt, Mediezy may make a determination that it does not want to continue offering you access to its Platform or any of your accounts at any time or for any reason with or without notice.In addition to Mediezy’s rights in these Terms of Use, Mediezy may take any legal action and implement any technical remedies to prevent the violation of this provision and to enforce these Terms of Use.Mediezy may change these Terms of Use at any time, as Mediezy reasonably deems appropriate. Upon any change in these Terms of Use, Mediezy will post the amended agreement on the Platform; Mediezy may also attempt to notify you in some other way. Your continued use of the Platform and/or the Services following such posting shall constitute your affirmative acknowledgement of the Terms of Use, the modification, and agreement to abide and be bound by the Terms of Use, as amended. If at any time you choose not to accept these Terms of Use, including following any such modifications hereto, then please do not use the Platform.The User or Medical Service Provider may have his use of the Platform Suspended or Terminated in the event of non-payment of dues to Mediezy. The User or Medical Service Provider may be Suspended or Terminated if he/she has any pending dues in the system.You may not use contact information provided by our users or collaborating Medical Service Providers, or harvest such information for the purpose of sending, or to facilitate the sending, of unsolicited bulk communications such as SPAM. You may not allow others to use your account to violate the terms of this section. Mediezy may terminate your membership or access to the Platform immediately and take other legal action if you or anyone using your Credentials violates these Terms of Use.Once the account is terminated due to any of the reasons as stated above, the user shall not have access to any data on the Platform. Mediezy shall not be liable for loss of data or data backup, Financial loss, difficulty in working or any such situations which may be faced by the User or Medical Service provider due to the Suspension or Termination. After termination or voluntary leaving of the platform, it shall be the sole discretion of Mediezy to maintain your records as well as those created or linked to you in the platform.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "FEEDBACK/REVIEWS :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "1.You will have the opportunity to submit feedback,comments,ideas,improvements or suggestions regarding your experiences with User/ Medical Service Providers who are featured on the Platform, to submit inquiries concerning possible medical needs and to participate in the other interactive and community features of the Platform (collectively “Posted Information”). It is important that you act responsibly when providing Posted Information. In providing feedback, please give clear, honest information about the Medical Service Provider and your experiences, but do not use inappropriate language, make gratuitous personal criticisms or comments. Mediezy shall be free to use, copy, modify,publish, or redistribute the suggestions, feedback,ideas,comments for any purpose and in any way without any credit or any compensation to you.\n2.Users should not use the review/feedback mechanism for emergency situations.\n3.You agree that Mediezy may contact you through telephone, email, SMS,whatsapp or any other electronic means of communication for the purpose of obtaining feedback in relation to Platform services, medical service providers, or for the purpose of resolving any complaints/queries by medical service providers.\n4.When participating in other interactive or community aspects of the Service, please do include all relevant information in a concise manner to help us provide you with a helpful response. You also give the right to the medical provider to review and rate you. If you resort to Violence or abuse, the medical provider may flag you which shall be seen across the system and out of the system by other Registered and Non Registered users/ service providers.\n5.If you have not paid the medical providers, the same shall be reflected in your profile as a flag with balance payable in the system. The same shall be reflected in your Profile and can be seen by all the Registered and Non Registered Members within and out of the System. The medical provider reserves the right to treat you or serve you in the system. The Medical provider too shall maintain the above discipline while making any reviews or comments in communication in any form.\n6.Any liability arising out of any response/statement issued by a Practitioner / service provider or User will be borne solely by them. The review/feedback mechanism is only a platform interface provided by Mediezy for the purpose of sharing and exchanging information.Mediezy reserves the right to publish your Posted Information as part of the Service and to also remove your Posted Information for any reason. Mediezy is not, however, responsible for any failure or delay in removing Posted Information. Keep in mind that the Posted Information of others is simply opinion and should not be relied on.Owing to the general nature of the feedback/review mechanism, the information posted by Service Providers try to answer several similar questions at once and need not be completely accurate on a case to case basis. Therefore, such information is not to be considered as medical advice.In addition: You are solely responsible for any Posted Information that you submit, publish or display on the Platform or transmit to other members and/or other users of the Platform.You may not post, distribute, or reproduce in any way any copyrighted material, trademarks, or other proprietary information without obtaining the prior written consent of the owner of such proprietary rights.You may not submit any content or material that infringes, misappropriates or violates the intellectual property, publicity, privacy or other rights of any party. You may not provide any Posted Information that falsely expresses or implies that such content or material is sponsored or endorsed by Mediezy.You agree that you will not upload, transmit, post, distribute or publish Posted Information to the Platform or Services that :\n1.Prevent, restrict or control any other User from using the Platform and Services\n2.Come under unlawful, fraudulent, threatening, harassing, abusive, defamatory, libellous, offensive, obscene, vulgar, profane, pornographic, indecent or sexually explicit content\n3.Lead to, encourage or conduct a criminal offence or cause civil liability or violate any local, state level, national or international law\n4.Plagiarize, violate, or infringe the various rights of other third parties including but not limited to copyright, trade secret, trademark, contract, confidentiality, patent, privacy rights, or proprietary right\n5.Contain spyware, malware, virus or any other harmful component\n6.Contain advertising, embedded links, chain letters, or pyramid schemes\n7.Contain misleading or false information, endorsement or statements of fact.\n8.You may not provide any Posted Information that is unlawful or that promotes or encourages illegal activity.\n9.Use of feedback/review mechanism by any User/ Service provider to share their personal, religious and/or moral views is not allowed.\n10.You understand and agree that Mediezy may (but is not obligated to) review and delete any Posted Information that in the sole judgement of Mediezy violates these Terms of Use or which might be offensive, illegal, or that might violate the rights of, harm, or threaten the safety of other users or members of the Platform and/or other Platform users.\n11.You agree that you will only provide Posted Information that you believe to be true and you will not purposely provide false or misleading information.By posting Posted Information on the Platform, you agree to and hereby do grant, and you represent and warrant that you have the right to grant, Mediezy, its contractors, and the users of the Platform an irrevocable, perpetual, royalty-free, fully sub-licensable, fully paid up, worldwide license to use, copy, publicly perform, digitally perform, publicly display, and distribute such Posted Information and to adapt, edit, translate, prepare derivative works of, or incorporate into other works, such Posted Information. This license is non-exclusive, except you agree that Mediezy shall have the exclusive right to practice this license to the extent of combining your Posted Information with the Posted Information of other Mediezy users for purposes of constructing or populating a searchable database of reviews and information related to the healthcare industry.On using the Platform, you agree that any information such as ‘posted information’ shared by you through the Feedback/Review mechanism is bound by our Privacy Policy and shall be subject to the same.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "LIMITATION OF LIABILITY :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "Mediezy has no special relationship with or without fiduciary character to you. You acknowledge that Mediezy has no control over, and no duty to take any action regarding: which users gain access to the Platform and/or the Services; what content you access via the Platform and/or the Services; what affects the content on the Platform and/or the Services may have on you; how you may interpret or use the content on the Platform and/or the Services; or what actions you may take as a result of having been exposed to the content on the Platform and/or the Services.You release Mediezy from all liability for you having acquired or not acquired content through the Platform and/or the Services. The Platform and/or the Services may contain, or direct you to other Platforms containing, information that some people may find offensive or inappropriate.Mediezy disclaims all liability arising out of the User’s use or reliance upon the Platform, the Services, representations and warranties made by other Users, the content or information provided by the Users on the Platform, or any opinion or suggestion given or expressed by Mediezy or any User in relation to any User or services provided by such User.Mediezy works hard to ensure the Services is always up and available, but Mediezy  can’t guarantee that the Services will not have downtime for any reason. Mediezy reserve the right to close the Services for short periods of time for general maintenance, but will attempt to keep this to a minimum. Mediezy will not be liable if for any reason all or any part of the Services is unavailable at any time, for any length of time.Mediezy makes no representations concerning any content contained in or accessed through the Platform and/or the Services, and Mediezy will not be responsible or liable for the accuracy, copyright compliance, legality or decency of material contained in or accessed through the Platform and/or the Services.Mediezy may from time to time add new services to the Services, substitute a new service for one of the existing Services, or discontinue or suspend one of the existing Services. Information about the new services will be included on the Platform, and the use of new services will be governed by these Terms of Use. You agree that Mediezy will not be liable to you or any third party for any suspension or discontinuation of any of the Services.Mediezy does not guarantee that the results that may be obtained from the use of the services will be effective, reliable or accurate or will meet your requirements.Mediezy does not guarantee that you will be able to access or use the services (either directly or through third-party networks) at times or locations of your choosing.Mediezy is not responsible for the accuracy, reliability, timeliness or completeness of information provided by users of the Platform or any other data or information provided or received through the Platform except as expressly set forth herein, Mediezy makes no warranties about the information systems, software and functions made accessible through the Platform or any other security associated with the transmission of sensitive information.Mediezy does not warrant that the Platform or the services will operate error-free, that loss of data will not occur, or that the services, software or Platform are free of computer viruses, contaminants or other harmful items. Mediezy assumes no responsibility, and shall not be liable for, any damages to, or viruses that may infect user’s equipment on account of user’s access to, use of, or browsing the Platform or the downloading of any material, data, text, images, video content, or audio content from the Platform. If a user is dissatisfied with the Platform, the user's sole remedy is to discontinue using the Platform.Your sole and exclusive remedy for any dispute with Mediezy is the cancellation of your registration. In no event shall Mediezy’S total cumulative liability to you for any and all claims relating to or arising out of your use of the services or the Platform, regardless of the form of action, exceed the greater of: (a) the total amount of fees, if any, that you paid to register for the Platform or the services.In no event shall Mediezy be liable to you (or to any third party claiming under or through you) for any indirect, special, incidental, consequential or exemplary damages arising from your use of, or inability to use, the Platform and/or the services. These exclusions apply to any claims for lost profits, lost data, loss of goodwill, work stoppage, computer failure or malfunction, any other commercial damages or losses, or medical malpractice or negligence of medical service providers utilized through use of the service, even if Mediezy knew or should have known of the possibility of such damages. Mediezy’S liability shall be limited to the maximum extent permitted by law.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "INDEMNIFICATION :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "You agree to defend, indemnify, and hold harmless Mediezy, Mediezy’s employees, contractors, officers, directors, agents, parent, other affiliated companies, suppliers, successors, and assigns from all liabilities, claims, demands and expenses, including attorney's fees, made by any third party that arise from or are related to (a) your access to, or inability to access, the Platform or the content, materials, functions related thereto, (b) your use of the Services, or (c) the violation of these Terms of Use, or of any intellectual property or other right of any person or entity, by you or any third party using your Credentials, (d) any other matter relating to the Platform or the Service. The foregoing indemnification obligation does not apply to liabilities, claims and expenses arising as a result of Mediezy’s own gross negligence or intentional misconduct.Your affirmative act of using the Platform and/or registering for the Platform or the Services constitutes your electronic signature to these Terms of Use, which includes our Privacy Policy, and your consent to enter into agreements with us electronically.It is Mediezy’s policy to (a) block access to or remove material that it believes in good faith to be copyrighted material that has been illegally copied and distributed by any of our advertisers, affiliates, content providers, members or users; and (b) remove and discontinue Service to repeat offenders.If it is found that you have provided inaccurate or incomplete information you shall be liable to indemnify Mediezy for any losses incurred as a result of your misrepresentations or fraudulent feedback that has adversely affected Mediezy or its UsersIf any news/information that is uploaded on the Platform results in infringement of intellectual property rights of any other person :\n1.Mediezy has the right to remove such content.\n2.The uploader of such news/.information agrees to absolve and indemnify Mediezy from all intellectual property infringement claims that may arise from a third party due to the uploading of such new/information.\n3.Procedure for Reporting Copyright Infringements.If you believe that material or content residing on or accessible through the Platform or the Services infringes a copyright, please send a notice of copyright infringement containing the following information to Mediezy ('Proper Bona Fide Infringement Notification'):A physical or electronic signature of a person authorized to act on behalf of the owner of the copyright that has been allegedly infringed;\nIdentification of works or materials being infringed;\nIdentification of the material that is claimed to be infringing including information regarding the location of the infringing materials that the copyright owner seeks to have removed, with sufficient detail so that Mediezy is capable of finding and verifying its existence;Contact information about the notifier including address, telephone number and, if available, email address;A statement that the notifier has a good faith belief that the material is not authorized by the copyright owner, its agent, or the law; andA statement made under penalty of perjury that the information provided is accurate and the notifying party is authorized to make the complaint on behalf of the copyright owner.Upon Receipt of a Proper Bona Fide Infringement Notification.Once a Proper Bona Fide Infringement Notification is received by Mediezy, it is Mediezy’s policy:To remove or disable access to the infringing material;To notify the content provider, member or user that it has removed or disabled access to the material;And that for repeat offenders, Mediezy will also terminate such content providers, member's or user's access to the Service.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "ENTIRE AGREEMENT :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "These Terms of Use and any supplemental terms, policies, rules and guidelines posted on the Platform, including the Privacy Policy, constitute the entire Agreement between you and Mediezy and supersede all previous written or oral agreements. If any part of these Terms of Use is held invalid or unenforceable, that portion shall be construed in a manner consistent with applicable law to reflect, as nearly as possible, the original intentions of the parties, and the remaining portions shall remain in full force and effect.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "WAIVER :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "The failure of Mediezy to exercise or enforce any right or provision of these Terms of Use shall not constitute a waiver of such right or provision. The failure of either party to exercise in any respect any right provided for herein shall not be deemed a waiver of any further rights hereunder.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "APPLICABLE LAW AND DISPUTE SETTLEMENT :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "These Terms of Use shall be deemed to have been entered into and shall be construed and enforced in accordance with the laws of the State as applied to contracts made and to be performed entirely within India.Any controversy, dispute or claim arising out of or related to this Agreement, including the scope or applicability of this Agreement to arbitrate, or use of the Platform or the Services or information to which it gives access, shall be determined by arbitration in India, before a sole arbitrator appointed by Mediezy.Arbitration shall be conducted in accordance with the Arbitration and Conciliation Act, 1966. The seat of Arbitration shall be Ernakulam,Kerala. All proceedings of such arbitration, including, without limitation, any awards, shall be in English language. The award shall be final and binding on the Parties to the dispute.Subject to clauses as mentioned above, the Courts of Ernakulam shall have exclusive jurisdiction over any disputes arising out of or in relation to this Agreement, your use of the Platform or the Services or the information to which it gives access.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "ASSIGNMENT :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "Mediezy may assign this Agreement at any time to any parent, subsidiary, or any affiliated company, or as part of the sale to, merger with, or other transfer of our company to another entity. Mediezy will use reasonable efforts to notify you regarding any change of ownership. You may not assign, transfer or sublicense these Terms of Use to anyone else and any attempt to do so in violation of this section shall be null and void.ANNEXURES",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "ADDITIONAL POLICIES :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "Additional policies as mentioned are process flow which are subject to change as and when deemed necessary by Mediezy.Centres :\n1.Orders will be automatically cancelled within 24 hours if the Centres does not accept the order request or if the user fails to make the payment after the order request is accepted by the Centres.\n2.Both the user and the centre Centres reserve the right to cancel the order at any time before the user makes the payment.\n3.If the Centre cancels an order after accepting and receiving payment from the user, a cancellation fee will be charged from the Centre Centres, unless the order has been modified by the patient. In case of cancellation after making changes by patient, the utility fees will be borne by the patient.\n4.If an order is not marked as complete within 48 hours, the order will be automatically cancelled. The Centre Centres will be liable to pay a cancellation fee of 5% of the total order amount, and the entire amount will be refunded to the patient.\n5.Cancellation charges will be deducted from the centre / Centres wallet. If there is no balance available in the wallet, it will go into the balance payable. After two consecutive cancellations, the centre Centres will not be able to accept new orders until the outstanding amount is cleared.\n7.The centre and their sub centres shall honour the cost, discount, online payments and service terms as mentioned in their registration and displayed to the Users. Mediezy may take action including suspension or termination of the registration and apply any penalty for non compliance.Doctor/ Allied Branches :Terms and Conditions for Online Paid Clinic Appointments:\n1.All online paid Appointments will be automatically marked as complete after 11:59 PM on the day of the appointment if no action is taken by the doctor or patient.\n2.The doctor/ Allied Branches reserves the right to cancel clinic appointments at any time, This will refund the amount to the patient's wallet after deducting the utility fees and other fees as applicable.\n3.Patients can cancel clinic appointments at any time before the scheduled start time of the appointment and the amount will be refunded to the patient's wallet after deducting a utility fee and other fees as applicable.\nTerms and Conditions for Home Visits :\n1.Both the doctor/ Allied Branches and patient reserve the right to cancel home visits at any time.\n2.If the doctor/ Allied Branches cancels a home visit appointment after the payment is done by the patient, a cancellation fee and other fees as applicable will be charged to the doctor/ Allied Branches.\n3.Cancellation charges will be deducted from the doctor's/ Allied Branches wallet. If there is no balance available in the wallet, it will go into negative payable. Doctors/ Allied Branches will continue to receive home visit booking requests but won't be able to accept any bookings until the outstanding amount is cleared.\n4.If a patient cancels a home visit request after payment, the fees will be refunded to the patient's wallet after deducting utility charge and other fees as applicable.Doctors/ Allied branches shall honour the cost, discount, online payments and service terms as mentioned in their registration and displayed to the Users. Mediezy may take action including suspension or termination of the registration and apply any penalty for non compliance.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "USE OF THE APPLICATION OUTSIDE INDIA :",
                      style:
                          size.width > 450 ? blackTabMainText : blackMainText,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "Mediezy health Platform has been made keeping in mind the health Scenarios in India. Any User using the App within or outside India should use the Application keeping in mind the requirements of the local / country laws towards use of such applications. Mediezy does not take responsibility towards the use of the Application in any Country by the User.YOU HAVE READ THESE TERMS OF USE AND AGREE TO ALL OF THE PROVISIONS CONTAINED ABOVE.",
                      style:
                          TextStyle(fontSize: size.width > 450 ? 11.sp : 14.sp),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
