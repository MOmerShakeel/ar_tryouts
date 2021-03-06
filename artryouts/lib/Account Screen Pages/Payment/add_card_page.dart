import 'package:flutter/material.dart';
import 'package:artryouts/Account%20Screen%20Pages/Widgets/debitcard_widget.dart';
import 'package:artryouts/Models/debitcard_model.dart';
import 'package:artryouts/utils.dart';

class AddCard extends StatefulWidget {
  AddCard({Key? key, this.card}) : super(key: key);
  DebitCard? card;
  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _nameOnCardController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  late DebitCard card1;
  String title = "Add Card";
  @override
  void initState() {
    super.initState();
    // If there is a card Passing means editing
    if (widget.card != null) {
      title = "Edit Card";
      card1 = widget.card!;
      _cardNumberController.text =
          "*" * 12 + card1.cardNumber.substring(12, 16);
      _nameOnCardController.text = card1.cardHolderName;
      _expiryDateController.text = card1.expiryDate;
      _cvvController.text = "";
      _bankNameController.text = card1.bankName;
    } else {
      card1 = DebitCard(
          cardNumber: "", cardHolderName: "", expiryDate: "", cvv: "");
    }
  }

  bool back = false;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    card1.cardNumber = _cardNumberController.text;
    card1.cardHolderName = _nameOnCardController.text;
    card1.expiryDate = _expiryDateController.text;
    card1.cvv = _cvvController.text;
    card1.bankName = _bankNameController.text;
    card1.cardFront = !back;
    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Login Banner
            HeaderBar(title: title),
            SizedBox(height: screenHeight * 0.03),
            BankCard(
              options: false,
              card: card1,
            ),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(
              width: screenHeight * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: Column(
                  children: <Widget>[
                    // Name TextField
                    Row(children: const <Widget>[Text("  Card Holder Name")]),
                    artryoutsTextField(
                      hint: "Name",
                      control: _nameOnCardController,
                      onChangedFunction: (value) {
                        back = false;
                        card1.cardHolderName = value;
                        setState(() {});
                      },
                    ),
                    // Card Number TextField
                    Row(children: const <Widget>[Text("  Card Number")]),
                    artryoutsTextField(
                      hint: "Number",
                      control: _cardNumberController,
                      textType: TextInputType.number,
                      length: 16,
                      onChangedFunction: (value) {
                        back = false;
                        card1.cardNumber = value;
                        setState(() {});
                      },
                    ),
                    // Bank Name TextField
                    Row(children: const <Widget>[Text("  Bank Name")]),
                    artryoutsTextField(
                      hint: "Safe Bank",
                      control: _bankNameController,
                      onChangedFunction: (value) {
                        back = false;
                        card1.bankName = value;
                        setState(() {});
                      },
                    ),
                    // Expiry TextField
                    Row(children: const <Widget>[Text("  Expiry Date")]),
                    artryoutsTextField(
                      hint: "MM/YY",
                      textType: TextInputType.text,
                      control: _expiryDateController,
                      onChangedFunction: (value) {
                        back = false;
                        card1.expiryDate = value;
                        setState(() {});
                      },
                    ),
                    // Cvv TextField
                    Row(children: const <Widget>[Text("  Cvv")]),
                    artryoutsTextField(
                      hint: "cvv",
                      control: _cvvController,
                      textType: TextInputType.number,
                      length: 3,
                      onChangedFunction: (value) {
                        back = true;
                        card1.cardHolderName = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
            // Login Button
            coolButton(
              text: "Save",
              functionToComply: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const bottomBar(),
    );
  }
}
