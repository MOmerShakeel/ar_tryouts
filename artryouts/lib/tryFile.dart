import 'package:flutter/material.dart';
import 'package:artryouts/Main%20Screen%20Pages/checkout_page.dart';
import 'package:artryouts/augmented_faces.dart';
import 'package:artryouts/cameraScreen.dart';
import 'package:artryouts/custom_object.dart';
import 'package:artryouts/utils.dart';

class tryMe extends StatefulWidget {
  tryMe({Key? key}) : super(key: key);

  @override
  State<tryMe> createState() => _tryMeState();
}

class _tryMeState extends State<tryMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: const MyAppBar(implyLeading: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Splash screen'),
            const Text('Delay'),
            const Text('Onboarding Screen'),
            const Text('Navigate to Login page'),
            logo(),
            artryoutsTextField(hint: "hint", control: TextEditingController()),
            ElevatedButton(
              onPressed: () {
                dialogs.showDeleteConfirmationDialog(context);
              },
              child: const Text('Try Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraApp()),
                );
              },
              child: const Text('Try AR CAMERA'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AugmentedFacesScreen()));
              },
              child: const Text("Augmented Faces"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CustomObject()));
              },
              child: const Text("Custom Anchored Object with onTap"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CheckoutPage()));
              },
              child: const Text("Checkout Page"),
            ),
            // ListTile(
            // onTap: () {
            //   Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => AssetsObject()));
            // },
            // title: Text("Custom sfb object"),
            // ),
          ],
        ),
      ),
    );
  }
}
