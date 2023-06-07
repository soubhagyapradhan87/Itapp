import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sidgs_it_app/modules/dashboard/accessories_page/view_model/accessories_page_view_model.dart';

class AccessoriesPage extends StatelessWidget {
  const AccessoriesPage({Key? key}) : super(key: key);

  static const route = '/accessories_page';

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return AccessoriesPageViewModel();
      },
      child: const AccessoriesPageScaffold(),
    );
  }
}

class AccessoriesPageScaffold extends StatefulWidget {
  const AccessoriesPageScaffold({super.key});

  @override
  State<AccessoriesPageScaffold> createState() => _AccessoriesPageScaffoldState();
}

class _AccessoriesPageScaffoldState extends State<AccessoriesPageScaffold> {
  AccessoriesPageViewModel get viewModel => context.read<AccessoriesPageViewModel>();
  late TextEditingController _serialNoTextEditingController;

  @override
  void initState() {
    _serialNoTextEditingController=TextEditingController(text: viewModel.serialNo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Accessories Details",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Observer(builder: (context) {
            _serialNoTextEditingController.text=viewModel.serialNo;
            return Column(
              children: [
                Text(
                  "Laptop:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
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
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: TextField(
                                  controller: _serialNoTextEditingController,
                                  onChanged: (val) {
                                    viewModel.checkSerialNo(val.trim());
                                  },

                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Please Enter Serial no',
                                  ),
                                ),
                              ),
                            ),
                            viewModel.checkSerialNo(viewModel.serialNo)==false?IconButton(
                                onPressed: () {

                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.green,
                                )):IconButton(
                                onPressed: () {
                                  viewModel.scanBarCode().then((value) {
                                    viewModel.checkSerialNo(viewModel.serialNo);
                                  });
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.blueAccent,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
        )));
  }
}
