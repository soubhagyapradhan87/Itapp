import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view_model/employee_details_page_view_model.dart';

class EmployeeCard extends StatefulWidget {
  String? title;
  IconData? icon;

  EmployeeCard({Key? key, this.title, this.icon}) : super(key: key);

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  EmployeeDetailsPageViewModel get viewModel => context.read<EmployeeDetailsPageViewModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            color: Colors.white,
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
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                widget.icon,
                size: 25,
              ),
              Text(
                widget.title!,
                style: const TextStyle(fontSize: 22),
              ),
              IconButton(
                  onPressed: () {
                    viewModel.setClickedCardString(widget.title!);
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 30,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
