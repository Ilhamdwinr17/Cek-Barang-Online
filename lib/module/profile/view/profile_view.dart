import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  Widget build(context, ProfileController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Departement"),
        backgroundColor: Colors.blue,
        /*leading: Row(
          children: [
            const SizedBox(width: 8.0), // Memberikan sedikit spasi dari kiri
            GestureDetector(
              onTap: () {
                // Aksi jika logo diklik
              },
              child: Image.asset(
                'lib/shared/util/assets/images/LOGO AJI.png', // Path gambar logo
                height: 20.0, // Sesuaikan tinggi logo
              ),
            ),
          ],
        ),*/
        actions: [
          IconButton(
            onPressed: () async {
              await showDialog<void>(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Info'),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Anda ingin keluar aplikasi?'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        onPressed: () => controller.doLogout(),
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.logout,
              size: 24.0,
            ),
          ),
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
          onPressed: () {},
          child: const Icon(Icons.add)),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              /* Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                  title: Text(
                      FirebaseAuth.instance.currentUser!.displayName ?? "-"),
                  subtitle:
                      Text(FirebaseAuth.instance.currentUser!.email ?? "-"),
                ),
              ),*/
              Card(
                color: Colors.blueGrey[100],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                  title: const Text("PPIC"),
                  subtitle: const Text("Ade Arif, Silma, Ramdhan, Hasan"),
                ),
              ),
              Card(
                color: Colors.blueGrey[100],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                  title: const Text("HR & GA"),
                  subtitle: const Text("Dewi Kartika"),
                ),
              ),
              Card(
                color: Colors.blueGrey[100],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[200],
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                  title: const Text("QUALITY ASSURANCE"),
                  subtitle: const Text("Dita"),
                ),
              ),
              Card(
                color: Colors.blueGrey[100],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[200],
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                  title: const Text("PRODUKSI"),
                  subtitle: const Text("Apriyanti, Denisa"),
                ),
              ),
              Card(
                color: Colors.blueGrey[100],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[200],
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                  title: const Text("MECHANICAL ENGINEERING"),
                  subtitle: const Text("Budiarto"),
                ),
              ),
              Card(
                color: Colors.blueGrey[100],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[200],
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                  title: const Text("PROCESS ENGINEERING"),
                  subtitle: const Text("Wawan"),
                ),
              ),
              Card(
                color: Colors.blueGrey[100],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[200],
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                  title: const Text("NEW PRODUCT DEVELOPMENT"),
                  subtitle: const Text("Surianto"),
                ),
              ),
              Card(
                color: Colors.blueGrey[100],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[200],
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                  title: const Text("RESEARCH AND DEVELOPMENT"),
                  subtitle: const Text("Yohannes"),
                ),
              ),
              Card(
                color: Colors.blueGrey[100],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[200],
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                  title: const Text("MARKETING"),
                  subtitle: const Text("Dini"),
                ),
              ),
              Card(
                color: Colors.blueGrey[100],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[200],
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                  title: const Text("FINANCE & ACCOUNTING"),
                  subtitle: const Text("Dean"),
                ),
              ),
              Card(
                color: Colors.blueGrey[100],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[200],
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                  title: const Text("WHSP"),
                  subtitle: const Text("Ade Arif"),
                ),
              ),
              Card(
                color: Colors.blueGrey[100],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[200],
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                  title: const Text("PURCHASING"),
                  subtitle: const Text("Hudori"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
