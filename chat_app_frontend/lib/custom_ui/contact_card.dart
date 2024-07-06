import 'package:chat_app_frontend/models/chat_model.dart';
import 'package:chat_app_frontend/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key? key,
    required this.contact,
  }) : super(key: key);

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Pallete.darkGreyColor,
            radius: 23,
            child: SvgPicture.asset(
              contact.icon,
              color: Pallete.whiteColor,
              height: 30,
              width: 30,
            ),
          ),
          if (contact.select)
            Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                backgroundColor: Pallete.accentColor,
                radius: 11,
                child: Icon(
                  Icons.check,
                  color: Pallete.whiteColor,
                  size: 18,
                ),
              ),
            ),
        ],
      ),
      title: Text(
        contact.name,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        contact.status,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
