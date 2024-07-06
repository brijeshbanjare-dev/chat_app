import 'package:chat_app_frontend/models/chat_model.dart';
import 'package:chat_app_frontend/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvtarCard extends StatelessWidget {
  const AvtarCard({
    Key? key,
    required this.contact,
    required this.onRemove,
  }) : super(key: key);

  final ChatModel contact;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Pallete.darkGreyColor,
                radius: 25,
                child: SvgPicture.asset(
                  contact.icon,
                  color: Pallete.whiteColor,
                  height: 30,
                  width: 30,
                ),
              ),
              Positioned(
                top: -4,
                right: -4,
                child: GestureDetector(
                  onTap: onRemove,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.close,
                      color: Pallete.whiteColor,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 50),
            child: Text(
              contact.name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
