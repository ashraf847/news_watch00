import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../application/time2string.dart';

class AuthorComponent extends StatelessWidget {
  const AuthorComponent({
    super.key,
    this.imageUrl,
    required this.name,
    required this.date,
  });
  final String? imageUrl;
  final String name;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(100)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: imageUrl == null
                ? SvgPicture.asset(
                    fit: BoxFit.fill,
                    height: 24,
                    width: 24,
                    "assets/svg/no-image.svg")
                : Image.network(
                    height: 48,
                    width: 48,
                    imageUrl!,
                  ),
          ),
        ),
        Gap(10),
        Text(name),
        Spacer(),
        Text(
          timeAgoSinceDate(d: date),
        )
      ],
    );
  }
}
