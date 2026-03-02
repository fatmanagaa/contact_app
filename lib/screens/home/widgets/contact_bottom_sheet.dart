import 'dart:io';

import 'package:contact_app/core/app_colors.dart';
import 'package:contact_app/core/app_styles.dart';
import 'package:contact_app/screens/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/contact_model.dart';

class ContactBottomSheet extends StatefulWidget {
  final Function(ContactModel) onContactAdded;

  const ContactBottomSheet({super.key, required this.onContactAdded});

  @override
  State<ContactBottomSheet> createState() => _ContactBottomSheetState();
}

class _ContactBottomSheetState extends State<ContactBottomSheet> {
  File? selectedImage;
  final ImagePicker picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  List<String> contacts = [];
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.darkGrey,
      height: 500,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: Column(
              spacing: 16,
              children: [
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: AppColors.gold, width: 2),
                      ),
                      child: GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColors.darkGrey,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: selectedImage == null
                              ? Icon(
                                  Icons.add_a_photo,
                                  color: AppColors.gold,
                                  size: 40,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: Image.file(
                                    selectedImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameController.text,
                            style: AppStyles.medium16Gold,
                          ),

                          Divider(color: AppColors.gold, thickness: 2),

                          Text(
                            emailController.text,
                            style: AppStyles.medium16Gold,
                          ),

                          Divider(color: AppColors.gold, thickness: 2),

                          Text(
                            phoneController.text,
                            style: AppStyles.medium16Gold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  spacing: 10,
                  children: [
                    CustomTextField(
                      labelStyle: AppStyles.medium16Gold,
                      hintText: 'Enter User Name',
                      hintStyle: AppStyles.medium16LightBlue,

                      fillColor: AppColors.darkGrey,
                      filled: true,
                      borderColor: AppColors.gold,
                      controller: nameController,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    CustomTextField(
                      hintText: 'Enter User Email',
                      hintStyle: AppStyles.medium16LightBlue,

                      fillColor: AppColors.darkGrey,
                      filled: true,
                      borderColor: AppColors.gold,
                        controller:
                        emailController,
                      onChanged: (value) {

                        setState(() {});
                      },
                    ),
                    CustomTextField(
                      hintText: 'Enter User Phone',
                      hintStyle: AppStyles.medium16LightBlue,

                      fillColor: AppColors.darkGrey,
                      filled: true,
                      borderColor: AppColors.gold,
                        controller:
                        phoneController,
                      onChanged: (value) {

                        setState(() {});
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gold,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          widget.onContactAdded(ContactModel(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            image: selectedImage,
                          ));


                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Enter User',
                        style: AppStyles.medium16DarkGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }
}
