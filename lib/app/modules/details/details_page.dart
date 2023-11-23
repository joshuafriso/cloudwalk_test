import 'package:cloudwalk_test/app/modules/details/details_store.dart';
import 'package:cloudwalk_test/app/modules/details/widgets/image_details_widget.dart';
import 'package:cloudwalk_test/app/modules/details/widgets/text_titles_widget.dart';
import 'package:cloudwalk_test/app/modules/details/widgets/video_player_widget.dart';
import 'package:cloudwalk_test/app/shared/models/nasa_apod_model.dart';
import 'package:cloudwalk_test/app/shared/utils/app_colors.dart';
import 'package:cloudwalk_test/app/shared/widgets/connectivity_status/connectivity_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsPage extends StatefulWidget {
  final NasaApodModel model;
  const DetailsPage({super.key, required this.model});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final DetailsStore store;
  @override
  void initState() {
    store = Modular.get<DetailsStore>();
    store.setupReactions();
    super.initState();
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
              'NASA APOD - Details',
              style: TextStyle(color: Colors.white),
            ),
            ConnectivityStatusWidget()
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Observer(builder: (context) {
            if (store.hasSignal && widget.model.mediaType == 'video') {
              return VideoPlayerWidget(url: widget.model.imgUrl!);
            }
            return ImageDetailsWidget(
              mediaType: widget.model.mediaType!,
              imgUrl: widget.model.imgUrl!,
              imgHdUrl: widget.model.imgHdUrl,
            );
          }),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextTitlesWidget(text: widget.model.title!),
                const SizedBox(
                  height: 10,
                ),
                TextTitlesWidget(text: widget.model.date!),
                const SizedBox(
                  height: 10,
                ),
                const TextTitlesWidget(text: "Explanation:"),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.model.explanation!,
                    style:
                        const TextStyle(fontSize: 16, color: AppColors.primary),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
