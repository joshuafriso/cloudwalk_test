import 'package:cloudwalk_test/app/shared/widgets/connectivity_status/connectivity_status_store.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class ConnectivityStatusWidget extends StatefulWidget {
  const ConnectivityStatusWidget({super.key});

  @override
  State<ConnectivityStatusWidget> createState() =>
      _ConnectivityStatusWidgetState();
}

class _ConnectivityStatusWidgetState extends State<ConnectivityStatusWidget> {
  late final ConnectivityStatusStore store;
  late final ReactionDisposer _statusConnectivity;

  @override
  void initState() {
    store = Modular.get<ConnectivityStatusStore>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _statusConnectivity =
        reaction((_) => store.connectivityStream.value, (result) {
      store.changeStatus(result == ConnectivityResult.none);
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _statusConnectivity;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Row(
        children: [
          Icon(
            Icons.circle,
            size: 8,
            color: store.status ? Colors.red : Colors.green,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            store.status ? "Offline" : "Online",
            style: TextStyle(
                fontSize: 14, color: store.status ? Colors.red : Colors.green),
          )
        ],
      );
    });
  }
}
