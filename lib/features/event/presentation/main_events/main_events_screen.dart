import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/features/event/presentation/widgets/vertical_event_list_item.dart';

import '../../../../core/widgets/app_states/app_state_handler_widget.dart';
import '../../../../core/widgets/shimmers/vertical_list_shimmer_widget.dart';
import 'main_events_controller.dart';

class MainEventsScreen extends StatelessWidget {
  const MainEventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainEventsController>(
          init: Get.find<MainEventsController>(),
          builder: (eventsController) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.blueAccent,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: eventsController.searchTextController,
                          focusNode: eventsController.focusNode,
                          onChanged: (value) {
                            eventsController.handleNewSearch(value: value);
                          },
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: "Search events ...",
                            errorMaxLines: 2,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.blueGrey, width: 1),
                            ),

                            prefixIcon: Icon(Icons.search),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                eventsController.cancelSearch();
                              },
                            ),
                            // suffixStyle: UiStyles.suffixStyle,
                            contentPadding: const EdgeInsets.all(5),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: eventsController.cancelSearch,
                          child: Text(
                            "cancel",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: AppStateHandlerWidget(
                    state: eventsController.loadingState,
                    isShimmer: false,
                    shimmerWidget: VerticalListShimmerWidget(),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: eventsController.events.isEmpty
                          ? 1
                          : eventsController.events.length,
                      // eventsController
                      //     .searchedArticles.length,
                      controller: eventsController.scrollController,

                      itemBuilder: (context, index) {
                        if (eventsController.events.isNotEmpty) {
                          return VerticalEventWidget(
                            event: eventsController.events[index],
                            isFavorite: eventsController.checkIsFavorite(
                                eventId: eventsController.events[index].id),
                            onCardPressed: () {},
                            onFavoritePressed: () {
                              eventsController.handleFavoriteAction(
                                  eventId: eventsController.events[index].id);
                            },
                          );
                        }
                        return Container();
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                            color: Color.fromRGBO(226, 226, 226, 1),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
