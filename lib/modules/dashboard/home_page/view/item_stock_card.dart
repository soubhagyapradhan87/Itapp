import 'package:flutter/material.dart';
import 'package:sidgs_it_app/modules/dashboard/home_page/view/stock_card_buttom_sheet.dart';

class HomePageCard extends StatelessWidget {
  String? itemName;
  int? availableStock;
  IconData? icon;

  HomePageCard({Key? key, this.itemName, this.availableStock, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context){
              return const CardButtomSheet();
            }
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.cyan,
              ],
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      icon,
                      color: Colors.cyan,
                      size: 25,
                    ),
                  ),
                  Text(
                    itemName!,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                availableStock!.toString(),
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
              const Text(
                "Available",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Tap to view",
                style: TextStyle(fontSize: 12, color: Colors.white30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
