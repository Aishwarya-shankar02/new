// import 'package:designing/ProductListView.dart';
// import 'package:designing/keyboard.dart';
// import 'package:designing/phone.dart';
// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

// class SearchPhoneList extends StatefulWidget {
//   @override
//   _SearchPhoneListState createState() => _SearchPhoneListState();
// }

// class _SearchPhoneListState extends State<SearchPhoneList> {
//   TextEditingController _searchController = TextEditingController();
//   String _searchText = "";

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(() {
//       setState(() {
//         _searchText = _searchController.text;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final phoneProvider = Provider.of<PhoneProvider>(context);
//       final keyboardProvider = Provider.of<KeyboardProvider>(context);
//        final allProducts = [
//       ...phoneProvider.phonelist,
//       ...keyboardProvider.keyboardlist,
//     ];

//     final filteredPhones = phoneProvider.phonelist
//         .where((phone) =>
//             phone.productName.toLowerCase().contains(_searchText.toLowerCase()))
//         .toList();

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.orange,
//         title: Text("Search"),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Search by Name',
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredPhones.length,
//               itemBuilder: (context, index) {
//                 final product = filteredPhones[index];
//                 return ProductCard(product: product);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
// }
import 'package:designing/ProductListView.dart';
import 'package:designing/keyboard.dart';
import 'package:designing/laptop.dart';
import 'package:designing/phone.dart';
import 'package:designing/tablet.dart';
import 'package:designing/watch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPhoneList extends StatefulWidget {
  @override
  _SearchPhoneListState createState() => _SearchPhoneListState();
}

class _SearchPhoneListState extends State<SearchPhoneList> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<PhoneProvider>(context);
    final keyboardProvider = Provider.of<KeyboardProvider>(context);
final tabbProvider = Provider.of<TabbProvider>(context);
final laptopprovider = Provider.of<LaptopProvider>(context);
final watchprovider = Provider.of<WatchProvider>(context);
    final allProducts = [
      ...phoneProvider.phonelist,
      ...keyboardProvider.keyboardlist,
        ...tabbProvider.tabblist,
        ...laptopprovider.laptoplist,
             ...watchprovider.watchlist
    ];

    final filteredProducts = allProducts
        .where((product) => product.productName
            .toLowerCase()
            .contains(_searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        title: Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search by Name',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductCard(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Products'),
        backgroundColor: Colors.orange,
      ),
      body: SearchPhoneList(), // Use the updated SearchPhoneList widget
    );
  }
}
