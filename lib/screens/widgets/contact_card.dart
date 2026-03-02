import 'package:contact_app/core/app_styles.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../model/contact_model.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;
  final VoidCallback onDelete;

  const ContactCard({required this.contact, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: contact.image != null
                  ? Image.file(
                      contact.image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : Container(
                      color: AppColors.darkGrey,
                      child: Icon(Icons.person),
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.name, style: AppStyles.small14DarkGrey),
                Text(contact.email, style: AppStyles.small10DarkGrey),
                Text(contact.phone, style: AppStyles.small10DarkGrey),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onDelete,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.delete, size: 16), Text("Delete")],
            ),
          ),
        ],
      ),
    );
  }
}
