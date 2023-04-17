import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Center(
        child: Column(
          children: [
            Container(
              //height: MediaQuery.of(context).size.height * 0.3,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 25),
              height: 160,
              color: Colors.blue,
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [const CircleAvatar(radius: 45), CircleAvatar(child: Icon(Icons.edit), radius: 15)],
                ),
                onTap: () {},
              ),
            ),
            const Text('data'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('back'))
          ],
        ),
      ),
    );
  }
}
