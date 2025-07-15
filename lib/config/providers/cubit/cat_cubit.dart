import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  CatCubit()
    : super(
        const CatInitial(image: 'assets/images/cat-sleep', action: 'durmiendo'),
      );

  void updateCat({required String image, required String action}) {
    emit(CatState.update(image: image, action: action));
  }
}
