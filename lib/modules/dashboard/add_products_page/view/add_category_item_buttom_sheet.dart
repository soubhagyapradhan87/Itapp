import 'package:flutter/material.dart';

class AddCategoryItemButtomSheet extends StatelessWidget {
  const AddCategoryItemButtomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height/2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
        child: Column(
          children: [
            Text("Please enter the RAM size to add the collection")
          ],
        ),
      ),
    );
  }
}
