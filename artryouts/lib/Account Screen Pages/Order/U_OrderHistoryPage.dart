// import 'package:flutter/material.dart';
// import 'package:artryouts/Account%20Screen%20Pages/Order/order_history_details_page.dart';
// import 'package:artryouts/Main%20Screen%20Pages/Widgets/item_list_widgets.dart';
// import 'package:artryouts/Models/order_history_model.dart';
// import 'package:artryouts/Models/order_history_provider.dart';
// import 'package:artryouts/utils.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class OrderHistoryPage extends StatelessWidget {
//   OrderHistoryPage({Key? key}) : super(key: key);

//   List<OrderHistory> history = [];

//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;

//     history = context.read<OrderHistoryProvider>().items;

//     return Scaffold(
//       appBar: const MyAppBar(implyLeading: false),
//       body: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           SizedBox(height: screenHeight * 0.05),
//           const HeaderBar(title: "Order History"),
//           SizedBox(height: screenHeight * 0.05),
//           Expanded(
//             child: ListView.separated(
//               itemCount: history.length,
//               itemBuilder: (context, index) => Card(
//                 color: Colors.transparent,
//                 elevation: 0,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // ItemThumbnail(item: history[index].cart.first),
//                     // const SizedBox(
//                     //   width: 24,
//                     // ),
//                     Container(
//                       width: 100,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(13.5),
//                         color: const Color.fromARGB(255, 46, 44, 44),
//                         image: DecorationImage(
//                           image: NetworkImage(
//                             history[index].cart.first.image,
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         buildOrderHistoryDetail(
//                             "Order ID: ", history[index].orderID),
//                         buildOrderHistoryDetail(
//                             "Status: ", history[index].status),
//                         buildOrderHistoryDetail(
//                             "Quantity: ", history[index].quantity.toString()),
//                         buildOrderHistoryDetail(
//                             "Total: ", "PKR ${history[index].total}"),
//                       ],
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           primary: Colors.red,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(27))),
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) =>
//                               OrderHistoryDetailPage(history: history[index]),
//                         ));
//                       },
//                       child: const Text(
//                         "View Details",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               separatorBuilder: (context, index) => const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
//                 child: Divider(
//                   thickness: 1,
//                   height: 2,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: screenHeight * 0.05)
//         ],
//       ),
//     );
//   }

//   Row buildOrderHistoryDetail(String title, String text) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           title,
//           style: GoogleFonts.poppins(color: Colors.grey[600]),
//         ),
//         Text(text),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:artryouts/Account%20Screen%20Pages/Order/order_tile_widget.dart';
import 'package:artryouts/utils.dart';
import 'package:provider/provider.dart';
import '../../Models/item_provider.dart';
import '../../Models/order_history_model.dart';
import '../../Models/order_history_provider.dart';
import '../../Models/order_model.dart';

class OrderHistoryPage extends StatelessWidget {
  OrderHistoryPage({Key? key}) : super(key: key);
  List<OrderHistory> history = [];
  @override
  Widget build(BuildContext context) {
    history = context.read<OrderHistoryProvider>().items;
    final double screenHeight = MediaQuery.of(context).size.height;
    Widget MyOrderList() {
      return Column(
        children: <Widget>[
          for (var item in history)
            OrderTile(
              order: item,
            ),
          // OrderTile(
          //   order: Order(
          //     id: "8146440301365158",
          //     status: "Shipped",
          //     quantity: 1,
          //     total: 7899,
          //     items: [
          //       context.watch<ItemProvider>().items[0],
          //     ],
          //   ),
          // ),
          // OrderTile(
          //   order: Order(
          //     id: "8146128327445158",
          //     status: "Delivered",
          //     quantity: 2,
          //     total: 57000,
          //     items: [
          //       context.watch<ItemProvider>().items[2],
          //       context.watch<ItemProvider>().items[3],
          //     ],
          //   ),
          // )
        ],
      );
    }

    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: Column(
        children: <Widget>[
          const HeaderBar(title: "Order History"),
          SizedBox(height: screenHeight * 0.05),
          SingleChildScrollView(
            child: MyOrderList(),
          ),
        ],
      ),
    );
  }
}
