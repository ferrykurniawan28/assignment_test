import 'package:assignment_test/features/portofoliio/data/model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'portofolio_state.dart';

class PortofolioCubit extends Cubit<PortofolioState> {
  List<PortofolioModel> portofolioItems = [];
  PortofolioCubit() : super(PortofolioInitial());

  // Add your methods to manage state here
  void loadPortofolio() {
    // Simulate loading data
    emit(PortofolioLoading());
    try {
      // Simulate fetching data
      portofolioItems = dummyPortofolio;
      emit(PortofolioLoaded(portofolioItems));
    } catch (e) {
      emit(PortofolioError('Failed to load portofolio'));
    }
  }

  void searchPortofolio(String query) {
    if (query.isEmpty) {
      emit(PortofolioLoaded(portofolioItems));
      return;
    }
    final results = portofolioItems
        .where(
          (item) =>
              item.title.toLowerCase().contains(query.toLowerCase()) ||
              item.description.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    if (results.isEmpty) {
      emit(PortofolioEmpty());
    } else {
      emit(PortofolioSearch(results));
    }
  }
}
