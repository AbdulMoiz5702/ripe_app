import 'package:flutter/material.dart';
import 'package:ride_app/consts/colors.dart';

import '../../resubale_widgets/custom_leading.dart';
import 'bottom_sheet/model_bottom_sheet.dart';

class ExploreCity extends StatefulWidget {
  const ExploreCity({super.key});

  @override
  State<ExploreCity> createState() => _ExploreCityState();
}

class _ExploreCityState extends State<ExploreCity> {

  final DraggableScrollableController _draggableScrollableController = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _draggableScrollableController.animateTo(
          0.5, // Desired initial child size
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const CustomLeading(
        ),
        actions: [
          NotificationButton(onTap: () {},)
        ],
      ),
      body: Stack(
        children: [
          const Center(
            child: Text('Map and other content here'),
          ),
          DraggableScrollableSheet(
            controller: _draggableScrollableController,
            initialChildSize: 0.7, // Initial size of the bottom sheet
            minChildSize: 0.05, // Minimum size to which bottom sheet can be dragged down
            maxChildSize: 0.7, // Maximum size to which bottom sheet can be dragged up
            expand: true,
            snap: true,
            shouldCloseOnMinExtent:false,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration:  BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  child:  BottomSheetContent(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
