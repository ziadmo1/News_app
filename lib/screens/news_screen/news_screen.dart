import 'package:flutter/material.dart';
import 'package:newss_app/api_manager/apis.dart';
import 'package:newss_app/screens/category_screen/category.dart';
import 'package:newss_app/screens/news_screen/tab_item.dart';

import '../../models/SourceResponce.dart';

class NewsScreen extends StatelessWidget {
static const String routeName = 'newsTab';
  Categories? category;
  NewsScreen(this.category);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
          future: Api_Manage.getSourceData(category?.id??''),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(child: Text(snapshot.data?.message ?? "")),
              );
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
              );
            }
            if('ok' != snapshot.data?.status){
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(snapshot.data?.message??""),
                );
            }
            return TabsNews(snapshot.data?.sources??[]);
          },
        );
  }
}
