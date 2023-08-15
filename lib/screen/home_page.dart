import 'package:flutter/material.dart';
import 'package:gprojuktitask/screen/sub_category.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getAllCategories();
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text('G Projukti'),
          ),
          body: provider.isLoading ? Center(
            child: CircularProgressIndicator(),
          ) :
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: provider.categoryList.length,
                itemBuilder: (_, index) {
                  var data = provider.categoryList[index].categories![index];
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,(MaterialPageRoute(builder: (builder)=> SubCategoryPage(provider.categoryList[index].categories))));
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Column(
                          children: [
                          Expanded(
                          flex: 2,
                          child: Image.network(provider.categoryList[index].categories![0].logo.toString())
                    ),
                    Expanded(
                    flex: 1,
                    child: Text(provider.categoryList[index].name.toString()),
                    )
                    ],
                    ),
                    ),
                  );
                }),
          )
      );
    });
  }
}
