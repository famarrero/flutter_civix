part of 'frequent_questions_cubit.dart';

class FrequentQuestionsState extends Equatable {
  final bool loading;
  final List<QuestionModel> faqList;

  const FrequentQuestionsState({required this.faqList, required this.loading});

  factory FrequentQuestionsState.initial() =>
      FrequentQuestionsState(faqList: [], loading: false);

  FrequentQuestionsState copyWith(
      {List<QuestionModel>? faqList, bool? loading}) {
    return FrequentQuestionsState(
        faqList: faqList ?? this.faqList, loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [faqList, loading];
}
