import 'package:flutter/material.dart';

class ViewImageWidget extends StatelessWidget {
  const ViewImageWidget({super.key, required this.viewFile});
  final String viewFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Center(child: Image(image: NetworkImage(viewFile)))],
      ),
    );
  }
}
