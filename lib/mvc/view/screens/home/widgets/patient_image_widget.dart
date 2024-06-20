import 'dart:developer';

import 'package:flutter/material.dart';

class PatientImageWidget extends StatelessWidget {
  const PatientImageWidget({
    super.key,
    required this.patientImage,
    required this.radius,
  });

  final String? patientImage;
  final double radius;

  @override
  Widget build(BuildContext context) {
    log(patientImage.toString());
    return patientImage == "null" || patientImage == null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: radius,
                backgroundImage:
                    const AssetImage("assets/icons/profile pic.png")),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: radius,
                backgroundImage: NetworkImage(patientImage.toString())),
          );
  }
}
