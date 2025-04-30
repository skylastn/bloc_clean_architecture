// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../app/global/model/route_model.dart';
import '../utils/navigation.dart';

class GlobalScreen extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final EdgeInsets? padding;
  final bool canPop;
  final RouteModel? routeModel;
  final bool? resizeToAvoidBottomInset;

  const GlobalScreen({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.padding,
    this.canPop = false,
    this.routeModel,
    this.resizeToAvoidBottomInset,
  });

  final bool isFromBackButton = false;

  @override
  Widget build(BuildContext context) {
    if (routeModel == null || kIsWeb) {
      return child(context);
    }
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) async {
        // log('pop from ${routeModel?.pageName} : $didPop');
        if (didPop) {
          return;
        }
        if (!isFromBackButton) {
          return await Navigation.back(routeModel);
        }
        return;
      },
      child: child(context),
    );
  }

  Widget child(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Container(padding: EdgeInsets.all(8), child: body),
    );
  }
}
