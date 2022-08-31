import 'package:flutter/material.dart';
import 'package:newss_app/screens/news_screen/news_data.dart';
import 'package:newss_app/screens/news_screen/tab_det.dart';

import '../../models/SourceResponce.dart';

class TabsNews extends StatefulWidget {
    List<Sources> sources;
    TabsNews(this.sources);

  @override
  State<TabsNews> createState() => _TabsNewsState();
}
int selectedIndex = 0;
class _TabsNewsState extends State<TabsNews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              indicatorColor: Colors.transparent,
              isScrollable: true,
              onTap: (index){
                selectedIndex =index;
                setState(() {

                });
              },
              tabs: widget.sources.map((source) {
                  return TabDetails(source, selectedIndex == widget.sources.indexOf(source));
              }).toList(),
            )
        ),
        Expanded(child: NewsData(widget.sources[selectedIndex]))
      ],
    );
  }
}
