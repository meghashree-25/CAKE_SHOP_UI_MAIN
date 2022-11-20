import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../TabBarView/birthday_tab.dart';
import '../TabBarView/cakepiece_tab.dart';
import '../TabBarView/cupcake_tab.dart';
import '../TabBarView/muffin_tab.dart';
import '../TabBarView/wedding_tab.dart';
import '../Utilities/cake_tabs.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> cakeTabs=[
      CakeTabs(
        iconPath : 'assets/icons/birthday-cakeicon.png',
        colors:  Colors.pink.shade50),
      CakeTabs(
        iconPath : 'assets/icons/cupcakeicon.png',
        colors:  Colors.teal.shade50),
      CakeTabs(
        iconPath : 'assets/icons/piece-of-cakeicon.png',
        colors:  Colors.brown.shade50),
      CakeTabs(
        iconPath : 'assets/icons/muffinicon.png',
        colors:  Colors.yellow.shade50),
      CakeTabs(
        iconPath : 'assets/icons/weddingcakeicon.png',
        colors:  Colors.red.shade50),
    ];
    return DefaultTabController(length: cakeTabs.length,
     child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
        title: const Text(
            'Cake Shop 🎂',
            style: TextStyle(color: Colors.purple),
            ),
            elevation: 0.0,
            leading: const Icon(Icons.menu,
            color: Colors.purple,
            size: 20,
            ),
            actions: [
              IconButton(
               icon:  const Icon(Icons.search,
               color: Colors.green,
               size: 20,),
               onPressed: () {},
              ),
              IconButton(
               icon:  const Icon(Icons.shopping_cart_outlined,
               color: Colors.red,
               size: 20,),
               onPressed: () {},
              ),
              IconButton(
               icon:  const Icon(Icons.person,
               color: Colors.blue,
               size: 20),
               onPressed: () {},
              ),

            ],
      ),
      body: NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {
        return[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 180,
            floating: true,
            snap: true,
            flexibleSpace: Stack(children: [
              Positioned.fill(
                child: ClipPath(
                  clipper: _CustomClipper(),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple[50],
                    ),
                    child: ImageSlideshow(width : double.infinity,
                    initialPage:0,
                    indicatorColor: Colors.purple,
                    onPageChanged :(value){
                      print('Page changed: $value');
                    },
                    autoPlayInterval:3000,
                    isLoop:true,
                    children:[
                      Image.asset('assets/weddingcakes/wedding-cake2.png',),
                      Image.asset('assets/birthdaycakes/birthdaycake3.png',),
                      Image.asset('assets/cakepieces/cake-piece3.png',),
                      Image.asset('assets/cupcakes/cupcake5.png',),
                      Image.asset('assets/muffins/muffin5.png',
                      ),
                    ],
                    ),
                  ),
                  ),
              ),
            ],
            ),
          ),
        ];
      },
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 15.0,bottom: 10),
          child: Text('Choose Your Favourites',
          style: TextStyle(color: Colors.purple,
          fontWeight: FontWeight.bold,
          fontSize: 25),
          ),
          ),
          TabBar(tabs: cakeTabs),
          Expanded(
          child: TabBarView(
            children:[
              BirthdaysTab(),
              CupCakesTab(),
              CakePiecesTab(),
              MuffinsTab(),
              WeddingCakeTab()
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
class _CustomClipper extends CustomClipper<Path>{
  @override 
  Path getClip(Size size){
    Path path= Path();
    path.lineTo(0,
     size.height*0.7,
     );
     path.quadraticBezierTo(
      size.width*0.1,
     size.height*0.85,
     size.width*0.3,
     size.height*0.85, 
     );
     path.lineTo(
      size.width*0.7,
     size.height*0.85,
     );
     path.quadraticBezierTo(
      size.width*0.9,
     size.height*0.85,
     size.width* 1,
     size.height* 1, 
     );
     path.lineTo(size.width, 0);
     return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
    return true;
  }
}
