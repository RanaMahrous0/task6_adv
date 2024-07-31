import 'package:flutter/material.dart';
import 'package:task6_adv/pages/register.dart';
import 'package:task6_adv/utility/color_utility.dart';
import 'package:task6_adv/utility/image_utility.dart';

import '../widgets/home/onBoarding/on_boarding_item_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  var pageController = PageController();
  int currentPage = 0;
  void onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  void nextPage() {
    if (currentPage < 3) {
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const RegisterPage())));
    }
  }

  void skip() {
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => const RegisterPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: onPageChanged,
                  children: const [
                    OnBoardingItemWidget(
                      image: ImageUtility.badges,
                      title: 'Certification and Badges',
                      subTitle:
                          'Earn a certificate after completion of every course',
                    ),
                    OnBoardingItemWidget(
                      image: ImageUtility.progessTracking,
                      title: 'Progress Tracking',
                      subTitle: 'Check your Progress of every course',
                    ),
                    OnBoardingItemWidget(
                      image: ImageUtility.offline,
                      title: 'Offline Access',
                      subTitle: 'Make your course available offline',
                    ),
                    OnBoardingItemWidget(
                      image: ImageUtility.courseCatalog,
                      title: 'Course Catalog',
                      subTitle: 'View in which courses you are enrolled',
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? ColorUtility.secondry
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: currentPage == 0
                            ? null
                            : () {
                                pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              },
                        color: ColorUtility.secondry,
                        icon: const Icon(Icons.arrow_back)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(20),
                            backgroundColor: ColorUtility.secondry,
                            foregroundColor: Colors.white),
                        onPressed: nextPage,
                        child: const Icon(Icons.arrow_forward))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
          Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                onTap: skip,
                child: const Text(
                  'Skip',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff3A3A3A)),
                ),
              ))
        ],
      ),
    );
  }
}
