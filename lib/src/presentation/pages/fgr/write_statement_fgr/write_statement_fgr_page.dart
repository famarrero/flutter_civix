import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/utils/utils.dart';
import 'package:flutter_civix/src/domain/entities/promovente_fgr.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/dialog_progress_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:built_collection/built_collection.dart';

class WriteStatementFgrPage extends StatefulWidget {
  @override
  _WriteStatementFgrPageState createState() => _WriteStatementFgrPageState();
}

class _WriteStatementFgrPageState extends State<WriteStatementFgrPage> {
  String? _subject;
  String? _statement;

  List<PromoterFRG> _promoters = [];

  _addPromoter(PromoterFRG promoterFRG) {
    setState(() {
      _promoters.add(promoterFRG);
    });
  }

  _deletePromoter(int index) {
    setState(() {
      _promoters.removeAt(index);
    });
  }

  _deleteFile(int index) {
    setState(() {
      BlocProvider.of<WriteStatementFgrCubit>(context,
          listen: false)
          .deleteFile(index);
    });
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
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    SizedBox(height: 15),
                    TextField(
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
                      onChanged: (valor) {
                        _subject = valor;
                      },
                    ),
                    SizedBox(height: 20),
                    TextField(
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
                      onChanged: (valor) {
                        _statement = valor;
                      },
                    ),
                    SizedBox(height: 20),
                    _ShowPromoter(_promoters, _deletePromoter),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
                      onPressed: (_promoters.length >= 1)
                          ? null
                          : () => showDialog<void>(
                              context: context,
                              builder: (BuildContext dialogContext) =>
                                  _AddPromoterDialog(
                                      context: context,
                                      promoters: _promoters,
                                      addPromoter: _addPromoter)),
                      child: Text(
                        S().addPromoter,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
                            elevation: 0,
                            context: context,
                            builder: (_) {
                              return Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FloatingActionButton(
                                      heroTag: 'gallery',
                                      tooltip: S().gallery,
                                      backgroundColor: (state.stateOfFiles
                                                  .pickedFiles.length <
                                              3)
                                          ? Colors.red
                                          : Colors.black.withOpacity(0.1),
                                      onPressed: (state.stateOfFiles.pickedFiles
                                                  .length <
                                              3)
                                          ? () {
                                              BlocProvider.of<
                                                          WriteStatementFgrCubit>(
                                                      context)
                                                  .getImageFormCameraOrGallery(
                                                      source: 'gallery');
                                              Navigator.of(context).pop();
                                            }
                                          : null,
                                      elevation: 0,
                                      child: Icon(FontAwesomeIcons.fileImage),
                                    ),
                                    FloatingActionButton(
                                      heroTag: 'documents',
                                      tooltip: S().document,
                                      backgroundColor: (state.stateOfFiles
                                                  .pickedFiles.length <
                                              3)
                                          ? Colors.green
                                          : Colors.black.withOpacity(0.1),
                                      onPressed: (state.stateOfFiles.pickedFiles
                                                  .length <
                                              3)
                                          ? () {
                                              BlocProvider.of<
                                                          WriteStatementFgrCubit>(
                                                      context)
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
                                      onPressed: (state.stateOfFiles.pickedFiles
                                                  .length <
                                              3)
                                          ? () {}
                                          : null,
                                      elevation: 0,
                                      child:
                                          Icon(FontAwesomeIcons.locationArrow),
                                    ),
                                  ],
                                ),
                              );
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
                                  .getImageFormCameraOrGallery(source: 'camera')
                          : null,
                      elevation: 0,
                      child: Icon(FontAwesomeIcons.camera),
                    ),
                    FloatingActionButton(
                      heroTag: 'send',
                      backgroundColor: Colors.blue,
                      tooltip: S().send,
                      onPressed: () {
                        _sendStatement();
                      },
                      elevation: 0,
                      child: Icon(Icons.send_rounded),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  _sendStatement() {
    setState(() {

    });
    if (_subject != null && _statement != null) {
      _subject = _subject!;
      _statement = _statement!;
      // print('${planteamientoFGRService.planteamientoFGR.toString()}');

    } else {
      print('Debe espscificar un asunto y planteamiento');
    }
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
  final BuildContext context;
  final List<PromoterFRG> promoters;
  final Function(PromoterFRG) addPromoter;

  _AddPromoterDialog(
      {required this.context,
      required this.promoters,
      required this.addPromoter});

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
                      addPromoter(PromoterFRG(
                          primerNombre: _firstName,
                          segundoNombre: _secondName,
                          primerApellido: _firstLastName,
                          segundoApellido: _secondLastName,
                          ci: _id.toString(),
                          telefono: _phone,
                          email: _email,
                          provincia: _province!,
                          municipio: _municipality!,
                          direccion: _address)),
                      Navigator.of(context).pop()
                    }
                },
            child: Text(S().ok)),
      ],
    );
  }
}

class _ShowPromoter extends StatelessWidget {
  final List<PromoterFRG> _promoter;
  final Function(int) _deletePromoter;

  _ShowPromoter(this._promoter, this._deletePromoter);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(4),
        itemCount: _promoter.length,
        itemBuilder: (BuildContext context, int index) {
          String title = '';
          if (_promoter[index].primerNombre != null) {
            title = '${_promoter[index].primerNombre} ';
          }
          if (_promoter[index].primerApellido != null) {
            title += '${_promoter[index].primerApellido!}';
          }
          return Padding(
            padding: const EdgeInsets.all(8),
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
                          '${_promoter[index].municipio}, ${_promoter[index].provincia}',
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
                    _deletePromoter(index);
                  },
                )
              ],
            ),
          );
        });
  }
}
