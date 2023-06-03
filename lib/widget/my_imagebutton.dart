import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String ImagePath;
  final Function()? onTap;
  const ImageButton({Key? key, required this.ImagePath, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200]),
        child: Image.asset(
          ImagePath,
          height: 40,
        ),
      ),
    );
  }
}
