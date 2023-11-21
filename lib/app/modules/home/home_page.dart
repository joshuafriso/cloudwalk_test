// ignore_for_file: library_private_types_in_public_api

import 'package:cloudwalk_test/app/modules/home/widgets/image_item_list_widget.dart';
import 'package:cloudwalk_test/app/shared/utils/app_colors.dart';
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
    store.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'NASA APOD',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Observer(
        builder: (context) {
          if (store.apodList == null) {
            return const Center(
              child: LoadingDefautlWidget(),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: store.apodList!.length,
              itemBuilder: (context, index) {
                return ImageItemListWidget(model: store.apodList![index]);
              },
            );
          }
        },
      ),
    );
  }
}
