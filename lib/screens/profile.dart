import 'package:flutter/material.dart';

class UserProfile {
  final String id;
  String name;
  String email;
  String password; // For demonstration purposes only, you should use a more secure way to handle passwords
  String profilePictureUrl;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.profilePictureUrl,
  });
}

class ProfileScreen extends StatefulWidget {
  final UserProfile user;

  ProfileScreen({required this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _profilePictureUrl = '';

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.user.name;
    _emailController.text = widget.user.email;
    _passwordController.text = widget.user.password;
    _profilePictureUrl = widget.user.profilePictureUrl;
  }

  // Simulate profile picture upload
  Future<void> _uploadProfilePicture() async {
    // Upload logic here
  }

  // Simulate profile information update
  Future<void> _updateProfile() async {
    // Update logic here
  }

  // Simulate account deletion
  Future<void> _deleteAccount() async {
    // Deletion logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: _uploadProfilePicture,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(_profilePictureUrl),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password')),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _updateProfile, child: Text('Update Profile')),
                ElevatedButton(onPressed: _deleteAccount, child: Text('Delete Account')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Profile App',
    home: ProfileScreen(
      user: UserProfile(
        id: '1',
        name: 'John Doe',
        email: 'johndoe@example.com',
        password: 'password123',
        profilePictureUrl: 'https://example.com/profile.jpg',
      ),
    ),
  ));
}
