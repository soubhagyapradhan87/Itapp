import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:sidgs_it_app/modules/services/firebase_service.dart';

part 'home_page_view_model.g.dart';

class HomePageViewModel = _HomePageViewModel with _$HomePageViewModel;

abstract class _HomePageViewModel with Store {
  _HomePageViewModel(){
    //fetchItemCount();
    subscribeToItemCount();
  }

  @observable
  int count=0;

  StreamSubscription<int>? subscription;


  void subscribeToItemCount() {
     subscription =
    FireBaseService().getItemCountStream().listen((int total) {
      count=total;
      print('Total item count: $count');
    });

  }
  void cancelSubscription() {
    subscription!.cancel();
    print("subscription cancel");
  }

}