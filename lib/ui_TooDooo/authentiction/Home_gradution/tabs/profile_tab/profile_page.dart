import 'package:basics_project_flutter/cooore/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _profileImagePath;
  final picker = ImagePicker();
  Map<String, String> userDetails = {};
  String userAddress = "";

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  // Load user profile image and data
  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _profileImagePath = prefs.getString('profileImagePath');
      userDetails['name'] = prefs.getString('userName') ?? "";
      userDetails['email'] = prefs.getString('userEmail') ?? "";
      userAddress = prefs.getString('userAddress') ?? "";
    });
  }

  // Handle image picker
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profileImagePath', pickedFile.path);

      setState(() {
        _profileImagePath = pickedFile.path;
      });
    }
  }

  // Handle logout
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => RegisterScreen()), // Navigate to RegisterScreen
    );
  }

  // Navigate to HistoryScreen
  void _goToHistoryScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryScreen()),
    );
  }

  // Function to show Personal Details
  void _showPersonalDetails() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Personal Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: Mohamed'),
              SizedBox(height: 5,),
              Text('Email: moh@med25gmail.com'),
              SizedBox(height: 5,),
              Text('Phone: 01158334281'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to show address input dialog
  void _editAddress() {
    TextEditingController addressController = TextEditingController(text: userAddress);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Address'),
          content: TextField(
            controller: addressController,
            decoration: const InputDecoration(hintText: "Enter your address"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('userAddress', addressController.text);

                setState(() {
                  userAddress = addressController.text;
                });

                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 20),
              _buildMenuGroup(
                context,
                menuItems: [
                  _MenuItem(icon: Icons.history, title: 'History', onTap: _goToHistoryScreen),
                  _MenuItem(icon: Icons.person, title: 'Personal Details', onTap: _showPersonalDetails),
                  _MenuItem(icon: Icons.home, title: 'Address', onTap: _editAddress), // Show address editing option
                ],
              ),
              const SizedBox(height: 20),
              _buildMenuGroup(
                context,
                menuItems: [
                  _MenuItem(icon: Icons.logout, title: 'Log out', onTap: _logout),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: _profileImagePath != null
                ? FileImage(File(_profileImagePath!))
                : null,
            child: _profileImagePath == null
                ? const Icon(
              Icons.person,
              size: 50,
              color: Colors.white,
            )
                : null,
            backgroundColor: Colors.teal,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          userDetails['name'] ?? 'Name not available',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildMenuGroup(BuildContext context, {required List<_MenuItem> menuItems}) {
    return Column(
      children: menuItems.map((item) {
        return ListTile(
          leading: Icon(item.icon, color: Colors.teal),
          title: Text(
            item.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          onTap: item.onTap,
        );
      }).toList(),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  _MenuItem({required this.icon, required this.title, this.onTap});
}

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, String>> historyData = [];

  @override
  void initState() {
    super.initState();
    _loadHistoryData();
  }

  // Load data from Firestore
  Future<void> _loadHistoryData() async {
    FirebaseFirestore.instance
        .collection('history')
        .get()
        .then((QuerySnapshot querySnapshot) {
      List<Map<String, String>> loadedHistory = [];
      querySnapshot.docs.forEach((doc) {
        loadedHistory.add({
          'name': doc['name'],
          'result': doc['result'],
          'disease': doc['disease'],
          'date': doc['date'],
          'time': doc['time'],
        });
      });
      setState(() {
        historyData = loadedHistory;
      });
    }).catchError((error) {
      print("Failed to load data: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.teal,
      ),
      body: historyData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: historyData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Entry ${index + 1}: ${historyData[index]['name']}"),
            subtitle: Text(
              "Disease: ${historyData[index]['disease']} - Result: ${historyData[index]['result']} - Date: ${historyData[index]['date']} ${historyData[index]['time']}",
            ),
          );
        },
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoute.registerRoute);
            // Navigate to the registration page if needed
          },
          child: const Text('Register'),
        ),
      ),
    );
  }
}
