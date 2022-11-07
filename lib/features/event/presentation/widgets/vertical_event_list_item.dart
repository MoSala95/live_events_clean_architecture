import 'package:flutter/material.dart';
import 'package:live_events_clean_architecture/features/event/data/models/response/events_response_model.dart';

import '../../../../core/helpers/helper.dart';
import '../../../../core/utils/constants/app_assets.dart';

class VerticalEventWidget extends StatelessWidget {
  final Event event;
  final Function() onCardPressed;
  final Function() onFavoritePressed;

  final bool isFavorite;
  final double? imageWidth;
  final double? imageHeight;

  const VerticalEventWidget({
    Key? key,
    required this.event,
    this.imageHeight,
    this.imageWidth,
    this.isFavorite = false,
    required this.onCardPressed,
    required this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: GestureDetector(
        onTap: onCardPressed,
        child: Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 15),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          AppAssets.stadiumImage,
                          height: 130,
                          width: 100,
                          fit: BoxFit.fill,
                        )),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: IconButton(
                          onPressed: onFavoritePressed,
                          icon: isFavorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.grey,
                                )))
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(event.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        DateLogicHelper.formatDateSlashDDMMYYYY(
                            event.datetimeUtc),
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
