import 'package:flutter/material.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_details_card.dart';

class EmployeeAccessoriesComponent extends StatelessWidget {
  const EmployeeAccessoriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Laptop Details:",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold ),),
            ],
          ),
          const SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EmployeeDetailsCard(
                title: "Device Name",
                description: "DESKTOP-K153RRC",
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: EmployeeDetailsCard(
                title: "Company",
                description: "Dell",
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: EmployeeDetailsCard(
                title: "Serial No",
                description: "2R6ZNL3",
              ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: EmployeeDetailsCard(
                title: "RAM",
                description: "16 GB",
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: EmployeeDetailsCard(
                title: "Hard Disk",
                description: "512 GB",
              ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: EmployeeDetailsCard(
                title: "Configuration",
                description: "Window 10",
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: EmployeeDetailsCard(
                title: "Processor",
                description: "i7 Processor",
              ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text(
                    "Windows 10 Block USB Drivers:",
                    style: TextStyle(fontSize: 16),
                  )),
                  Expanded(
                      child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 16),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text(
                    "Bitlocker:",
                    style: TextStyle(fontSize: 16),
                  )),
                  Expanded(
                      child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 16),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text(
                    "ScreenLock:",
                    style: TextStyle(fontSize: 16),
                  )),
                  Expanded(
                      child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 16),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text(
                    "Copy & Paste blocked in Mobile Device:",
                    style: TextStyle(fontSize: 16),
                  )),
                  Expanded(
                      child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 16),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text(
                    "Enrolled  Devices( Mobile & Laptop Windows):",
                    style: TextStyle(fontSize: 16),
                  )),
                  Expanded(
                      child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 16),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text(
                    "Windows Update:",
                    style: TextStyle(fontSize: 16),
                  )),
                  Expanded(
                      child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 16),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text(
                    "Windows Update:",
                    style: TextStyle(fontSize: 16),
                  )),
                  Expanded(
                      child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 16),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text(
                    "Created App protection policies For IOS & Android:",
                    style: TextStyle(fontSize: 16),
                  )),
                  Expanded(
                      child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 16),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text(
                    "Hide Fast User Switching:",
                    style: TextStyle(fontSize: 16),
                  )),
                  Expanded(
                      child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 16),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text(
                    "Acknowledgement of Company Asset:",
                    style: TextStyle(fontSize: 16),
                  )),
                  Expanded(
                      child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 16),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text(
                    "Intune Status: ",
                    style: TextStyle(fontSize: 16),
                  )),
                  Expanded(
                      child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 16),
                  ))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Desktop Details:",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold ),),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: EmployeeDetailsCard(
                    title: "Company",
                    description: "Dell",
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: EmployeeDetailsCard(
                    title: "Model",
                    description: "DELL-56467",
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Mouse Details:",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold ),),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: EmployeeDetailsCard(
                    title: "Company",
                    description: "Dell",
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: EmployeeDetailsCard(
                    title: "Model",
                    description: "DELL-m546",
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Headphone Details:",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold ),),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: EmployeeDetailsCard(
                    title: "Company",
                    description: "VTALK",
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: EmployeeDetailsCard(
                    title: "Model",
                    description: "vt-45gt5",
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
