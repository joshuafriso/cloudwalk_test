// ignore_for_file: library_private_types_in_public_api

import 'package:cloudwalk_test/app/modules/home/widgets/image_item_list_widget.dart';
import 'package:cloudwalk_test/app/shared/utils/app_colors.dart';
import 'package:cloudwalk_test/app/shared/widgets/connectivity_status/connectivity_status_widget.dart';
import 'package:cloudwalk_test/app/shared/widgets/loading_defautl_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, this.title = 'Home'});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
    store.setupReactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'NASA APOD',
              style: TextStyle(color: Colors.white),
            ),
            ConnectivityStatusWidget()
          ],
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Observer(builder: (_) {
                return TextField(
                  onChanged: (value) => store.filterApodList(value),
                  decoration: const InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                );
              }),
            )),
        backgroundColor: AppColors.primary,
      ),
      body: Observer(
        builder: (context) {
          if (store.isLoadingData) {
            return const Center(
              child: LoadingDefautlWidget(),
            );
          } else if (store.apodList != null) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: store.apodList!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => store.goToDetails(store.apodList![index]),
                    child: ImageItemListWidget(model: store.apodList![index]));
              },
            );
          } else {
            return const Center(
              child:
                  Text('Ops! I think you don\'t have internet or local data'),
            );
          }
        },
      ),
    );
  }
}
