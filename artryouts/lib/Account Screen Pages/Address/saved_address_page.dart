import 'package:flutter/material.dart';
import 'package:artryouts/Account%20Screen%20Pages/Address/add_address_page.dart';
import 'package:artryouts/Account%20Screen%20Pages/Widgets/address_tile_widget.dart';
import 'package:artryouts/Models/address_model.dart';
import 'package:artryouts/utils.dart';

class SavedAddress extends StatefulWidget {
  const SavedAddress({Key? key}) : super(key: key);

  @override
  State<SavedAddress> createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
 List<Address> myAddresses = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myAddresses.add(Address(
      name: "Omer's Home",
      address: "C-92 Block D North Nazimabad",
      city: "Karachi",
      zip: "74700",
      phone: "+92 335 2835019",
    ));
    myAddresses.add(Address(
      name: "Zunaira's Home",
      address: "Long Life Society, Gulistan-e-Johar",
      city: "Karachi",
      zip: "70000",
      phone: "+92 336 1031999",
    ));
    myAddresses.add(Address(
      name: "Maryam's Home",
      address: "B-34, West-Avenue, Main-Road",
      city: "Karachi",
      zip: "71000",
      phone: "+92 343 2531180",
    ));
    myAddresses[0].defaultAddress = true;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const HeaderBar(title: "Saved Addresses"),
            SizedBox(height: screenHeight * 0.03),
            for (var i = 0; i < myAddresses.length; i++)
              addressCard(myAddresses[i]),
            addAddressButton(),
          ],
        ),
      ),
      
    );
  }

  Widget addressCard(userAddress) {
    return InkWell(
      child: AddressTile(address: userAddress),
      onTap: () {
        myAddresses.remove(userAddress);
        (userAddress as Address).defaultAddress = true;
        myAddresses.insert(0, userAddress);
        // mark rest of the addresses as false
        for (var i = 1; i < myAddresses.length; i++) {
          (myAddresses[i]).defaultAddress = false;
        }
        setState(() {});
      },
    );
  }

  Widget addAddressButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: coolButton(
        text: "Add Address",
        functionToComply: () {
          // Navigate to add address page
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddAddress()));
        },
      ),
    );
  }
}
