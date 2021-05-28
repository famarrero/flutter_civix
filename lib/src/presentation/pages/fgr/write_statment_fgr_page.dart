import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_civix/src/domain/entities/promovente_fgr.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class WriteStatmentFgrPage extends StatefulWidget {
  @override
  _WriteStatmentFgrPageState createState() =>
      _WriteStatmentFgrPageState();
}

class _WriteStatmentFgrPageState
    extends State<WriteStatmentFgrPage> {
  String? _asunto;

  String? _planteamiento;

  List<PromoventeFRG> _promoventes = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context));
  }

  _buildAppBar() {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Redactar planteamiento'),
          SizedBox(height: 4),
          Text('Fiscalia General de la República',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }

  _buildBody(
      BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
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
                    labelText: 'AppTexts.asunto',
                    hintText: 'AppTexts.intrduzcaAsunto',
                    icon: Icon(Icons.short_text),
                  ),
                  onChanged: (valor) {
                    _asunto = valor;
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
                    labelText: 'AppTexts.planteamiento',
                    hintText: 'AppTexts.intrduzcaPlanteamiento',
                    icon: Icon(Icons.wrap_text),
                  ),
                  onChanged: (valor) {
                    _planteamiento = valor;
                  },
                ),
                SizedBox(height: 20),
                _ShowPromoventes(_promoventes),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ))),
                  onPressed:
                  (_promoventes.length >=
                          1)
                      ? null
                      : () => showDialog<void>(
                      context: context,
                      builder: (BuildContext dialogContext) =>
                          _AddPromoventeDialog(
                            context: context,
                            addPromovente: () {},
                          )),
                  child: Text(
                    'AppTexts.adicionarPromovente',
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
                  tooltip: 'AppTexts.adjuntar',
                  onPressed: () {},
                  elevation: 0,
                  child: Icon(Icons.attach_file),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  tooltip: 'AppTexts.camara',
                  onPressed: () {},
                  elevation: 0,
                  child: Icon(FontAwesomeIcons.camera),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  tooltip:' AppTexts.enviar',
                  onPressed: () {
                    _enviarPlanteamiento();
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

  _enviarPlanteamiento() {

    if (_asunto != null && _planteamiento != null) {

      // planteamientoFGRService.planteamientoFGR
      //     .copyWith(asunto: "_asunto!", planteamiento: "_planteamiento!");

      _asunto = _asunto!;
      _planteamiento = _planteamiento!;
      // print('${planteamientoFGRService.planteamientoFGR.toString()}');

    } else {
      print('Debe espscificar un asunto y planteamiento');
    }
  }
}

class _AddPromoventeDialog extends StatelessWidget {
  final BuildContext context;
  final Function() addPromovente;

  _AddPromoventeDialog({required this.context, required this.addPromovente});

  @override
  Widget build(BuildContext context) {
    List<PromoventeFRG> _promoventes = [];

    String? _primerNombre;
    String? _segundoNombre;
    String? _primerApellido;
    String? _segundoApellido;
    int? _ci;
    String? _telefono;
    String? _email;
    String? _provincia;
    String? _municipio;
    String? _direccion;

    return AlertDialog(
      title: Text('AppTexts.adicionarPromovente'),
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
                labelText: 'AppTexts.primerNombre',
                suffixIcon: Icon(Icons.person),
              ),
              onChanged: (valor) {
                _primerNombre = valor;
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
                labelText: 'AppTexts.segundoNombre',
                suffixIcon: Icon(Icons.person),
              ),
              onChanged: (valor) {
                _segundoNombre = valor;
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
                labelText: 'AppTexts.primerApellido',
                suffixIcon: Icon(Icons.person),
              ),
              onChanged: (valor) {
                _primerApellido = valor;
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
                labelText: 'AppTexts.segundoApellido',
                suffixIcon: Icon(Icons.person),
              ),
              onChanged: (valor) {
                _segundoApellido = valor;
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
                labelText: 'AppTexts.carneIdentidad',
                suffixIcon: Icon(Icons.person),
              ),
              onChanged: (valor) {
                _ci = valor as int;
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
                labelText: 'AppTexts.telefono',
                suffixIcon: Icon(Icons.phone),
              ),
              onChanged: (valor) {
                _telefono = valor;
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
                labelText: 'AppTexts.correoElectronico',
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
                labelText: 'AppTexts.provincia',
                suffixIcon: Icon(Icons.location_city),
              ),
              onChanged: (valor) {
                _provincia = valor;
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
                labelText: 'AppTexts.municipio',
                suffixIcon: Icon(Icons.location_city),
              ),
              onChanged: (valor) {
                _municipio = valor;
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
                labelText: 'AppTexts.direccion',
                hintText: 'AppTexts.direccion',
                suffixIcon: Icon(Icons.location_on),
              ),
              onChanged: (valor) {
                _direccion = valor;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => {Navigator.of(context).pop()},
            child: Text('AppTexts.cancelar')),
        TextButton(
            onPressed: () => {
              if (_provincia == null)
                {print('La provincia no puede ser null')}
              else if (_municipio == null)
                {print('El municipio no puede ser null')}
              else
                {
                  _promoventes.add(new PromoventeFRG(
                      primerNombre: _primerNombre,
                      segundoNombre: _segundoNombre,
                      primerApellido: _primerApellido,
                      segundoApellido: _segundoApellido,
                      ci: _ci.toString(),
                      telefono: _telefono,
                      email: _email,
                      provincia: _provincia!,
                      municipio: _municipio!,
                      direccion: _direccion)),

                  Navigator.of(context).pop()
                }
            },
            child: Text('AppTexts.ok')),
      ],
    );
  }
}

class _ShowPromoventes extends StatelessWidget {
  List<PromoventeFRG> _promoventes;

  _ShowPromoventes(this._promoventes);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(4),
        itemCount: _promoventes.length,
        itemBuilder: (BuildContext context, int index) {
          String title = '';
          if (_promoventes[index].primerNombre != null) {
            title = '${_promoventes[index].primerNombre} ';
          }
          if (_promoventes[index].primerApellido != null) {
            title += '${_promoventes[index].primerApellido!}';
          }
          return _ItemPromovente(_promoventes[index]);
        });
  }
}

class _ItemPromovente extends StatelessWidget {
  PromoventeFRG _promovente;

  _ItemPromovente(this._promovente);

  @override
  Widget build(BuildContext context) {
    String _nombre = '';
    if (_promovente.primerNombre != null) {
      _nombre = '${_promovente.primerNombre} ';
    }
    if (_promovente.primerApellido != null) {
      _nombre += '${_promovente.primerApellido!}';
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(FontAwesomeIcons.addressBook, size: 25, color: Colors.blue),
          SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_nombre != '')
                  Text(_nombre,
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                SizedBox(height: 2),
                Text('${_promovente.municipio}, ${_promovente.provincia}',
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
          ),
          InkWell(
            child: Icon(FontAwesomeIcons.edit, size: 25, color: Colors.blue),
            onTap: () {},
          ),
          SizedBox(width: 10),
          InkWell(
            child: Icon(FontAwesomeIcons.trash, size: 25, color: Colors.red),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
