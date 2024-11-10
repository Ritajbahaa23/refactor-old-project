import 'package:climatify/features/stories/presentation/controller/stories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_story_designer/vs_story_designer.dart';
import 'package:climatify/core/services/services_locator.dart';
import 'package:climatify/features/stories/presentation/controller/stories_bloc.dart';
import 'package:climatify/features/stories/presentation/controller/stories_event.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/rendering.dart';

class CreateStory extends StatelessWidget {
  CreateStory({super.key});

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: RepaintBoundary(
        key: _globalKey,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocProvider(
                create: (BuildContext context) => sl<StoriesBloc>(),
                child: BlocBuilder<StoriesBloc, StoriesState>(
                  builder: (context, state) {
                    final StoriesBloc storiesBloc = context.read<StoriesBloc>();
                    return ElevatedButton(
                      onPressed: () async {
                        storiesBloc.add(CreateStoryEvent());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VSStoryDesigner(
                              centerText: "Start Creating Your Story",
                              middleBottomWidget: const SizedBox(),
                              themeType: ThemeType.dark,
                              galleryThumbnailQuality: 250,
                              onDone: (uri) async {
                                debugPrint(uri);
                                await Share.shareXFiles([XFile(uri)]);
                              },
                              mediaPath: storiesBloc.path,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
