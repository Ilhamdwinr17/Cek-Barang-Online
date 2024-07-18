import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  Widget build(context, MainNavigationController controller) {
    controller.view = this;
    /*
    TODO: Implement this @ controller
    int selectedIndex = 0;
    updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
    }
    */
    return
        //scafold_botto_navigation
        DefaultTabController(
      length: 3,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: const [
            // DashboardView(),
            PurchaseListView(),
            OrderView(),
            //FavoriteView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (newIndex) => controller.updateIndex(newIndex),
          type: BottomNavigationBarType.fixed,
          items: const [
            /* BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              label: "Dashboard",
            ),*/
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket,
              ),
              label: "List Purchase",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_book,
                ),
                // label: "Order",
                label: "Log"),
            /*BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favorite",
            ),*/
            BottomNavigationBarItem(
              icon: Icon(
                Icons.contact_page,
              ),
              label: "Departement",
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
