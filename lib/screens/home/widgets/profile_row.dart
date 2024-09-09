import 'package:flutter/material.dart';
import 'package:salary_calculator/domain/config/navigation.dart';
import 'package:salary_calculator/utils/colors.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({
    super.key,
    required this.userName,
    required this.avatar,
  });

  final String userName;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 48.0,
          width: 48.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://static.wikia.nocookie.net/thelastofus/images/3/34/Part_II_Ellie_infobox.png/revision/latest/scale-to-width-down/1200?cb=20230215221019'),
            ),
          ),
        ),
        const SizedBox(
          width: 12.0,
        ),
        Text(userName),
        const SizedBox(
          width: 12.0,
        ),
        const InkWell(
          child: Icon(
            Icons.arrow_forward_ios,
            size: 14.0,
            color: AppColors.hintText,
          ),
        ),
      ],
    );
  }
}
