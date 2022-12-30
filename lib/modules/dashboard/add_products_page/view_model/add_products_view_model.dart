import 'package:easy_localization/easy_localization.dart';
import 'package:mobx/mobx.dart';
import 'package:sidgs_it_app/generated/locale_keys.g.dart';

part 'add_products_view_model.g.dart';

class AddProductsPageViewModel = _AddProductsPageViewModel with _$AddProductsPageViewModel;

abstract class _AddProductsPageViewModel with Store {
  @observable
  String model = '';

  @observable
  bool isSubmitting = false;

  @observable
  String clickedCardString = '';

  @computed
  String? get modelError {
    if (model.trim().isEmpty) {
      return LocaleKeys.requiredError.tr();
    }
    return null;
  }

  @action
  void setClickedCardString(String val) => clickedCardString = val;

  @action
  void setModel(String val) => model = val;

  @computed
  bool get canSubmit => modelError == null;
}
