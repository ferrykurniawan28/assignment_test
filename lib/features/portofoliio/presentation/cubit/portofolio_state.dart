part of 'portofolio_cubit.dart';

@immutable
sealed class PortofolioState {}

final class PortofolioInitial extends PortofolioState {}

final class PortofolioLoading extends PortofolioState {}

final class PortofolioLoaded extends PortofolioState {
  final List<PortofolioModel> items;

  PortofolioLoaded(this.items);
}

final class PortofolioSearch extends PortofolioState {
  final List<PortofolioModel> results;

  PortofolioSearch(this.results);
}

final class PortofolioError extends PortofolioState {
  final String message;

  PortofolioError(this.message);
}

final class PortofolioEmpty extends PortofolioState {}
