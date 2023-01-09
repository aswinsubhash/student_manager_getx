import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProfileImage extends GetView {
  final String img;
  final Size size;
  final double radius;

  const CustomProfileImage({
    Key? key,
    required this.img,
    required this.size,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('asset/images/person-icon.png'),
        ),
      ),
      child: img.toString().trim().isNotEmpty
          ? CircleAvatar(
              radius: radius,
              backgroundImage: MemoryImage(
                const Base64Decoder().convert(
                  img.toString(),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
