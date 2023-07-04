
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_app/ui/intro_screens/intro_component1.dart';
import 'package:intro_app/ui/intro_screens/provider/page_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    controller.addListener(() {
      context.read<PageProvider>().scrollPage(controller.page);
    });

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: const [
              IntroComponent(
                image: 'assets/intro1.jpeg',
                bgColor: Color.fromARGB(255, 255, 255, 255),
                promoText: 'Durable',
              ),
              IntroComponent(
                image: 'assets/intro2.jpeg',
                bgColor: Color.fromARGB(249, 249, 249, 255),
                promoText: 'More Colors',
              ),
              IntroComponent(
                image: 'assets/intro3.png',
                bgColor: Color.fromARGB(255, 255, 255, 255),
                promoText: 'Perfect Sizes',
              )
            ],
          ),
          Positioned(
              bottom: 50,
              right: 50,
              child: FilledButton.tonal(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.grey.withOpacity(0.08))),
                  onPressed: () async {
                    final SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setBool('isFresher', false);
                    if (controller.page != 2) {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: Text(
                    'Next',
                    style: GoogleFonts.poppins(),
                  ))),
          Positioned(
              bottom: 70,
              left: 50,
              child: Row(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: CircleAvatar(
                      backgroundColor:
                          context.watch<PageProvider>().page == index
                              ? Colors.grey
                              : Colors.grey[400],
                      radius:
                          context.watch<PageProvider>().page == index ? 6 : 4,
                    ),
                  );
                }),
              )),
        ],
      ),
    );
  }
}
