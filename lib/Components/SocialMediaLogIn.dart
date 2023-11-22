import 'package:flutter/material.dart';
import 'package:full_login_register/Util/Colors.dart';
import 'package:full_login_register/Util/Image.dart';

class SocialMediaLogIn extends StatelessWidget {
  const SocialMediaLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          _socialMediaItem(context, ImageEnum.google.toPath, "Google"),
          _socialMediaItem(context, ImageEnum.apple.toPath, "Apple"),
        ],
      ),
    );
  }

  Expanded _socialMediaItem(BuildContext context, String image, String title) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: MediaQuery.of(context).size.height * 0.075,
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: black.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(width: 35, image: AssetImage(image)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: VerticalDivider(
                width: 1.5,
                thickness: 1.5,
                color: black.withOpacity(0.5),
              ),
            ),
            Text(
              "With $title",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
