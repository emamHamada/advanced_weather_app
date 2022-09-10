// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quotes_feature_state.dart';

class QuotesFeatureCubit extends Cubit<QuotesFeatureState> {
  QuotesFeatureCubit() : super(QuotesFeatureInitial());
}
