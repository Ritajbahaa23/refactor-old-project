import 'dart:developer';
import 'dart:ui';

import 'package:climatify/core/shared/components/custom_app_bar.dart';
import 'package:climatify/core/styles/colors.dart';
import 'package:climatify/core/utils/screens.dart';
import 'package:climatify/features/home/presentation/components/post_component.dart';
import 'package:climatify/features/home/presentation/components/search_component.dart';
import 'package:climatify/features/home/presentation/controller/home_bloc/home_bloc.dart';
import 'package:climatify/features/home/presentation/controller/home_bloc/home_event.dart';
import 'package:climatify/features/stories/presentation/controller/stories_bloc.dart';
import 'package:climatify/features/stories/presentation/controller/stories_event.dart';
import 'package:climatify/features/stories/presentation/controller/stories_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/enums.dart';
import '../../../stories/presentation/components/story_component.dart';
import '../controller/home_bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        final HomeBloc homeBloc = context.read<HomeBloc>();

        if ((state.getUserDataSharedPrefsState ==
                GetUserDataSharedPrefsState.loaded) &&
            (state.getPostsRequestState == GetPostsRequestState.initial)) {
          homeBloc.add(GetPostsEvent());
        }
      },
      builder: (context, state) {
        if (kDebugMode) {
          log('________________ Home SCREEN STATE __________________$state');
        }

        // final HomeBloc homeBloc = context.read<HomeBloc>();

        appBar: /* CustomAppBar(
            appBarWidget: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Screens.notifications);
                    },
                    icon: const Icon(Icons.notification_important))
              ],
            )),*/
        return Scaffold(
          appBar: CustomAppBar(
              appBarWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Climatify Hub",
                    style: TextStyle(
                      color: AppColor.basicColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Screens.notifications);
                    },
                    icon: SvgPicture.asset('assets/icons/notification.svg'))
              ],
            ),
          )),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  SearchWidget(),
                  SizedBox(height: 20,),
                  BlocConsumer<StoriesBloc, StoriesState>(
                    listener: (context, state) {
                      final StoriesBloc storiesBloc =
                          context.read<StoriesBloc>();
                      if (state.requestState == RequestState.initial) {
                        storiesBloc.add(GetStoriesEvent());
                      }
                      ;
                    },
                    builder: (context, state) {
                      if (kDebugMode) {
                        log('________________ Home SCREEN STATE __________________$state');
                        log("This is length:${state.stories.data}");
                      }
                      return StoryComponent(
                        itemCount: 5,
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: List.generate(
                        state.postsEntity.data.length,
                        (index) => PostCard(
                          datum: state.postsEntity.data[index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
