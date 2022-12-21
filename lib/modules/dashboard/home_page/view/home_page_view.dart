import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sidgs_it_app/generated/locale_keys.g.dart';
import 'package:sidgs_it_app/modules/dashboard/home_page/view_model/home_page_view_model.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return HomePageViewModel();
      },
      child: const HomePageScaffold(),
    );
  }
}
class HomePageScaffold extends StatefulWidget {
  const HomePageScaffold({super.key});


  @override
  State<HomePageScaffold> createState() => _HomePageScaffoldState();
}

class _HomePageScaffoldState extends State<HomePageScaffold> {

  HomePageViewModel get viewModel =>
      context.read<HomePageViewModel>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(LocaleKeys.homePageTitle.tr()),
      ),
      body: Center(

        child: Observer(
          builder: (context) {
            return Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  viewModel.counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>viewModel.incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


