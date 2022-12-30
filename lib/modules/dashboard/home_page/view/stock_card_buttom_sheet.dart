import 'package:flutter/material.dart';
import 'package:sidgs_it_app/modules/dashboard/home_page/view/transaction_card.dart';

class CardButtomSheet extends StatelessWidget {
  const CardButtomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height/2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
        child: Column(
          children:  [
            const Text("Recent Transaction",style: TextStyle(fontSize: 20, color: Colors.black),),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, position) {
                  return TransactionCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
