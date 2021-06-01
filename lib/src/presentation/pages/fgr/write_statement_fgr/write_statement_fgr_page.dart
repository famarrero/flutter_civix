import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/utils/utils.dart';
import 'package:flutter_civix/src/domain/entities/promoter_fgr.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/dialog_progress_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:built_collection/built_collection.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class WriteStatementFgrPage extends StatefulWidget {
  @override
  _WriteStatementFgrPageState createState() => _WriteStatementFgrPageState();
}

class _WriteStatementFgrPageState extends State<WriteStatementFgrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(context));
  }

  _buildAppBar() {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S().writeStatement),
          SizedBox(height: 4),
          Text(S().fgr,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<WriteStatementFgrCubit>(),
      child: BlocConsumer<WriteStatementFgrCubit, WriteStatementFgrState>(
          listener: (context, state) {
        print(state);
        if (state.stateSendStatement.isSending) {
          showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext dialogContext) =>
                  DialogProgressWidget('Sending statement'));
        }
        if (state.stateSendStatement.done) {
          Navigator.of(context).pop();
          print('done');
        }
        if (state.stateSendStatement.error != null) {
          print(state.stateSendStatement.error);
        }
        if (state.stateOfFiles.isLoading) {
          showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext dialogContext) =>
                  DialogProgressWidget('Processing image'));
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
      }, builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: ReactiveForm(
            formGroup: Provider.of<WriteStatementFgrCubit>(context)
                .getAddStatementForm,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: [
                      SizedBox(height: 25),
                      ReactiveTextField(
                        formControlName: FormsStatementFGR.subject,
                        validationMessages: (control) =>
                            {ValidationMessage.required: S().subjectValidator},
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        maxLength: 150,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: S().enterSubject,
                          icon: Icon(Icons.short_text),
                        ),
                      ),
                      SizedBox(height: 20),
                      ReactiveTextField(
                        formControlName: FormsStatementFGR.statement,
                        validationMessages: (control) => {
                          ValidationMessage.required: S().statementValidator
                        },
                        textInputAction: TextInputAction.newline,
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.multiline,
                        minLines: 6,
                        maxLines: null,
                        maxLength: 3000,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: S().enterStatement,
                          icon: Icon(Icons.wrap_text),
                        ),
                      ),
                      SizedBox(height: 20),
                      if (state.stateOfPromoters.promoters.isNotEmpty)
                        _ShowPromoters(state.stateOfPromoters.promoters),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                        onPressed:
                            (state.stateOfPromoters.promoters.length >= 1)
                                ? null
                                : () => showDialog<void>(
                                    context: context,
                                    builder: (BuildContext dialogContext) =>
                                        _AddPromoterDialog(
                                          blocContext: context,
                                        )),
                        child: Text(
                          S().addPromoter,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      _ShowFiles(state.stateOfFiles.pickedFiles)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        heroTag: 'attachments',
                        backgroundColor: Colors.blue,
                        tooltip: S().attachments,
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              context: context,
                              builder: (_) {
                                return _MenuBottomSheet(
                                    context, state.stateOfFiles.pickedFiles);
                              });
                        },
                        elevation: 0,
                        child: Icon(Icons.attach_file),
                      ),
                      FloatingActionButton(
                        heroTag: 'camera',
                        backgroundColor:
                            (state.stateOfFiles.pickedFiles.length < 3)
                                ? Colors.blue
                                : Colors.black.withOpacity(0.1),
                        tooltip: S().camera,
                        onPressed: (state.stateOfFiles.pickedFiles.length < 3)
                            ? () =>
                                BlocProvider.of<WriteStatementFgrCubit>(context)
                                    .getImageFormCameraOrGallery(
                                        source: 'camera')
                            : null,
                        elevation: 0,
                        child: Icon(FontAwesomeIcons.camera),
                      ),
                      FloatingActionButton(
                        heroTag: 'send',
                        backgroundColor: Colors.blue,
                        tooltip: S().send,
                        onPressed: () =>
                            BlocProvider.of<WriteStatementFgrCubit>(context)
                                .sendStatement(),
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
      }),
    );
  }
}

class _MenuBottomSheet extends StatelessWidget {
  final BuildContext blocContext;
  final BuiltList<File> files;

  const _MenuBottomSheet(this.blocContext, this.files);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'gallery',
            tooltip: S().gallery,
            backgroundColor:
                (files.length < 3) ? Colors.red : Colors.black.withOpacity(0.1),
            onPressed: (files.length < 3)
                ? () {
                    BlocProvider.of<WriteStatementFgrCubit>(blocContext)
                        .getImageFormCameraOrGallery(source: 'gallery');
                    Navigator.of(context).pop();
                  }
                : null,
            elevation: 0,
            child: Icon(FontAwesomeIcons.fileImage),
          ),
          FloatingActionButton(
            heroTag: 'documents',
            tooltip: S().document,
            backgroundColor: (files.length < 3)
                ? Colors.green
                : Colors.black.withOpacity(0.1),
            onPressed: (files.length < 3)
                ? () {
                    BlocProvider.of<WriteStatementFgrCubit>(blocContext)
                        .getDocument();
                    Navigator.of(context).pop();
                  }
                : null,
            elevation: 0,
            child: Icon(FontAwesomeIcons.fileAlt),
          ),
          FloatingActionButton(
            heroTag: 'location',
            tooltip: S().location,
            backgroundColor: Colors.orange,
            onPressed: (files.length < 3) ? () {} : null,
            elevation: 0,
            child: Icon(FontAwesomeIcons.locationArrow),
          ),
        ],
      ),
    );
  }
}

class _ShowFiles extends StatelessWidget {
  final BuiltList<File> files;

  const _ShowFiles(this.files);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(4),
        itemCount: files.length,
        itemBuilder: (BuildContext context, int index) {
          var file = files[index];
          if (file.path.endsWith('.webp')) {
            return _buildImage(context, file, index);
          } else {
            return _buildDocument(context, file, index);
          }
        });
  }

  _buildImage(context, file, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
                height: 90,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image.file(file, fit: BoxFit.cover)),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black45,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(file.path.split('/').last,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 10),
                    Text(_getFileSize(file),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    InkWell(
                        onTap: () {
                          BlocProvider.of<WriteStatementFgrCubit>(context,
                                  listen: false)
                              .deleteFile(index);
                        },
                        child: Icon(FontAwesomeIcons.trash,
                            color: Colors.red, size: 20)),
                    SizedBox(width: 10)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDocument(context, File file, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(FontAwesomeIcons.fileArchive,
                        color: Colors.green, size: 55),
                  ],
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black45,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(file.path.split('/').last,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 10),
                    Text(_getFileSize(file),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    InkWell(
                        onTap: () {
                          BlocProvider.of<WriteStatementFgrCubit>(context,
                                  listen: false)
                              .deleteFile(index);
                        },
                        child: Icon(FontAwesomeIcons.trash,
                            color: Colors.red, size: 20)),
                    SizedBox(width: 10)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getFileSize(File file) {
    final u = Utils();
    return u.formatBytes(file.readAsBytesSync().lengthInBytes, 2);
  }
}

class _AddPromoterDialog extends StatelessWidget {
  final BuildContext blocContext;

  _AddPromoterDialog({required this.blocContext});

  @override
  Widget build(BuildContext context) {
    String? _firstName;
    String? _secondName;
    String? _firstLastName;
    String? _secondLastName;
    int? _id;
    String? _phone;
    String? _email;
    String? _province;
    String? _municipality;
    String? _address;

    return AlertDialog(
      title: Text(S().addPromoter),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      insetPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8),
      content: Container(
        width: 315,
        height: double.infinity,
        child: ListView(
          children: [
            SizedBox(height: 8),
            TextField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.name,
              maxLines: 1,
              maxLength: 10,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: S().firstName,
                suffixIcon: Icon(Icons.person),
              ),
              onChanged: (valor) {
                _firstName = valor;
              },
            ),
            SizedBox(height: 8),
            TextField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.name,
              maxLines: 1,
              maxLength: 10,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: S().secondName,
                suffixIcon: Icon(Icons.person),
              ),
              onChanged: (valor) {
                _secondName = valor;
              },
            ),
            SizedBox(height: 8),
            TextField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.name,
              maxLines: 1,
              maxLength: 10,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: S().firstLastName,
                suffixIcon: Icon(Icons.person),
              ),
              onChanged: (valor) {
                _firstLastName = valor;
              },
            ),
            SizedBox(height: 8),
            TextField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.name,
              maxLines: 1,
              maxLength: 10,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: S().secondLastName,
                suffixIcon: Icon(Icons.person),
              ),
              onChanged: (valor) {
                _secondLastName = valor;
              },
            ),
            SizedBox(height: 8),
            TextField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.none,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLines: 1,
              maxLength: 11,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: S().id,
                suffixIcon: Icon(Icons.person),
              ),
              onChanged: (valor) {
                _id = valor as int;
              },
            ),
            SizedBox(height: 8),
            TextField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.phone,
              maxLines: 1,
              maxLength: 8,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: S().phone,
                suffixIcon: Icon(Icons.phone),
              ),
              onChanged: (valor) {
                _phone = valor;
              },
            ),
            TextField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              maxLength: 25,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: S().email,
                suffixIcon: Icon(Icons.alternate_email),
              ),
              onChanged: (valor) {
                _email = valor;
              },
            ),
            SizedBox(height: 8),
            TextField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              maxLines: 1,
              maxLength: 15,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: S().province,
                suffixIcon: Icon(Icons.location_city),
              ),
              onChanged: (valor) {
                _province = valor;
              },
            ),
            SizedBox(height: 8),
            TextField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              maxLines: 1,
              maxLength: 15,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: S().municipality,
                suffixIcon: Icon(Icons.location_city),
              ),
              onChanged: (valor) {
                _municipality = valor;
              },
            ),
            SizedBox(height: 8),
            TextField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.streetAddress,
              maxLines: 1,
              maxLength: 25,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: S().address,
                suffixIcon: Icon(Icons.location_on),
              ),
              onChanged: (valor) {
                _address = valor;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => {Navigator.of(context).pop()},
            child: Text(S().cancel)),
        TextButton(
            onPressed: () => {
                  if (_province == null)
                    {
                      print('La provincia no puede ser null'),
                      showToast('La provincia no puede estar vacia',
                          duration: Duration(seconds: 2),
                          position: ToastPosition.bottom,
                          backgroundColor: Colors.black.withOpacity(0.4))
                    }
                  else if (_municipality == null)
                    {
                      print('El municipio no puede ser null'),
                      showToast('El municipio no puede estar vacio',
                          duration: Duration(seconds: 2),
                          position: ToastPosition.bottom,
                          backgroundColor: Colors.black.withOpacity(0.4))
                    }
                  else
                    {
                      BlocProvider.of<WriteStatementFgrCubit>(blocContext,
                              listen: false)
                          .addPromoter(PromoterFRG(
                              firstName: _firstName,
                              secondName: _secondName,
                              firstLastName: _firstLastName,
                              secondLastName: _secondLastName,
                              id: _id.toString(),
                              phone: _phone,
                              email: _email,
                              province: _province!,
                              municipality: _municipality!,
                              address: _address)),
                      Navigator.of(context).pop()
                    }
                },
            child: Text(S().ok)),
      ],
    );
  }
}

class _ShowPromoters extends StatelessWidget {
  final BuiltList<PromoterFRG> _promoters;

  _ShowPromoters(this._promoters);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 4),
        itemCount: _promoters.length,
        itemBuilder: (BuildContext context, int index) {
          String title = '';
          if (_promoters[index].firstName != null) {
            title = '${_promoters[index].firstName} ';
          }
          if (_promoters[index].firstLastName != null) {
            title += '${_promoters[index].firstLastName!}';
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.addressBook,
                    size: 25, color: Colors.blue),
                SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != '')
                        Text(title,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54)),
                      SizedBox(height: 2),
                      Text(
                          '${_promoters[index].municipality}, ${_promoters[index].province}',
                          style:
                              TextStyle(fontSize: 14, color: Colors.black54)),
                    ],
                  ),
                ),
                InkWell(
                  child:
                      Icon(FontAwesomeIcons.edit, size: 25, color: Colors.blue),
                  onTap: () {},
                ),
                SizedBox(width: 10),
                InkWell(
                  child:
                      Icon(FontAwesomeIcons.trash, size: 25, color: Colors.red),
                  onTap: () {
                    BlocProvider.of<WriteStatementFgrCubit>(context,
                            listen: false)
                        .deletePromoter(index);
                  },
                )
              ],
            ),
          );
        });
  }
}
