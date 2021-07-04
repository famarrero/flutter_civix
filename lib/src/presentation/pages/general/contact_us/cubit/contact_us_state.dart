part of 'contact_us_cubit.dart';

class ContactUsState extends Equatable {
  final bool loading;
  final ContactUsResponseModel? contactUs;

  const ContactUsState({required this.contactUs, required this.loading});

  factory ContactUsState.initial() =>
      ContactUsState(contactUs: null, loading: false);

  ContactUsState copyWith(
      {ContactUsResponseModel? contactUs, bool? loading}) {
    return ContactUsState(
        contactUs: contactUs ?? this.contactUs, loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [contactUs, loading];
}
