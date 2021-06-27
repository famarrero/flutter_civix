import 'package:flutter/material.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';

class FrequentQuestionsPage extends StatelessWidget {
  const FrequentQuestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // CustomCarouselSlider(items: _getItemsCarousel()),
          SliverAppBar(
            floating: true,
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(S.of(context).frequentQuestions),
          ),
          SliverPersistentHeader(
              floating: true,
              delegate: _SliverCustomHeaderDelegate(
                  minheight: 170,
                  maxheight: 200,
                  child: Container(
                    alignment: Alignment.center,
                    color: Theme.of(context).primaryColor,
                    child: Icon(Icons.question_answer_outlined,
                        color: Colors.white, size: 60),
                  ))),
        ],
      ),
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minheight, required this.maxheight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}
