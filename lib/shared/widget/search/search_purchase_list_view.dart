import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mvc_demo/shared/widget/search/search_purchase_list_controller.dart';

class SearchPurchaseListView extends StatefulWidget {
  const SearchPurchaseListView({super.key});

  Widget build(context, SearchPurchaseListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: controller.isSearching
            ? TextField(
                controller: controller.searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,
                ),
                onChanged: controller.updateSearchQuery,
              )
            : Row(
                children: [
                  const SizedBox(width: 1.0),
                  Image.asset(
                    //'lib/shared/util/assets/images/LOGO AJI.png',
                    'lib/shared/util/assets/images/LogiWatch.png',
                    height: 20.0,
                  ),
                  const SizedBox(width: 8.0),
                  const Text("List Purchase"),
                ],
              ),
        backgroundColor: Colors.blue,
        actions: controller.isSearching
            ? [
                IconButton(
                  onPressed: controller.clearSearch,
                  icon: const Icon(
                    Icons.clear,
                    size: 24.0,
                  ),
                ),
              ]
            : [
                IconButton(
                  onPressed: controller.startSearch,
                  icon: const Icon(
                    Icons.search,
                    size: 24.0,
                  ),
                ),
                const SizedBox(width: 20.0),
              ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("purchase").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return const Text("Error");
            if (!snapshot.hasData) return const Text("Loading...");

            List<QueryDocumentSnapshot> filteredDocs =
                controller.filterData(snapshot.data!.docs);

            if (filteredDocs.isEmpty) {
              return const Text("No Data");
            }

            return ListView.builder(
              itemCount: filteredDocs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> item =
                    filteredDocs[index].data() as Map<String, dynamic>;
                item["id"] = filteredDocs[index].id;
                var createdAt = item["created_at"];
                var date = (createdAt as Timestamp).toDate();

                /* return ListTile(
                  
                  title: Text(item["NoResi"]),
                  subtitle: Text(item["Departement"]),
                  trailing: Text(item["Status"] ),  
                  onTap: () => controller.updateStatus(item),
                  onLongPress: () => controller.delete(item),
                );*/
                return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 3.0),
                    elevation: 3.0,
                    child: ListTile(
                      title: Text(item["NoResi"]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item["Departement"]),
                          //Text("Created At: ${date.toString()}"),
                        ],
                      ),
                      trailing: Text(
                        item["Status"],
                        style: TextStyle(color: getStatusColor(item["Status"])),
                      ),
                      onTap: () => controller.updateStatus(item),
                      onLongPress: () => controller.delete(item),
                    ));
              },
            );
          },
        ),
      ),
    );
  }

  @override
  State<SearchPurchaseListView> createState() => SearchPurchaseListController();

  Color getStatusColor(String status) {
    switch (status) {
      case "Belum":
        return Colors.redAccent;
      case "Datang":
        return Colors.greenAccent;
      default:
        return Colors.blue;
    }
  }
}
