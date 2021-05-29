import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_civix/src/domain/entities/promovente_fgr.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oktoast/oktoast.dart';

class WriteStatementFgrPage extends StatefulWidget {
  @override
  _WriteStatementFgrPageState createState() => _WriteStatementFgrPageState();
}

class _WriteStatementFgrPageState extends State<WriteStatementFgrPage> {
  String? _subject;
  String? _statement;

  List<PromoterFRG> _promoters = [
    PromoterFRG(provincia: 'La Habana', municipio: 'Centro Habana')
  ];

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
                  autofocus: true,
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                )
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
                  backgroundColor: Colors.blue,
                  tooltip: S().attachments,
                  onPressed: () {},
                  elevation: 0,
                  child: Icon(Icons.attach_file),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  tooltip: S().camera,
                  onPressed: () {},
                  elevation: 0,
                  child: Icon(FontAwesomeIcons.camera),
                ),
                FloatingActionButton(
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
  }

  _sendStatement() {
    if (_subject != null && _statement != null) {
      _subject = _subject!;
      _statement = _statement!;
      // print('${planteamientoFGRService.planteamientoFGR.toString()}');

    } else {
      print('Debe espscificar un asunto y planteamiento');
    }
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
                    {print('El municipio no puede ser null'),
                      showToast('El municipio no puede estar vacio',
                          duration: Duration(seconds: 2),
                          position: ToastPosition.bottom,
                          backgroundColor: Colors.black.withOpacity(0.4))}
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
