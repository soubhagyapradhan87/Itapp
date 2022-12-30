import 'package:flutter/material.dart';


class TransactionCard extends StatelessWidget {
  IconData? icon;
   TransactionCard({Key? key,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: const Icon(
                  Icons.laptop_mac,
                  color: Colors.blueAccent,
                  size: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Laptop",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    Text(
                      "Assigned to Soubhagya",
                      style: TextStyle(fontSize: 12, color: Colors.black26),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Date",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    Text(
                      "20/05/2022",
                      style: TextStyle(fontSize: 12, color: Colors.black26),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
