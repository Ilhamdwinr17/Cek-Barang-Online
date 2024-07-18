/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';
import 'package:mvc_demo/module/dashboard/widget/dashboard_banner_image.dart';
import '../controller/order_controller.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  Widget build(context, OrderController controller) {
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
                  IconButton(
                    onPressed: () => controller.doBack(),
                    icon: const Icon(
                      Icons.menu_outlined,
                      size: 24.0,
                    ),
                  ),
                  const SizedBox(width: 1.0),
                  Image.asset(
                    'lib/shared/util/assets/images/LOGO AJI.png',
                    height: 20.0,
                  ),
                  const SizedBox(width: 8.0),
                  const Text("Log"),
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
      floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          onPressed: () => Get.to(const PurchaseFormView()),
          child: const Icon(Icons.add)),

      /*body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("purchase")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No Data");
                  }
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.docs.length,
                    padding: EdgeInsets.zero,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item =
                          (data.docs[index].data() as Map<String, dynamic>);
                      item["id"] = data.docs[index].id;
                      var createdAt = item["created_at"];
                      var date = (createdAt as Timestamp).toDate();
                      Color? color = Colors.yellow;
                      if (item["Status"] == "Belum") {
                        color = Colors.red;
                      } else if (item["Status"] == "Datang") {
                        color = Colors.green;
                      }

                      return Card(
                        color: Colors.white10,
                        child: ListTile(
                          onTap: () => controller.updateStatus(item),
                          title: Text(item["NoResi"]),
                          subtitle: Text("$date"),
                          trailing: Text(item["Status"],
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: color,
                              )),
                          leading: InkWell(
                            onTap: () => controller.delete(item),
                            child: const Icon(Icons.delete),
                          ),
                          iconColor: Colors
                              .red, /* const CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                              "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045105/yl2ldbkguqlweltcrylo.png",
                            ),*/
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),*/

      /* body: Container(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("purchase").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return const Text("Error");
            if (snapshot.data == null) return Container();
            if (snapshot.data!.docs.isEmpty) {
              return const Text("No Data");
            }
            final data = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(
                      label: Text('No Resi',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ))),
                  DataColumn(
                      label: Text('Tgl Terima Incoming',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ))),
                  DataColumn(
                      label: Text('Status',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ))),
                  DataColumn(
                      label: Text('Actions',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ))),
                ],
                rows: data.docs.map((doc) {
                  Map<String, dynamic> item =
                      doc.data() as Map<String, dynamic>;
                  item["id"] = doc.id;
                  var createdAt = item["created_at"];
                  var date = (createdAt as Timestamp).toDate();
                  Color? color = Colors.amber;
                  if (item["Status"] == "Belum") {
                    color = Colors.red;
                  } else if (item["Status"] == "Datang") {
                    color = Colors.green;
                  }

                  return DataRow(cells: [
                    DataCell(Text(
                      item["NoResi"],
                    )),
                    DataCell(Text("$date")),
                    DataCell(Text(item["Status"],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ))),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => controller.delete(item),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => controller.updateStatus(item),
                        ),
                      ],
                    )),
                  ]);
                }).toList(),
              ),
            );
          },
        ),
      ),*/

      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("purchase").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return const Text("Error");
            if (snapshot.data == null) return Container();
            if (snapshot.data!.docs.isEmpty) {
              return const Text("No Data");
            }

            final data = snapshot.data!;
            final groupedData = groupByStatus(data.docs);

            return ListView(
              children: groupedData.entries.map((entry) {
                String status = entry.key;
                List<QueryDocumentSnapshot> docs = entry.value;
                Color statusColor = getStatusColor(status);

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        color: statusColor,
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          status,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(
                              label: Container(
                                // color: Colors
                                //  .blue, // Background color for the header
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  'No Resi',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Text color
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Container(
                                //color: Colors
                                // .blue, // Background color for the header
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  'Tgl Terima Incoming',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Text color
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Container(
                                //color: Colors
                                // .blue, // Background color for the header
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  'Departement',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Text color
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Container(
                                //color: Colors
                                //  .blue, // Background color for the header
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  'Actions',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Text color
                                  ),
                                ),
                              ),
                            ),
                          ],
                          rows: docs.map((doc) {
                            Map<String, dynamic> item =
                                doc.data() as Map<String, dynamic>;
                            item["id"] = doc.id;
                            var createdAt = item["created_at"];
                            var Departement = item["Departement"];
                            var date = (createdAt as Timestamp).toDate();

                            return DataRow(cells: [
                              DataCell(Text(item["NoResi"])),
                              DataCell(Text("$date")),
                              DataCell(Text(item["Departement"])),
                              DataCell(Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () => controller.delete(item),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    onPressed: () =>
                                        controller.updateStatus(item),
                                  ),
                                ],
                              )),
                            ]);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  @override
  State<OrderView> createState() => OrderController();
}*/

//BATAS

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';

import 'package:mvc_demo/module/order/controller/order_controller.dart';
import 'package:mvc_demo/module/purchase_form/view/purchase_form_view.dart';
import 'package:mvc_demo/state_util.dart';

import '../../../shared/util/date_util/date_util.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  Widget build(context, OrderController controller) {
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
                  /*  IconButton(
                    onPressed: () => controller.doBack(),
                    icon: const Icon(
                      Icons.menu_outlined,
                      size: 24.0,
                    ),
                  ),*/
                  const SizedBox(width: 1.0),
                  Image.asset(
                    //'lib/shared/util/assets/images/LOGO AJI.png',
                    'lib/shared/util/assets/images/LogiWatch.png',
                    height: 20.0,
                  ),
                  const SizedBox(width: 8.0),
                  const Text("Logs"),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage(
                          'lib/shared/util/assets/images/LogiWatch.png'),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Admin Cek Barang Online',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ]),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Feedback'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.mic),
              title: const Text('Assistant'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle the tap
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          onPressed: () => Get.to(const LogFormView()),
          child: const Icon(Icons.add)),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Log").snapshots(),
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
                // ignore: non_constant_identifier_names
                var Date = item["Date"];
                var date = (Date as Timestamp).toDate();
                var specification = item["Specification PR"];

                /* return ListTile(
                  title: Text(item["Log ID"]),
                  subtitle: Text(item["Specification PR"]),
                  //subtitle:  Text("Specification PR"),
                  trailing: Text(item["Received by"]),
                  //onTap: () => controller.updateStatus(item),
                  onLongPress: () => controller.delete(item),
                );*/

                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 3.0),
                  elevation: 3.0,
                  child: ListTile(
                    title: Text(item["Log ID"]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item["Specification PR"]),
                        //Text("Created At: ${date.toString()}"),
                      ],
                    ),
                    trailing: Text(item["Received by"]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  State<OrderView> createState() => OrderController();
}
