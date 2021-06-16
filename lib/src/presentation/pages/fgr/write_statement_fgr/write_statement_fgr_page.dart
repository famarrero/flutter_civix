import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/widgets/add_edit_promoter_dialog.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/widgets/show_promoters.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_reactive_text_field.dart';
import 'package:flutter_civix/src/presentation/widgets/dialog_progress_widget.dart';
import 'package:flutter_civix/src/presentation/widgets/menu_buttom_sheet.dart';
import 'package:flutter_civix/src/presentation/widgets/show_files_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class WriteStatementFgrPage extends StatefulWidget {
  final WriteStatementFgrCubit bloc;

  WriteStatementFgrPage({required this.bloc});

  @override
  _WriteStatementFgrPageState createState() => _WriteStatementFgrPageState();
}

class _WriteStatementFgrPageState extends State<WriteStatementFgrPage> {
  _deleteFile(int index) {
    widget.bloc.deleteFile(index);
  }

  _openGallery() {
    widget.bloc.getImageFormCameraOrGallery(source: 'gallery');
    Navigator.of(context).pop();
  }

  _openDocuments() {
    widget.bloc.getDocument();
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    widget.bloc.getSavedStatement();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(context));
  }

  _buildAppBar() {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).writeStatement),
          SizedBox(height: 4),
          Text(S.of(context).fgr, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
        ],
      ),
      actions: [
        IconButton(
          tooltip: S.of(context).saveEraser,
          icon: Icon(Icons.save),
          onPressed: () => widget.bloc.savedStatement(),
        ),
      ],
    );
  }

  _buildBody(BuildContext context) {
    return BlocProvider.value(
        value: widget.bloc,
        child: BlocConsumer<WriteStatementFgrCubit, WriteStatementFgrState>(
            listener: (context, state) {
          print(state);
          if (state.stateSendStatement.isSending) {
            showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext dialogContext) => DialogProgressWidget('Sending statement'));
          }
          if (state.stateSendStatement.done) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }
          if (state.stateSendStatement.error != null) {
            print(state.stateSendStatement.error);
          }
          if (state.stateOfFiles.isLoading) {
            showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext dialogContext) => DialogProgressWidget('Processing image'));
          }
          if (state.stateOfFiles.done) {
            Navigator.of(context).pop();
          }
          if (state.stateOfFiles.error != null) {
            showToast(state.stateOfFiles.error!,
                duration: Duration(seconds: 3),
                position: ToastPosition.bottom,
                backgroundColor: Colors.black.withOpacity(0.7));
          }
          if (state.showMessage != null && state.showMessage != '') {
            showToast(state.showMessage!,
                duration: Duration(seconds: 3),
                position: ToastPosition.bottom,
                backgroundColor: Colors.black.withOpacity(0.7));
          }
        }, builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: ReactiveForm(
              formGroup: Provider.of<WriteStatementFgrCubit>(context).getAddStatementForm,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: [
                        SizedBox(height: 25),
                        CustomReactiveTextField(
                          formControlName: FormsStatementFGR.subject,
                          validationMessages: (control) =>
                              {ValidationMessage.required: S.of(context).subjectValidator},
                          label: S.of(context).enterSubject,
                          icon: Icons.short_text,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          maxLength: 150,
                          mandatory: true,
                        ),
                        SizedBox(height: 20),
                        CustomReactiveTextField(
                          formControlName: FormsStatementFGR.statement,
                          validationMessages: (control) =>
                              {ValidationMessage.required: S.of(context).statementValidator},
                          label: S.of(context).enterStatement,
                          icon: Icons.wrap_text,
                          textInputAction: TextInputAction.newline,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.multiline,
                          minLines: 6,
                          maxLines: null,
                          maxLength: 3000,
                          mandatory: true,
                        ),
                        SizedBox(height: 20),
                        if (state.stateOfPromoters.promoters.isNotEmpty)
                          ShowPromoters(state.stateOfPromoters.promoters),
                        SizedBox(height: 20),
                        CustomElevatedButton(
                            buttonText: S.of(context).addPromoter,
                            onPressed: () => (state.stateOfPromoters.promoters.length >= 1)
                                ? null
                                : showDialog<void>(
                                    context: context,
                                    builder: (BuildContext dialogContext) => AddEditPromoterDialog(
                                          blocContext: context,
                                          title: S.of(context).addPromoter,
                                          isEdit: false,
                                        ))),
                        SizedBox(height: 20),
                        ShowFiles(
                          files: state.stateOfFiles.pickedFiles.toList(),
                          buttonDeleteIsVisible: true,
                          deleteFile: _deleteFile,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          heroTag: 'attachments',
                          backgroundColor: Colors.blue,
                          tooltip: S.of(context).attachments,
                          onPressed: () {
                            return MenuBottomSheet().openMenuBottomSheet(
                                context: context,
                                filesCount: state.stateOfFiles.pickedFiles.length,
                                openGallery: _openGallery,
                                openDocuments: _openDocuments);
                          },
                          elevation: 0,
                          child: Icon(Icons.attach_file),
                        ),
                        FloatingActionButton(
                          heroTag: 'camera',
                          backgroundColor: (state.stateOfFiles.pickedFiles.length < 3)
                              ? Colors.blue
                              : Colors.black.withOpacity(0.1),
                          tooltip: S.of(context).camera,
                          onPressed: (state.stateOfFiles.pickedFiles.length < 3)
                              ? () => BlocProvider.of<WriteStatementFgrCubit>(context)
                                  .getImageFormCameraOrGallery(source: 'camera')
                              : null,
                          elevation: 0,
                          child: Icon(FontAwesomeIcons.camera),
                        ),
                        FloatingActionButton(
                          heroTag: 'send',
                          backgroundColor: Colors.blue,
                          tooltip: S.of(context).send,
                          onPressed: () =>
                              BlocProvider.of<WriteStatementFgrCubit>(context).sendStatement(),
                          elevation: 0,
                          child: Icon(Icons.send_rounded),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
