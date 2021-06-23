import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/data/models/municipality_model.dart';
import 'package:flutter_civix/src/data/models/province_model.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/manager/provinces_list_cubit/provinces_list_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_dropdown_filed.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_reactive_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddEditPromoterDialog extends StatelessWidget {
  final BuildContext blocContext;
  final String title;
  final bool isEdit;
  final int? index;

  AddEditPromoterDialog(
      {required this.blocContext, required this.title, required this.isEdit, this.index});

  @override
  Widget build(BuildContext context) {
    var getCubit = BlocProvider.of<WriteStatementFgrCubit>(blocContext);
    var getCubitListenFalse = BlocProvider.of<WriteStatementFgrCubit>(blocContext, listen: false);
    return AlertDialog(
      title: Text(title),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      insetPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8),
      content: BlocProvider(
        create: (context) => injector<ProvincesListCubit>()..getProvinces(),
        child: BlocBuilder<ProvincesListCubit, ProvincesListState>(
          builder: (context, state) {
            var _provincesList = state.provinceList;
            return Container(
              width: 315,
              height: double.infinity,
              child: ReactiveForm(
                formGroup: getCubit.getAddEditPromoterForm(isEdit: isEdit),
                child: ListView(
                  children: [
                    SizedBox(height: 12),
                    CustomReactiveTextField(
                      formControlName: FormsStatementFGR.firstName,
                      validationMessages: (control) =>
                          {ValidationMessage.pattern: S.of(context).firstNameCorrectValidator},
                      label: S.of(context).firstName,
                      suffixIcon: Icons.person,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                      maxLength: 25,
                    ),
                    SizedBox(height: 12),
                    CustomReactiveTextField(
                      formControlName: FormsStatementFGR.secondName,
                      validationMessages: (control) =>
                          {ValidationMessage.pattern: S.of(context).secondNameCorrectValidator},
                      label: S.of(context).secondName,
                      suffixIcon: Icons.person,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                      maxLength: 25,
                    ),
                    SizedBox(height: 12),
                    CustomReactiveTextField(
                      formControlName: FormsStatementFGR.firstLastName,
                      validationMessages: (control) =>
                          {ValidationMessage.pattern: S.of(context).firstLastNameCorrectValidator},
                      label: S.of(context).firstLastName,
                      suffixIcon: Icons.person,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                      maxLength: 25,
                    ),
                    SizedBox(height: 12),
                    CustomReactiveTextField(
                      formControlName: FormsStatementFGR.secondLastName,
                      validationMessages: (control) =>
                          {ValidationMessage.pattern: S.of(context).secondLastNameCorrectValidator},
                      label: S.of(context).secondLastName,
                      suffixIcon: Icons.person,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                      maxLength: 25,
                    ),
                    SizedBox(height: 12),
                    CustomReactiveTextField(
                      formControlName: FormsStatementFGR.id,
                      validationMessages: (control) => {
                        ValidationMessage.pattern: S.of(context).idCorrectValidator,
                      },
                      label: S.of(context).id,
                      suffixIcon: Icons.vpn_key,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLines: 1,
                      maxLength: 11,
                    ),
                    SizedBox(height: 12),
                    CustomReactiveTextField(
                      formControlName: FormsStatementFGR.phone,
                      validationMessages: (control) =>
                          {ValidationMessage.pattern: S.of(context).phoneCorrectValidator},
                      label: S.of(context).phone,
                      suffixIcon: Icons.phone,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLines: 1,
                      maxLength: 8,
                    ),
                    SizedBox(height: 12),
                    CustomReactiveTextField(
                      formControlName: FormsStatementFGR.email,
                      validationMessages: (control) =>
                          {ValidationMessage.email: S.of(context).emailCorrectValidator},
                      label: S.of(context).email,
                      suffixIcon: Icons.alternate_email,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      maxLength: 25,
                    ),
                    SizedBox(height: 12),
                    CustomDropdownFiled<ProvinceModel>(
                      formControlName: FormsStatementFGR.province,
                      validationMessages: (control) =>
                          {ValidationMessage.required: S.of(context).provinceRequiredValidator},
                      label: S.of(context).province,
                      mandatory: true,
                      suffixIcon: Icons.location_city,
                      itemBuilder: (item) => Text(item.provinceName),
                      loadFunction: () => _provincesList,
                    ),
                    SizedBox(height: 24),
                    ReactiveValueListenableBuilder<ProvinceModel>(
                      formControlName: FormsStatementFGR.province,
                      builder: (context, valueProvince, child) {
                        return CustomDropdownFiled<MunicipalityModel>(
                          formControlName: FormsStatementFGR.municipality,
                          validationMessages: (control) => {
                            ValidationMessage.required: S.of(context).municipalityRequiredValidator
                          },
                          label: S.of(context).municipality,
                          mandatory: true,
                          suffixIcon: Icons.location_city,
                          itemBuilder: (item) => Text(item.municipalityName),
                          loadFunction: () => valueProvince.value != null
                              ? valueProvince.value!.municipalitiesList.toList()
                              : [],
                        );
                      },
                    ),
                    SizedBox(height: 24),
                    CustomReactiveTextField(
                      formControlName: FormsStatementFGR.address,
                      label: S.of(context).address,
                      suffixIcon: Icons.location_on,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.streetAddress,
                      maxLines: 1,
                      maxLength: 100,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => {
                  //reset form
                  getCubitListenFalse.getAddEditPromoterForm(isEdit: false).reset(),
                  Navigator.of(context).pop(),
                },
            child: Text(S.of(context).cancel)),
        TextButton(
            onPressed: () => {
                  if (isEdit)
                    {
                      getCubitListenFalse.editPromoter(context, index!),
                    }
                  else
                    {
                      getCubitListenFalse.addPromoter(context),
                    }
                },
            child: Text(S.of(context).ok)),
      ],
    );
  }
}
