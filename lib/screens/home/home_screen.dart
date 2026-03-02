import 'dart:io';

import 'package:contact_app/core/app_animations.dart';
import 'package:contact_app/core/app_assets.dart';
import 'package:contact_app/core/app_colors.dart';
import 'package:contact_app/core/app_styles.dart';
import 'package:contact_app/screens/home/widgets/contact_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../model/contact_model.dart';
import '../widgets/contact_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContactModel> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(2),
          child: Image.asset(AppAssets.logoPhoto),
        ),
        leadingWidth: 100,
      ),
      body: contacts.isEmpty ? buildEmptyScreen() : buildGridView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showContactModalBottomSheet(context);

          setState(() {});
        },
        backgroundColor: AppColors.gold,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Icon(Icons.add, color: AppColors.darkGrey, size: 28),
      ),
    );
  }

  Widget buildEmptyScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppAnimations.emptyList),
          SizedBox(height: 20),
          Text("There is No Contacts Added Here", style: AppStyles.bold20Gold),
        ],
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      itemCount: contacts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return ContactCard(
          contact: contacts[index],
          onDelete: () {
            setState(() {
              contacts.removeAt(index);
            });
          },
        );
      },
    );
  }

  void showContactModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => ContactBottomSheet(
        onContactAdded: (newContact) {
          setState(() {
            contacts.add(newContact);
          });
        },
      ),
    );
  }
}
