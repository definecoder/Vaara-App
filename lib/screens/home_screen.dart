import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:vaara_app/common_widgets/search_bar.dart';
import 'package:vaara_app/consts/consts.dart';

import '../common_widgets/product_data_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var swiperlist = [
    'assets/nature_bg.png',
    'assets/cycle_image.png',
    'assets/camera_image.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                appLogoWidget(100, 100),
                SearchBar(),
              ],
            ),
            20.heightBox,
            VxSwiper.builder(
              autoPlay: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                // setState(() {});
                return Image.asset(swiperlist[index])
                    .box
                    .padding(EdgeInsets.all(10))
                    .make();
              },
              enlargeCenterPage: true,
            ),
            20.heightBox,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(10, (index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(148, 243, 199, 239),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: "Category $index".text.size(13).make(),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView(
                  children: List.generate(5, (index) {
                return ProductData(
                  frequency: "month",
                  isLend: true,
                  location: "Chattogram",
                  status: "Pending",
                  title: "CANON 700D",
                  imgLocation: "./assets/camera_image.png",
                  price: 700.toString(),
                );
              })),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(PostNewProduct());
        },
        elevation: 5,
        backgroundColor: Color(0xff9F1F63),
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(
        curScene: 1, // 1 = home, 2 = my rents, 3 = notifications, 4 = profile
      ),
    );
  }
}
