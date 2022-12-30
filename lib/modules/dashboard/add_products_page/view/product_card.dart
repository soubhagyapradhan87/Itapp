import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sidgs_it_app/modules/dashboard/add_products_page/view_model/add_products_view_model.dart';

class ProductCard extends StatefulWidget {
  String? productName;
  IconData? icon;

  ProductCard({Key? key, this.productName, this.icon}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  AddProductsPageViewModel get viewModel => context.read<AddProductsPageViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return InkWell(
          onTap: () {
            viewModel.setClickedCardString(widget.productName!);
          },
          child: Container(
            width: viewModel.clickedCardString == widget.productName ?170:120,
            decoration: BoxDecoration(
              color: viewModel.clickedCardString == widget.productName ? Colors.blueAccent : Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.cyan, width: 0.5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.blueAccent,
                  blurRadius: 4.0,
                  spreadRadius: 0.1,
                  offset: Offset(
                    0.5,
                    0.5,
                  ),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: viewModel.clickedCardString == widget.productName ?Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    widget.icon,
                    size:  40 ,
                    color:  Colors.white ,
                  ),
                  Text(
                    widget.productName!,
                    style: const TextStyle(
                        color:  Colors.white ,
                        fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ):Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    widget.icon,
                    size:  35 ,
                    color:  Colors.black ,
                  ),
                  Text(
                    widget.productName!,
                    style: const TextStyle(
                        color:  Colors.black ,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
