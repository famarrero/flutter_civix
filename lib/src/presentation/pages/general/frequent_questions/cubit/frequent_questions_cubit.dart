import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_civix/src/data/models/faq/question_model.dart';
import 'package:flutter_civix/src/domain/repositories/local_assets_repository.dart';

part 'frequent_questions_state.dart';

class FrequentQuestionsCubit extends Cubit<FrequentQuestionsState> {
  final LocalAssetsRepository _localAssets;

  FrequentQuestionsCubit(this._localAssets)
      : super(FrequentQuestionsState.initial());

  Future<void> getFaq(String jsonFaq) async {
    emit(state.copyWith(loading: true, faqList: []));
    // await Future.delayed(Duration(seconds: 5));
    var faqResponse = await _localAssets.loadFaqJson(jsonFaq);
    List<QuestionModel> faqList = faqResponse.questionsList.toList();
    emit(state.copyWith(loading: false, faqList: faqList));
  }
}
