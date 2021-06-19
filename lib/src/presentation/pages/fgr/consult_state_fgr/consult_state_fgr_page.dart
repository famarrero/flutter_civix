import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';
import 'package:flutter_civix/src/domain/entities/statement_response_consult.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/consult_state_fgr/cubit/consult_state_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_card.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_dialog_box.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_reactive_text_field.dart';
import 'package:flutter_civix/src/presentation/widgets/dialog_progress_widget.dart';
import 'package:flutter_civix/src/presentation/widgets/statement_item_list_widget.dart';
import 'package:flutter_civix/src/presentation/widgets/statement_response_consult_widget.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ConsultStateFgrPage extends StatelessWidget {
  final ConsultStateFgrCubit bloc;

  ConsultStateFgrPage({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).consultState),
          SizedBox(height: 4),
          Text(S.of(context).fgr, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    return BlocProvider.value(
        value: bloc,
        child: BlocConsumer<ConsultStateFgrCubit, ConsultStateFgrState>(listener: (context, state) {
          if (state.loading) {
            showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext dialogContext) => DialogProgressWidget('Consulting...'));
          }
          if (state.statmentsResponseConsult != null) {
            Navigator.of(context).pop();
          }
        }, builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  SizedBox(height: 25),
                  CustomCard(
                    child: Column(
                      children: [
                        ReactiveForm(
                          formGroup:
                              Provider.of<ConsultStateFgrCubit>(context).getconsultStateFgrForm,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: CustomReactiveTextField(
                              formControlName: FormConsultStateFgr.tiked,
                              validationMessages: (control) =>
                                  {ValidationMessage.required: S.of(context).tikedCorrectValidator},
                              label: S.of(context).enterTiked,
                              icon: Icons.vpn_key_outlined,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              maxLength: 5,
                              mandatory: true,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomElevatedButton(
                                buttonText: S.of(context).consult,
                                onPressed: () =>
                                    BlocProvider.of<ConsultStateFgrCubit>(context).consultState()),
                            SizedBox(width: 4),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  _buildResponse(context, state)
                ],
              ),
            ),
          );
        }));
  }

  _buildResponse(BuildContext context, ConsultStateFgrState state) {
    if (state.statmentsResponseConsult != null) {
      return Column(
        children: [
          StatmentResponseConsultWidget(statement: state.statmentsResponseConsult!),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomElevatedButton(
                  buttonText: S.of(context).save,
                  onPressed: () => CustomDialogs().customDialogInformation(
                      context: context,
                      icon: Icons.report_gmailerrorred_sharp,
                      colorIcon: Colors.blue,
                      title: 'Confirmación!',
                      message: '¿Desea guardar este planteamiento en la aplicación?',
                      buttonPositiveName: 'Guardar',
                      buttonPositiveAction: () {},
                      buttonNegativeName: 'Cancelar')),
            ],
          ),
        ],
      );
    } else if (state.error != null) {
      return Center(child: Text(state.error!));
    } else {
      return Container();
    }
  }
}
