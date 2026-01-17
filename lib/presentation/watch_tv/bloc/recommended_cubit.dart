import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/tv/usecases/get_recommended_tv.dart';
import 'package:spotify_clone/presentation/watch_tv/bloc/recommended_state.dart';
import 'package:spotify_clone/service_locator.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit() : super(RecommendedLoading());

  void getRecommendedTv(int id) async {
    var response = await sl<GetRecommendedTvUseCase>().call(id);

    response.fold((error) => emit(RecommendedLoadFailed(errorMessage: error)), (
      recommendedTv,
    ) {
      emit(RecommendedLoaded(recommendedTv: recommendedTv));
    });
  }
}
