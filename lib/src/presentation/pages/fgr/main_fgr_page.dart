import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/consult_state_fgr/cubit/consult_state_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_dialog_box.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_carousel_slider.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_grid_institution_options.dart';
import 'package:flutter_civix/src/domain/entities/institution_menu_item.dart';

class MainFgrPage extends StatefulWidget {
  MainFgrPage();

  @override
  _MainFgrPageState createState() => _MainFgrPageState();
}

class _MainFgrPageState extends State<MainFgrPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injector<WriteStatementFgrCubit>()),
        BlocProvider(create: (context) => injector<ListStatementFgrCubit>()),
        BlocProvider(create: (context) => injector<ConsultStateFgrCubit>()),
      ],
      child: _ScaffoldMainFGRPage(),
    );
  }
}

class _ScaffoldMainFGRPage extends StatefulWidget {
  @override
  __ScaffoldMainFGRPageState createState() => __ScaffoldMainFGRPageState();
}

class __ScaffoldMainFGRPageState extends State<_ScaffoldMainFGRPage> {
  bool? checkboxValue = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(S.of(context).mainFGR),
          actions: [
            IconButton(
                icon: Icon(Icons.error),
                onPressed: () {
                  CustomDialogs().customDialogInformationWithCheckBox(
                      context: context,
                      isDismissible: false,
                      title: 'Info!',
                      icon: Icons.report_gmailerrorred_sharp,
                      colorIcon: Colors.red,
                      message: 'This is for shoeing information about whatever thing.',
                      buttonPositiveName: 'Ok',
                      checkboxValue: checkboxValue!,
                      checkboxFunction: (bool? newValue) {
                        setState(() {
                          checkboxValue = newValue;
                        });
                      });
                })
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            CustomCarouselSlider(items: _getItemsCarousel()),
            InstitutionOptions(
              items: _getItemsInstitutionOptions(context),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(       
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.touch_app_outlined,
                      size: 30,
                    )),
                IconButton(onPressed: () {}, icon: Icon(Icons.list_alt_outlined, size: 30))
              ],
            ),
          ),
        ));
  }

  List<ItemCarouselSlider> _getItemsCarousel() {
    return [
      ItemCarouselSlider(image: 'assets/images/fgr_marca_pais.png'),
      ItemCarouselSlider(
          text: 'Sus planteamientos son atendidos de manera rápida por nustros especialistas.',
          image: 'assets/svgs/slide-3.svg'),
      ItemCarouselSlider(
          text: 'No estaremos prestando servicios los días 2 y 3 del presente mes.',
          image: 'assets/svgs/slide-4.svg'),
      ItemCarouselSlider(
          text: 'Con Civix ahora es muy fácil presentar arguemtos a nuestra institución',
          image: 'assets/svgs/slide-5.svg')
    ];
  }

  List<InstitutionMenuItem> _getItemsInstitutionOptions(BuildContext context) {
    return [
      InstitutionMenuItem(
          imagSrc: Icons.edit_outlined,
          title: "Write statment",
          color: Colors.blue,
          onTap: () {
            var bloc = BlocProvider.of<WriteStatementFgrCubit>(context);
            AutoRouter.of(context).push(WriteStatementFgrPageRoute(bloc: bloc));
          }),
      InstitutionMenuItem(
          imagSrc: Icons.folder_outlined,
          title: "Statments list",
          color: Colors.blue,
          onTap: () {
            var bloc = BlocProvider.of<ListStatementFgrCubit>(context);
            AutoRouter.of(context).push(ListStatementFgrPageRoute(bloc: bloc));
          }),
      InstitutionMenuItem(
          imagSrc: Icons.search_outlined,
          title: "Conslut statment",
          color: Colors.blue,
          onTap: () {
            var bloc = BlocProvider.of<ConsultStateFgrCubit>(context);
            AutoRouter.of(context).push(ConsultStateFgrPageRoute(bloc: bloc));
          }),
      InstitutionMenuItem(
          imagSrc: Icons.question_answer_outlined,
          title: "Frecuents questions",
          color: Colors.blue,
          onTap: () {
            print('Frecuents questions');
          }),
      InstitutionMenuItem(
          imagSrc: Icons.house_outlined,
          title: "About us",
          color: Colors.blue,
          onTap: () {
            print('About us');
          }),
      InstitutionMenuItem(
          imagSrc: Icons.phone_outlined,
          title: "Contact",
          color: Colors.blue,
          onTap: () {
            print('Contact');
          }),
    ];
  }
}
