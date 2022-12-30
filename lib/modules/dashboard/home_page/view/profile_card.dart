import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sidgs_it_app/generated/locale_keys.g.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(20),

      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(20)
              ),
              child: Icon(Icons.person),
            ),
            Text(LocaleKeys.companyName.tr())
          ],
        ),
      ),
    );
  }
}
