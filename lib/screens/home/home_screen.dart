import 'package:contact_app/core/app_animations.dart';
import 'package:contact_app/core/app_assets.dart';
import 'package:contact_app/core/app_colors.dart';
import 'package:contact_app/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> contacts=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.all(2),
          child: Image.asset(AppAssets.logoPhoto),
        ),
        leadingWidth: 100,
      ),
      body: contacts.isEmpty
          ? buildEmptyScreen()
          : buildGridView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            contacts.add("New Contact");
          });
        },
        backgroundColor: AppColors.gold,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          Icons.add,
          color:AppColors.darkGrey,
          size: 28,
        ),
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
          Text(
            "There is No Contacts Added Here",
            style: AppStyles.bold20Gold,
          ),
        ],
      ),
    );
  }
  Widget buildGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      itemCount: contacts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blueGrey,
          child: Center(
            child: Text(
              contacts[index],
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

}
