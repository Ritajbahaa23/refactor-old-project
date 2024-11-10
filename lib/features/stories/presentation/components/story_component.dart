import 'package:climatify/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryComponent extends StatelessWidget {
  const StoryComponent({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final StoryController controller = StoryController();
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => const MoreStories()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                children: [
                  Container(
                    width: 120.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: AppColor.green,
                        width: 1,
                      ),
                    ),
                    // padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: StoryView(
                      controller: controller,
                      storyItems: [
                        StoryItem.inlineImage(
                          url:
                              "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
                          controller: controller,
                          imageFit: BoxFit.cover,
                        ),
                      ],
                      progressPosition: ProgressPosition.none,
                      repeat: false,
                      inline: false,
                    ),
                  ),
                  Positioned(
                    bottom: 5.0,
                    left: -1,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const MoreStories()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 2),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: AppColor.grey,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColor.green.withOpacity(0.4),
                                    width: 1.0,
                                  ),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "https://as1.ftcdn.net/v2/jpg/03/02/88/46/1000_F_302884605_actpipOdPOQHDTnFtp4zg4RtlWzhOASp.jpg",
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'John',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
