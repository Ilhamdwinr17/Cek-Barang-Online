/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mvc_demo/module/log_detail/controller/log_detail_controller.dart';

class LogDetailView extends StatefulWidget {
  final Map<String, dynamic> item;

  const LogDetailView({
    super.key,
    required this.item,
  });

  @override
  State<LogDetailView> createState() => LogDetailController();

  Widget build(BuildContext context, LogDetailController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Detail"),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: controller.itemData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('No data found'));
          } else {
            final data = snapshot.data!.data() as Map<String, dynamic>;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Log ID: ${data["Log ID"] ?? 'N/A'}',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Text(
                          'Specification PR: ${data["Specification PR"] ?? 'N/A'}'),
                      const SizedBox(height: 8),
                      Text('Received By: ${data["Received by"] ?? 'N/A'}'),
                      const SizedBox(height: 8),
                      Text('Status: ${data["Status"] ?? 'N/A'}'),
                      // Add more fields as needed
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}*/

/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mvc_demo/module/log_detail/controller/log_detail_controller.dart';

class LogDetailView extends StatefulWidget {
  final Map<String, dynamic> item;

  const LogDetailView({
    super.key,
    required this.item,
  });

  @override
  State<LogDetailView> createState() => LogDetailController();

  Widget build(BuildContext context, LogDetailController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Detail"),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: controller.itemData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('No data found'));
          } else {
            final data = snapshot.data!.data() as Map<String, dynamic>;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Log ID: ${data["Log ID"] ?? 'N/A'}',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 8),
                          Text(
                              'Specification PR: ${data["Specification PR"] ?? 'N/A'}'),
                          const SizedBox(height: 8),
                          Text('Received By: ${data["Received by"] ?? 'N/A'}'),
                          const SizedBox(height: 8),
                          Text('Status: ${data["Status"] ?? 'N/A'}'),
                          // Add more fields as needed
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mvc_demo/module/log_detail/controller/log_detail_controller.dart';

class LogDetailView extends StatefulWidget {
  final Map<String, dynamic> item;

  const LogDetailView({
    super.key,
    required this.item,
  });

  @override
  State<LogDetailView> createState() => LogDetailController();

  Widget build(BuildContext context, LogDetailController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Detail"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: controller.itemData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('No data found'));
          } else {
            final data = snapshot.data!.data() as Map<String, dynamic>;

            var createdAt = item["Date"];
            var date = (createdAt as Timestamp).toDate();

            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ListTile(
                  title: const Text('Log ID'),
                  subtitle: Text(data["Log ID"] ?? 'N/A'),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Specification PR'),
                  subtitle: Text(data["Specification PR"] ?? 'N/A'),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Quantity'),
                  subtitle: Text(data["Quantity"] ?? 'N/A'),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Date'),
                  subtitle: Text(("$date")),
                ),
                const Divider(),

                ListTile(
                  title: const Text('Received By'),
                  subtitle: Text(data["Received by"] ?? 'N/A'),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Status'),
                  subtitle: Text(data["Status"] ?? 'N/A'),
                ),
                // Add more ListTile widgets as needed
              ],
            );
          }
        },
      ),
    );
  }
}
