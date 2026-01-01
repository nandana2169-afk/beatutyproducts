
// import 'package:flutter/material.dart';

// class AddAgreementScreen extends StatefulWidget {
//   const AddAgreementScreen({super.key});

//   @override
//   State<AddAgreementScreen> createState() => _AddAgreementScreenState();
// }

// List<String> _items = ["Wedding", "Corporate", "Birthday", "Other"];

// class AgreementItem {
//   TextEditingController _itemController = TextEditingController();
//   TextEditingController _quantityController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();
//   TextEditingController _totalController = TextEditingController();
// }

// class _AddAgreementScreenState extends State<AddAgreementScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _AgreementNumberController =
//       TextEditingController();
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _clientNameController = TextEditingController();
//   final TextEditingController _clientAddressController =
//       TextEditingController();
//   final TextEditingController _clientPhoneController = TextEditingController();
//   final TextEditingController _clientEmailController = TextEditingController();
//   final TextEditingController _eventVenueController = TextEditingController();
//   final TextEditingController _amountController = TextEditingController();
//   final TextEditingController _eventTypeController = TextEditingController();
//   final TextEditingController _otherEventController = TextEditingController();
//   final TextEditingController _notesController = TextEditingController();
//   final TextEditingController _taxPercentController = TextEditingController();
//   final TextEditingController _taxAmountController = TextEditingController();
//   final TextEditingController _grandTotalController = TextEditingController();
//   final TextEditingController _groomController = TextEditingController();
//   final TextEditingController _brideController = TextEditingController();

//   List<AgreementItem> AgreementItems = [AgreementItem()];

//   void calculateTotal(int i) {
//     final item = AgreementItems[i];
//     double q = double.tryParse(item._quantityController.text) ?? 0;
//     double p = double.tryParse(item._priceController.text) ?? 0;

//     item._totalController.text = (q * p).toStringAsFixed(2);

//     //update subtotal
//     _amountController.text = totalAgreement().toStringAsFixed(2);

//     //update Tax
//     _taxAmountController.text = calculateTax().toStringAsFixed(2);

//     //update grandtotal
//     _grandTotalController.text = grandTotal().toStringAsFixed(2);

//     setState(() {});
//   }

//   double totalAgreement() {
//     double sum = 0;

//     for (var item in AgreementItems) {
//       double t = double.tryParse(item._totalController.text) ?? 0;
//       sum += t;
//     }

//     return sum;
//   }

//   double grandTotal() {
//     double AgreementTotal = double.tryParse(_amountController.text) ?? 0;
//     double gstTotal = double.tryParse(_taxAmountController.text) ?? 0;
//     double total = AgreementTotal + gstTotal;
//     return total;
//   }

//   double calculateTax() {
//     double tax = double.tryParse(_taxPercentController.text) ?? 0;
//     double Agreement = double.tryParse(_amountController.text) ?? 0;
//     return (Agreement * tax) / 100;
//   }

//   void addNewItem() {
//     setState(() {
//       AgreementItems.add(AgreementItem());
//     });
//   }

//   void removeItem(int i) {
//     setState(() {
//       AgreementItems.removeAt(i);
//       _amountController.text = totalAgreement().toStringAsFixed(2);
//       _taxAmountController.text = calculateTax().toStringAsFixed(2);
//       _grandTotalController.text = grandTotal().toStringAsFixed(2);
//     });
//   }

//   @override
//   void dispose() {
//     _AgreementNumberController.dispose();
//     _clientNameController.dispose();
//     _clientAddressController.dispose();
//     _clientPhoneController.dispose();
//     _clientEmailController.dispose();
//     _eventVenueController.dispose();
//     _amountController.dispose();
//     _dateController.dispose();
//     _notesController.dispose();
//     _taxAmountController.dispose();
//     _taxPercentController.dispose();
//     _grandTotalController.dispose();
//     _eventTypeController.dispose();
//     _otherEventController.dispose();

//     super.dispose();
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       print("Agreement: ${_AgreementNumberController.text}");
//       print("Client: ${_clientNameController.text}");
//       print("Amount: ${_amountController.text}");

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Agreement added successfully!")),
//       );

//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(builder: (_) => const DashboardScreen()),
//       // );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add Agreement"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               bool isWide = constraints.maxWidth > 650;

//               return isWide
//                   ? Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(child: _buildFormSection()),
//                         const SizedBox(width: 25),
//                         Expanded(child: _buildPreviewSection()),
//                       ],
//                     )
//                   : Column(
//                       children: [
//                         _buildFormSection(),
//                         const SizedBox(height: 25),
//                         _buildPreviewSection(),
//                       ],
//                     );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   // FORM SECTION

//   Widget _buildFormSection() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Agreement Information",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 15),

//           // --- Row 1 ---
//           Row(
//             children: [
//               Expanded(
//                 child: _input(
//                   controller: _AgreementNumberController,
//                   label: "Agreement Number",
//                   validator: (v) =>
//                       v!.isEmpty ? "Agreement number is required" : null,
//                 ),
//               ),
//               const SizedBox(width: 15),
//               Expanded(
//                 child: TextFormField(
//                   controller: _dateController,
//                   readOnly: true,
//                   decoration: const InputDecoration(
//                     labelText: "Event Date",
//                     border: OutlineInputBorder(),
//                   ),
//                   onTap: () async {
//                     DateTime? picked = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(2100),
//                     );
//                     if (picked != null) {
//                       _dateController.text =
//                           "${picked.day.toString().padLeft(2, '0')}-"
//                           "${picked.month.toString().padLeft(2, '0')}-"
//                           "${picked.year}";
//                       setState(() {});
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),

//           // --- Row 2 ---
//           Row(
//             children: [
//               Expanded(
//                 child: _input(
//                   controller: _clientNameController,
//                   label: "Client Name",
//                   validator: (v) =>
//                       v!.isEmpty ? "Client name is required" : null,
//                 ),
//               ),
//               const SizedBox(width: 15),
//               Expanded(
//                 child: _input(
//                   controller: _clientPhoneController,
//                   label: "Phone Number",
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Number is required";
//                     }
//                     if (value.length != 10) {
//                       return "Enter 10-digit Number";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),
         
//           _input(
//             controller: _clientAddressController,
//             label: "Client Address",
//             validator: (v) => v!.isEmpty ? "Address is required" : null,
//           ),
//           const SizedBox(height: 15),

//           Row(
//             children: [
//               Expanded(
//                 child: _input(
//                   controller: _clientEmailController,
//                   label: "Email Address",
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Email is required";
//                     }
//                     if (!RegExp(
//                       r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
//                     ).hasMatch(value)) {
//                       return "Enter a valid email";
//                     }
//                     return null;
//                   },
//                 ),
//               ),

//               const SizedBox(width: 15),

//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     DropdownButtonFormField<String>(
//                       value: _items.contains(_eventTypeController.text)
//                           ? _eventTypeController.text
//                           : null,
//                       decoration: const InputDecoration(
//                         labelText: "Event Type",
//                         border: OutlineInputBorder(),
//                       ),
//                       items: _items.map((item) {
//                         return DropdownMenuItem<String>(
//                           value: item,
//                           child: Text(item),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         _eventTypeController.text = value ?? "";
//                         setState(() {});
//                       },
//                       validator: (value) {
//                         if (_eventTypeController.text.isEmpty) {
//                           return "Please select an item";
//                         }
//                         if (_eventTypeController.text == "Other" &&
//                             _otherEventController.text.isEmpty) {
//                           return "Please enter a value for Other";
//                         }
//                         return null;
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),
//           if (_eventTypeController.text == "Wedding")
//             Row(
//               children: [
//                 Expanded(
//                   child: _input(controller: _groomController, label: "Groom"),
//                 ),
//                 const SizedBox(width: 15),
//                 Expanded(
//                   child: _input(controller: _brideController, label: "Bride"),
//                 ),
//               ],
//             ),

//           if (_eventTypeController.text == "Other")
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: Align(
//                 alignment: Alignment.centerRight, 
//                 child: SizedBox(
//                   width: 280, 
//                   child: TextFormField(
//                     controller: _otherEventController,
//                     decoration: const InputDecoration(
//                       labelText: "Enter Item",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

          
//           const SizedBox(height: 15),
//           _input(
//             controller: _eventVenueController,
//             label: "Event Venue",
//             validator: (v) => v!.isEmpty ? "Venue is required" : null,
//           ),
//           SizedBox(height: 25,),



//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Services",style: TextStyle(fontSize: 16),),
//               TextButton(style: TextButton.styleFrom(backgroundColor: Colors.green,padding:EdgeInsets.symmetric(horizontal: 12,vertical: 6)),
//                 onPressed: (){

//               }, child:Text(" + Add Services",style: TextStyle(color:Colors.black),))
//             ],
//           ),
//           Center(child: Text(" No Services added yet",style: TextStyle(fontSize: 14),)),
//           SizedBox(height: 10,),
//           Center(
//             child: OutlinedButton(style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.green)),
//               onPressed: (){
            
//             }, child:Text("Add First Service",style: TextStyle(color: Colors.green),)),
//           ),
//           SizedBox(height: 20,),
//            Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Food menu items",style: TextStyle(fontSize: 16),),
//               TextButton(style: TextButton.styleFrom(backgroundColor: Colors.green,padding:EdgeInsets.symmetric(horizontal: 12,vertical: 6)),
//                 onPressed: (){

//               }, child:Text(" + Add Services",style: TextStyle(color:Colors.black),))
//             ],
//           ),
         
//           Center(child: Text(" No Services added yet",style: TextStyle(fontSize: 14),)),
//           SizedBox(height: 10,),
//           Center(
//             child: OutlinedButton(style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.green)),
//               onPressed: (){
            
//             }, child:Text("Add First Service",style: TextStyle(color: Colors.green),)),
//           ),
//             SizedBox(height: 20,),
//            Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Event Listing items",style: TextStyle(fontSize: 16),),
//               TextButton(style: TextButton.styleFrom(backgroundColor: Colors.green,padding:EdgeInsets.symmetric(horizontal: 12,vertical: 6)),
//                 onPressed: (){

//               }, child:Text(" + Add Services",style: TextStyle(color:Colors.black),))
//             ],
//           ),
//           Center(child: Text(" No Services added yet",style: TextStyle(fontSize: 14),)),
//           SizedBox(height: 10,),
//           Center(
//             child: OutlinedButton(style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.green)),
//               onPressed: (){
            
//             }, child:Text("Add First Service",style: TextStyle(color: Colors.green),)),
//           ),
//           const SizedBox(height: 15),

//           const SizedBox(height: 10),
//           const Text(
//             "Agreement items",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//           const SizedBox(height: 15),


//           Column(
//             children: [
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: AgreementItems.length,
//                 itemBuilder: (context, i) {
//                   final item = AgreementItems[i];
//                   return Card(
//                     color: const Color.fromARGB(255, 231, 231, 231),
//                     margin: EdgeInsets.only(bottom: 10),
//                     child: Padding(
//                       padding: const EdgeInsets.all(30),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               controller: item._itemController,
//                               decoration: InputDecoration(
//                                 labelText: "Item",
//                                 border: OutlineInputBorder(),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           Expanded(
//                             child: TextFormField(
//                               controller: item._quantityController,
//                               decoration: InputDecoration(
//                                 labelText: "Qty",
//                                 border: OutlineInputBorder(),
//                               ),
//                               keyboardType: TextInputType.number,
//                               onChanged: (_) => calculateTotal(i),
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           Expanded(
//                             child: TextFormField(
//                               controller: item._priceController,
//                               decoration: InputDecoration(
//                                 labelText: "Price",
//                                 border: OutlineInputBorder(),
//                               ),
//                               keyboardType: TextInputType.number,
//                               onChanged: (_) => calculateTotal(i),
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           IconButton(
//                             icon: Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => removeItem(i),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),

           
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: TextButton.icon(
//                   onPressed: addNewItem,
//                   icon: Icon(Icons.add, color: Colors.green),
//                   label: Text(
//                     "Add Item",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),

//           Row(
//             children: [
//               Expanded(
//                 child: _input(
//                   controller: _taxPercentController,
//                   label: "Tax %",
//                   keyboardType: TextInputType.number,
//                   onChanged: (_) {
//                     _taxAmountController.text = calculateTax().toStringAsFixed(
//                       2,
//                     );
//                     _grandTotalController.text = grandTotal().toStringAsFixed(
//                       2,
//                     );
//                     setState(() {});
//                   },
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: _input(controller: _notesController, label: "Notes"),
//               ),
//             ],
//           ),

//           const SizedBox(height: 15),

//           Center(
//             child: ElevatedButton(
//               onPressed: _submitForm,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 40,
//                   vertical: 15,
//                 ),
//               ),
//               child: const Text(
//                 "Add Agreement",
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _input({
//     required TextEditingController controller,
//     required String label,
//     String? Function(String?)? validator,
//     TextInputType keyboardType = TextInputType.text,
//     Function(String)? onChanged,
//   }) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(),
//       ),
//       validator: validator,
//       onChanged: (value) {
//         if (onChanged != null) onChanged(value); 
//         setState(() {}); 
//       },
//       keyboardType: keyboardType,
//     );
//   }

  
//   Widget _buildPreviewSection() {
//     return Card(
//       color: const Color.fromARGB(255, 231, 231, 231),
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Agreement Preview",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               "Agreement:${_AgreementNumberController.text}",
//               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               "Evergreen Decoration and Outdoor Catering",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               "6th Floor, Bishop Jerome Nagar Old Block,\n"
//               "Bishop Jerome Ln, Chinnakada, Kollam, Kerala 691001",
//             ),
//             const SizedBox(height: 10),
//             Divider(color: Colors.black),
//             const SizedBox(height: 10),

//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // LEFT COLUMN
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Bill To",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(_clientNameController.text),
//                       Text(_clientAddressController.text),
//                       Text(_clientPhoneController.text),
//                       Text(_clientEmailController.text),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(width: 20),

                
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Event Details",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text("Event Date: ${_dateController.text}"),
//                       Text(
//                         "Event Type: ${_eventTypeController.text == "Other" ? _otherEventController.text : _eventTypeController.text}",
//                       ),
//                       if (_eventTypeController.text == "Wedding")
//                         Text(
//                           "${_groomController.text} & ${_brideController.text}",
//                         ),
//                       Text("Venue: ${_eventVenueController.text}"),
//                       Text("Amount: ₹${_amountController.text}"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 7),
//             Divider(color: Colors.black),
//             const SizedBox(height: 7),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Items",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 5),

//                 ...AgreementItems.map((m) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 4),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
                 
//                         Expanded(
//                           flex: 3,
//                           child: Text(
//                             "${m._itemController.text} "
//                             "(${m._quantityController.text} × ${m._priceController.text})",
//                           ),
//                         ),

                        
//                         Expanded(
//                           flex: 1,
//                           child: Text(
//                             m._totalController.text,
//                             textAlign: TextAlign.right,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }),
//               ],
//             ),

//             const SizedBox(height: 7),
//             Divider(color: Colors.black),
//             const SizedBox(height: 7),
//             const Text(
//               "Notes",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(_notesController.text),
//             const SizedBox(height: 7),
//             Divider(color: Colors.black),
//             const SizedBox(height: 7),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     const Text(
//                       "Subtotal :",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [Text("₹${totalAgreement().toStringAsFixed(2)}")],
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       "Tax ${_taxPercentController.text}% :",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(children: [Text("₹${_taxAmountController.text}")]),
//               ],
//             ),
//             const SizedBox(height: 7),
//             Divider(color: Colors.black),
//             const SizedBox(height: 7),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     const Text(
//                       "Grand Total :",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(children: [Text("₹${grandTotal().toStringAsFixed(2)}")]),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';

class AddAgreementScreen extends StatefulWidget {
  const AddAgreementScreen({super.key});

  @override
  State<AddAgreementScreen> createState() => _AddAgreementScreenState();
}

// Simple data class to store saved items
class SavedItem {
  final String title;
  final String desc;
  final double qty;
  final double price;
  SavedItem({required this.title, required this.desc, required this.qty, required this.price});
}

class _AddAgreementScreenState extends State<AddAgreementScreen> {
  final _formKey = GlobalKey<FormState>();

  // Main Form Controllers
  final TextEditingController _agreementNumberController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _clientNameController = TextEditingController();
  final TextEditingController _clientAddressController = TextEditingController();
  final TextEditingController _clientPhoneController = TextEditingController();
  final TextEditingController _clientEmailController = TextEditingController();
  final TextEditingController _eventTypeController = TextEditingController();
  final TextEditingController _venueController = TextEditingController();
  final TextEditingController _groomController = TextEditingController();
  final TextEditingController _brideController = TextEditingController();
  final TextEditingController _otherEventController = TextEditingController();
  final TextEditingController _advanceController = TextEditingController(text: "0");
  final TextEditingController _balanceController = TextEditingController(text: "0");
  final TextEditingController _totalAmountController = TextEditingController(text: "0");
  final TextEditingController _termsController = TextEditingController();

  // Lists to store the "Saved" items (Chips)
  List<SavedItem> serviceItems = [];
  List<SavedItem> foodMenuItems = [];
  List<SavedItem> eventListingItems = [];

  // Dedicated controllers for each section's input row (to keep them independent)
  final TextEditingController _sTitle = TextEditingController();
  final TextEditingController _sDesc = TextEditingController();
  final TextEditingController _sQty = TextEditingController(text: "1");
  final TextEditingController _sPrice = TextEditingController(text: "0");

  final TextEditingController _fTitle = TextEditingController();
  final TextEditingController _fDesc = TextEditingController();
  final TextEditingController _fQty = TextEditingController(text: "1");
  final TextEditingController _fPrice = TextEditingController(text: "0");

  final TextEditingController _eTitle = TextEditingController();
  final TextEditingController _eDesc = TextEditingController();
  final TextEditingController _eQty = TextEditingController(text: "1");
  final TextEditingController _ePrice = TextEditingController(text: "0");

  List<String> eventTypes = ["Wedding", "Corporate", "Birthday", "Other"];

  void calculateTotals() {
    double grandTotal = 0;
    List<List<SavedItem>> allLists = [serviceItems, foodMenuItems, eventListingItems];
    
    for (var list in allLists) {
      for (var item in list) {
        grandTotal += (item.qty * item.price);
      }
    }
    
    double advance = double.tryParse(_advanceController.text) ?? 0;
    setState(() {
      _totalAmountController.text = grandTotal.toStringAsFixed(2);
      _balanceController.text = (grandTotal - advance).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Agreement", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 900;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(child: _buildFormSection()),
                ),
                if (isWide) const SizedBox(width: 20),
                if (isWide)
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(child: _buildPreviewSection()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFormSection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Agreement Information", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              Row(
                children: [
                  Expanded(child: _inputField(_agreementNumberController, "Agreement Number")),
                  const SizedBox(width: 15),
                  Expanded(child: _datePickerField(context)),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Client Information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _inputField(_clientNameController, "Client Name *")),
                  const SizedBox(width: 15),
                  Expanded(child: _inputField(_clientPhoneController, "Phone Number *", isNumber: true)),
                ],
              ),
              const SizedBox(height: 15),
              _inputField(_clientAddressController, "Client Address *", maxLines: 2),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(child: _inputField(_clientEmailController, "Email Address")),
                  const SizedBox(width: 15),
                  Expanded(child: _dropdownField()),
                ],
              ),
              if (_eventTypeController.text == "Wedding")
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Expanded(child: _inputField(_groomController, "Groom Name")),
                      const SizedBox(width: 15),
                      Expanded(child: _inputField(_brideController, "Bride Name")),
                    ],
                  ),
                ),
              if (_eventTypeController.text == "Other")
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: _inputField(_otherEventController, "Specify Event Type"),
                ),
              const SizedBox(height: 15),
              _inputField(_venueController, "Venue *"),

              const SizedBox(height: 30),
              
              // --- PASSING SPECIFIC CONTROLLERS TO EACH SECTION ---
              _buildInvoiceBoxSection("Services", serviceItems, _sTitle, _sDesc, _sQty, _sPrice),
              const SizedBox(height: 30),
              _buildInvoiceBoxSection("Food Menu Items", foodMenuItems, _fTitle, _fDesc, _fQty, _fPrice),
              const SizedBox(height: 30),
              _buildInvoiceBoxSection("Event Listing Items", eventListingItems, _eTitle, _eDesc, _eQty, _ePrice),

              const SizedBox(height: 30),
              const Text("Amount Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              Row(
                children: [
                  Expanded(child: _inputField(_totalAmountController, "Total Amount *", readOnly: true)),
                  const SizedBox(width: 10),
                  Expanded(child: _inputField(_advanceController, "Advance Amount", isNumber: true, onChanged: (v) => calculateTotals())),
                  const SizedBox(width: 10),
                  Expanded(child: _inputField(_balanceController, "Balance Amount", readOnly: true)),
                ],
              ),
              const SizedBox(height: 20),
              _inputField(_termsController, "Terms & Conditions *", maxLines: 3),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {},
                  child: const Text("Save Agreement", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FIXED PORTION: Const Size used instead of Offset, and Controllers are now dynamic
  Widget _buildInvoiceBoxSection(
    String sectionTitle, 
    List<SavedItem> dataList,
    TextEditingController tTitle,
    TextEditingController tDesc,
    TextEditingController tQty,
    TextEditingController tPrice,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sectionTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),

        // Display area for SAVED items (Chips)
        if (dataList.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: dataList.asMap().entries.map((entry) {
                int idx = entry.key;
                var item = entry.value;
                return Chip(
                  label: Text("${item.title}: ${item.desc} (x${item.qty})", style: const TextStyle(fontSize: 12)),
                  deleteIcon: const Icon(Icons.close, size: 14),
                  onDeleted: () {
                    setState(() {
                      dataList.removeAt(idx);
                      calculateTotals();
                    });
                  },
                  backgroundColor: Colors.green.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.green),
                  ),
                );
              }).toList(),
            ),
          ),

        // THE CONSTANT INPUT ROW
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: Row(
            children: [
              Expanded(flex: 2, child: _smallEntryField(tTitle, "Title")),
              const SizedBox(width: 8),
              Expanded(flex: 3, child: _smallEntryField(tDesc, "Item Name")),
              const SizedBox(width: 8),
              Expanded(flex: 1, child: _smallEntryField(tQty, "Qty", isNumber: true)),
              const SizedBox(width: 8),
              Expanded(flex: 2, child: _smallEntryField(tPrice, "Price", isNumber: true)),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, 
                  // FIXED: Changed Offset to Size
                  minimumSize: const Size(40, 45),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  if (tDesc.text.isNotEmpty) {
                    setState(() {
                      // 1. Save data to the list
                      dataList.add(SavedItem(
                        title: tTitle.text,
                        desc: tDesc.text,
                        qty: double.tryParse(tQty.text) ?? 1,
                        price: double.tryParse(tPrice.text) ?? 0,
                      ));
                      // 2. Clear controllers for next use
                      tTitle.clear();
                      tDesc.clear();
                      tQty.text = "1";
                      tPrice.text = "0";
                      // 3. Update totals
                      calculateTotals();
                    });
                  }
                },
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _smallEntryField(TextEditingController ctrl, String label, {bool isNumber = false}) {
    return TextFormField(
      controller: ctrl,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 11),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      ),
    );
  }

  Widget _buildPreviewSection() {
    String eventType = _eventTypeController.text;
    if (eventType == "Other" && _otherEventController.text.isNotEmpty) {
      eventType = _otherEventController.text;
    }
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Agreement Preview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("BILL TO:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.green)),
            Text(_clientNameController.text.isEmpty ? "Client Name" : _clientNameController.text, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (_clientAddressController.text.isNotEmpty) Text(_clientAddressController.text),
            const SizedBox(height: 15),
            const Text("EVENT DETAILS:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.green)),
            Text("Event Type: $eventType"),
            if (_eventTypeController.text == "Wedding")
              Text("Groom: ${_groomController.text} | Bride: ${_brideController.text}", style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
            Text("Venue: ${_venueController.text}"),
            Text("Date: ${_dateController.text}"),
            const Divider(height: 30),
            _previewList("Services", serviceItems),
            _previewList("Food Items", foodMenuItems),
            _previewList("Event Listing", eventListingItems),
            const Divider(height: 30),
            _amountRow("Total Amount:", "₹${_totalAmountController.text}"),
            _amountRow("Advance Paid:", "₹${_advanceController.text}"),
            _amountRow("Balance Due:", "₹${_balanceController.text}", isBold: true),
          ],
        ),
      ),
    );
  }

  Widget _previewList(String title, List<SavedItem> items) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ...items.map((item) => Text("- ${item.title} ${item.desc} (${item.qty} x ${item.price})", style: const TextStyle(fontSize: 12))),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _amountRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _inputField(TextEditingController ctrl, String label, {bool isNumber = false, int maxLines = 1, bool readOnly = false, Function(String)? onChanged}) {
    return TextFormField(
      controller: ctrl,
      maxLines: maxLines,
      readOnly: readOnly,
      onChanged: onChanged ?? (v) => setState(() {}),
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    );
  }

  Widget _datePickerField(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      readOnly: true,
      decoration: const InputDecoration(labelText: "Event Date", border: OutlineInputBorder(), suffixIcon: Icon(Icons.calendar_today)),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          setState(() => _dateController.text = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}");
        }
      },
    );
  }

  Widget _dropdownField() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(labelText: "Event Type *", border: OutlineInputBorder()),
      items: eventTypes.map((cat) => DropdownMenuItem(value: cat, child: Text(cat))).toList(),
      onChanged: (newValue) {
        setState(() {
          _eventTypeController.text = newValue!;
          if (newValue != "Wedding") {
            _groomController.clear();
            _brideController.clear();
          }
          if (newValue != "Other") _otherEventController.clear();
        });
      },
    );
  }
}
 
// another vertion

// import 'package:flutter/material.dart';

// class AddAgreementScreen extends StatefulWidget {
//   const AddAgreementScreen({super.key});

//   @override
//   State<AddAgreementScreen> createState() => _AddAgreementScreenState();
// }

// // Simple data class to store saved items
// class SavedItem {
//   final String title;
//   final String desc;
//   final double qty;
//   final double price;
//   SavedItem({required this.title, required this.desc, required this.qty, required this.price});
// }

// class _AddAgreementScreenState extends State<AddAgreementScreen> {
//   final _formKey = GlobalKey<FormState>();

//   // Main Form Controllers
//   final TextEditingController _agreementNumberController = TextEditingController();
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _clientNameController = TextEditingController();
//   final TextEditingController _clientAddressController = TextEditingController();
//   final TextEditingController _clientPhoneController = TextEditingController();
//   final TextEditingController _clientEmailController = TextEditingController();
//   final TextEditingController _eventTypeController = TextEditingController();
//   final TextEditingController _venueController = TextEditingController();
//   final TextEditingController _groomController = TextEditingController();
//   final TextEditingController _brideController = TextEditingController();
//   final TextEditingController _otherEventController = TextEditingController();
//   final TextEditingController _advanceController = TextEditingController(text: "0");
//   final TextEditingController _balanceController = TextEditingController(text: "0");
//   final TextEditingController _totalAmountController = TextEditingController(text: "0");
//   final TextEditingController _termsController = TextEditingController();

//   // Lists to store the "Saved" items (Chips)
//   List<SavedItem> serviceItems = [];
//   List<SavedItem> foodMenuItems = [];
//   List<SavedItem> eventListingItems = [];

//   // Dedicated controllers for each section's input row
//   final TextEditingController _sTitle = TextEditingController();
//   final TextEditingController _sDesc = TextEditingController();
//   final TextEditingController _sQty = TextEditingController(text: "1");
//   final TextEditingController _sPrice = TextEditingController(text: "0");

//   final TextEditingController _fTitle = TextEditingController();
//   final TextEditingController _fDesc = TextEditingController();
//   final TextEditingController _fQty = TextEditingController(text: "1");
//   final TextEditingController _fPrice = TextEditingController(text: "0");

//   final TextEditingController _eTitle = TextEditingController();
//   final TextEditingController _eDesc = TextEditingController();
//   final TextEditingController _eQty = TextEditingController(text: "1");
//   final TextEditingController _ePrice = TextEditingController(text: "0");

//   List<String> eventTypes = ["Wedding", "Corporate", "Birthday", "Other"];

//   // Helper to calculate total from live controllers
//   double _getLiveTotal(TextEditingController q, TextEditingController p) {
//     double qty = double.tryParse(q.text) ?? 0;
//     double price = double.tryParse(p.text) ?? 0;
//     return qty * price;
//   }

//   void calculateTotals() {
//     double grandTotal = 0;
    
//     // 1. Calculate from Saved Chips
//     List<List<SavedItem>> allLists = [serviceItems, foodMenuItems, eventListingItems];
//     for (var list in allLists) {
//       for (var item in list) {
//         grandTotal += (item.qty * item.price);
//       }
//     }

//     // 2. Add Live Totals (from what user is currently typing)
//     grandTotal += _getLiveTotal(_sQty, _sPrice);
//     grandTotal += _getLiveTotal(_fQty, _fPrice);
//     grandTotal += _getLiveTotal(_eQty, _ePrice);
    
//     double advance = double.tryParse(_advanceController.text) ?? 0;
//     setState(() {
//       _totalAmountController.text = grandTotal.toStringAsFixed(2);
//       _balanceController.text = (grandTotal - advance).toStringAsFixed(2);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Create New Agreement", style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             bool isWide = constraints.maxWidth > 900;
//             return Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: SingleChildScrollView(child: _buildFormSection()),
//                 ),
//                 if (isWide) const SizedBox(width: 20),
//                 if (isWide)
//                   Expanded(
//                     flex: 1,
//                     child: SingleChildScrollView(child: _buildPreviewSection()),
//                   ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildFormSection() {
//     return Card(
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text("Agreement Information", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               const Divider(),
//               Row(
//                 children: [
//                   Expanded(child: _inputField(_agreementNumberController, "Agreement Number")),
//                   const SizedBox(width: 15),
//                   Expanded(child: _datePickerField(context)),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               const Text("Client Information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   Expanded(child: _inputField(_clientNameController, "Client Name *")),
//                   const SizedBox(width: 15),
//                   Expanded(child: _inputField(_clientPhoneController, "Phone Number *", isNumber: true)),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               _inputField(_clientAddressController, "Client Address *", maxLines: 2),
//               const SizedBox(height: 15),
//               Row(
//                 children: [
//                   Expanded(child: _inputField(_clientEmailController, "Email Address")),
//                   const SizedBox(width: 15),
//                   Expanded(child: _dropdownField()),
//                 ],
//               ),
//               if (_eventTypeController.text == "Wedding")
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: Row(
//                     children: [
//                       Expanded(child: _inputField(_groomController, "Groom Name")),
//                       const SizedBox(width: 15),
//                       Expanded(child: _inputField(_brideController, "Bride Name")),
//                     ],
//                   ),
//                 ),
//               if (_eventTypeController.text == "Other")
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: _inputField(_otherEventController, "Specify Event Type"),
//                 ),
//               const SizedBox(height: 15),
//               _inputField(_venueController, "Venue *"),

//               const SizedBox(height: 30),
//               _buildInvoiceBoxSection("Services", serviceItems, _sTitle, _sDesc, _sQty, _sPrice),
//               const SizedBox(height: 30),
//               _buildInvoiceBoxSection("Food Menu Items", foodMenuItems, _fTitle, _fDesc, _fQty, _fPrice),
//               const SizedBox(height: 30),
//               _buildInvoiceBoxSection("Event Listing Items", eventListingItems, _eTitle, _eDesc, _eQty, _ePrice),

//               const SizedBox(height: 30),
//               const Text("Amount Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               const Divider(),
//               Row(
//                 children: [
//                   Expanded(child: _inputField(_totalAmountController, "Total Amount *", readOnly: true)),
//                   const SizedBox(width: 10),
//                   Expanded(child: _inputField(_advanceController, "Advance Amount", isNumber: true, onChanged: (v) => calculateTotals())),
//                   const SizedBox(width: 10),
//                   Expanded(child: _inputField(_balanceController, "Balance Amount", readOnly: true)),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               _inputField(_termsController, "Terms & Conditions *", maxLines: 3),
//               const SizedBox(height: 30),
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                   ),
//                   onPressed: () {},
//                   child: const Text("Save Agreement", style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInvoiceBoxSection(
//     String sectionTitle, 
//     List<SavedItem> dataList,
//     TextEditingController tTitle,
//     TextEditingController tDesc,
//     TextEditingController tQty,
//     TextEditingController tPrice,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(sectionTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 10),

//         if (dataList.isNotEmpty)
//           Padding(
//             padding: const EdgeInsets.only(bottom: 15),
//             child: Wrap(
//               spacing: 8.0,
//               runSpacing: 4.0,
//               children: dataList.asMap().entries.map((entry) {
//                 int idx = entry.key;
//                 var item = entry.value;
//                 return Chip(
//                   label: Text("${item.title}: ${item.desc} (x${item.qty})", style: const TextStyle(fontSize: 12)),
//                   deleteIcon: const Icon(Icons.close, size: 14),
//                   onDeleted: () {
//                     setState(() {
//                       dataList.removeAt(idx);
//                       calculateTotals();
//                     });
//                   },
//                   backgroundColor: Colors.green.withOpacity(0.1),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     side: const BorderSide(color: Colors.green),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),

//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: Colors.grey.shade300, width: 1),
//           ),
//           child: Row(
//             children: [
//               Expanded(flex: 2, child: _smallEntryField(tTitle, "Title")),
//               const SizedBox(width: 8),
//               Expanded(flex: 3, child: _smallEntryField(tDesc, "Item Name")),
//               const SizedBox(width: 8),
//               Expanded(flex: 1, child: _smallEntryField(tQty, "Qty", isNumber: true)),
//               const SizedBox(width: 8),
//               Expanded(flex: 2, child: _smallEntryField(tPrice, "Price", isNumber: true)),
//               const SizedBox(width: 8),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green, 
//                   minimumSize: const Size(40, 45),
//                   padding: EdgeInsets.zero,
//                 ),
//                 onPressed: () {
//                   // Only save if description is not empty
//                   if (tDesc.text.isNotEmpty || tTitle.text.isNotEmpty) {
//                     setState(() {
//                       dataList.add(SavedItem(
//                         title: tTitle.text,
//                         desc: tDesc.text,
//                         qty: double.tryParse(tQty.text) ?? 1,
//                         price: double.tryParse(tPrice.text) ?? 0,
//                       ));
//                       tTitle.clear();
//                       tDesc.clear();
//                       tQty.text = "1";
//                       tPrice.text = "0";
//                       calculateTotals();
//                     });
//                   }
//                 },
//                 child: const Icon(Icons.add, color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _smallEntryField(TextEditingController ctrl, String label, {bool isNumber = false}) {
//     return TextFormField(
//       controller: ctrl,
//       keyboardType: isNumber ? TextInputType.number : TextInputType.text,
//       // CRITICAL: Update totals and preview while typing
//       onChanged: (v) => calculateTotals(),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(fontSize: 11),
//         border: const OutlineInputBorder(),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//       ),
//     );
//   }

//   Widget _buildPreviewSection() {
//     String eventType = _eventTypeController.text;
//     if (eventType == "Other" && _otherEventController.text.isNotEmpty) {
//       eventType = _otherEventController.text;
//     }
//     return Card(
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Agreement Preview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 10),
//             const Text("BILL TO:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.green)),
//             Text(_clientNameController.text.isEmpty ? "Client Name" : _clientNameController.text, style: const TextStyle(fontWeight: FontWeight.bold)),
//             if (_clientAddressController.text.isNotEmpty) Text(_clientAddressController.text),
//             const SizedBox(height: 15),
//             const Text("EVENT DETAILS:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.green)),
//             Text("Event Type: $eventType"),
//             if (_eventTypeController.text == "Wedding")
//               Text("Groom: ${_groomController.text} | Bride: ${_brideController.text}", style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
//             Text("Venue: ${_venueController.text}"),
//             Text("Date: ${_dateController.text}"),
//             const Divider(height: 30),
            
//             // Preview Lists with Live Controllers
//             _previewList("Services", serviceItems, _sTitle, _sDesc, _sQty, _sPrice),
//             _previewList("Food Items", foodMenuItems, _fTitle, _fDesc, _fQty, _fPrice),
//             _previewList("Event Listing", eventListingItems, _eTitle, _eDesc, _eQty, _ePrice),
            
//             const Divider(height: 30),
//             _amountRow("Total Amount:", "₹${_totalAmountController.text}"),
//             _amountRow("Advance Paid:", "₹${_advanceController.text}"),
//             _amountRow("Balance Due:", "₹${_balanceController.text}", isBold: true),
//           ],
//         ),
//       ),
//     );
//   }

//   // UPDATED: Now accepts live controllers to show item while typing
//   Widget _previewList(
//     String title, 
//     List<SavedItem> items, 
//     TextEditingController lTitle, 
//     TextEditingController lDesc, 
//     TextEditingController lQty, 
//     TextEditingController lPrice
//   ) {
//     bool hasLiveContent = lTitle.text.isNotEmpty || lDesc.text.isNotEmpty || (double.tryParse(lPrice.text) ?? 0) > 0;
    
//     if (items.isEmpty && !hasLiveContent) return const SizedBox.shrink();
    
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
//         // 1. Show Saved Items
//         ...items.map((item) => Text("- ${item.title} ${item.desc} (${item.qty} x ${item.price})", style: const TextStyle(fontSize: 12))),
        
//         // 2. Show Live Typing Item (if any content exists)
//         if (hasLiveContent)
//           Text(
//             "- ${lTitle.text} ${lDesc.text} (${lQty.text} x ${lPrice.text})", 
//             style: TextStyle(fontSize: 12, color: Colors.green.shade700, fontStyle: FontStyle.italic),
//           ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }

//   Widget _amountRow(String label, String value, {bool isBold = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
//           Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
//         ],
//       ),
//     );
//   }

//   Widget _inputField(TextEditingController ctrl, String label, {bool isNumber = false, int maxLines = 1, bool readOnly = false, Function(String)? onChanged}) {
//     return TextFormField(
//       controller: ctrl,
//       maxLines: maxLines,
//       readOnly: readOnly,
//       onChanged: onChanged ?? (v) => setState(() {}),
//       keyboardType: isNumber ? TextInputType.number : TextInputType.text,
//       decoration: InputDecoration(
//         labelText: label,
//         border: const OutlineInputBorder(),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       ),
//     );
//   }

//   Widget _datePickerField(BuildContext context) {
//     return TextFormField(
//       controller: _dateController,
//       readOnly: true,
//       decoration: const InputDecoration(labelText: "Event Date", border: OutlineInputBorder(), suffixIcon: Icon(Icons.calendar_today)),
//       onTap: () async {
//         DateTime? pickedDate = await showDatePicker(
//           context: context,
//           initialDate: DateTime.now(),
//           firstDate: DateTime.now(),
//           lastDate: DateTime(2101),
//         );
//         if (pickedDate != null) {
//           setState(() => _dateController.text = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}");
//         }
//       },
//     );
//   }

//   Widget _dropdownField() {
//     return DropdownButtonFormField<String>(
//       decoration: const InputDecoration(labelText: "Event Type *", border: OutlineInputBorder()),
//       items: eventTypes.map((cat) => DropdownMenuItem(value: cat, child: Text(cat))).toList(),
//       onChanged: (newValue) {
//         setState(() {
//           _eventTypeController.text = newValue!;
//           if (newValue != "Wedding") {
//             _groomController.clear();
//             _brideController.clear();
//           }
//           if (newValue != "Other") _otherEventController.clear();
//         });
//       },
//     );
//   }
// }




























// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   bool _obscurePassword = true;
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _login() async {
//     if (!_formKey.currentState!.validate()) return;

//     if (_emailController.text != "admin") {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//             'Incorrect E-mail',
//             style: TextStyle(color: Colors.black),
//           ),
//           backgroundColor: Colors.green,
//         ),
//       );
//     }
//     if (_passwordController.text != "catering123") {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//             'Incorrect Password',
//             style: TextStyle(color: Colors.black),
//           ),
//           backgroundColor: Colors.green,
//         ),
//       );
//     }

//     if (_emailController.text == "admin" &&
//         _passwordController.text == "catering123") {
//       setState(() => _isLoading = true);
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Login successful')));
//       await Future.delayed(const Duration(seconds: 8));
//       setState(() => _isLoading = false);
//       // Navigator.pushReplacement(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => DashboardScreen()),
//       // );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Evergreen"),
//         backgroundColor: Colors.green,
//         centerTitle: true,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset('assets/logo/favicon.png', width: 200),
//                 const SizedBox(height: 20),

//                 // Email
//                 TextFormField(
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: const InputDecoration(
//                     labelText: 'Username',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Email is required';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),

                
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: _obscurePassword,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     border: const OutlineInputBorder(),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _obscurePassword
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _obscurePassword = !_obscurePassword;
//                         });
//                       },
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Password is required';
//                     }
//                     if (value.length < 6) {
//                       return 'Password must be at least 6 characters';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 24),

//                 // Login Button
//                 SizedBox(
//                   width: double.infinity,
//                   height: 48,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       foregroundColor: Colors.black,
//                     ),
//                     onPressed: _isLoading ? null : _login,
//                     child: _isLoading
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text('Login'),
//                   ),
//                 ),

//                 const SizedBox(height: 12),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




































// import 'package:flutter/material.dart';

// class AddAgreementScreen extends StatefulWidget {
//   const AddAgreementScreen({super.key});

//   @override
//   State<AddAgreementScreen> createState() => _AddAgreementScreenState();
// }

// List<String> _items = ["Wedding", "Corporate", "Birthday", "Other"];

// class AgreementItem {
//   TextEditingController _itemController = TextEditingController();
//   TextEditingController _quantityController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();
//   TextEditingController _totalController = TextEditingController();
// }

// class _AddAgreementScreenState extends State<AddAgreementScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _AgreementNumberController =
//       TextEditingController();
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _clientNameController = TextEditingController();
//   final TextEditingController _clientAddressController =
//       TextEditingController();
//   final TextEditingController _clientPhoneController = TextEditingController();
//   final TextEditingController _clientEmailController = TextEditingController();
//   final TextEditingController _eventVenueController = TextEditingController();
//   final TextEditingController _amountController = TextEditingController();
//   final TextEditingController _eventTypeController = TextEditingController();
//   final TextEditingController _otherEventController = TextEditingController();
//   final TextEditingController _notesController = TextEditingController();
//   final TextEditingController _taxPercentController = TextEditingController();
//   final TextEditingController _taxAmountController = TextEditingController();
//   final TextEditingController _grandTotalController = TextEditingController();
//   final TextEditingController _groomController = TextEditingController();
//   final TextEditingController _brideController = TextEditingController();

//   List<AgreementItem> AgreementItems = [AgreementItem()];

//   void calculateTotal(int i) {
//     final item = AgreementItems[i];
//     double q = double.tryParse(item._quantityController.text) ?? 0;
//     double p = double.tryParse(item._priceController.text) ?? 0;

//     item._totalController.text = (q * p).toStringAsFixed(2);

//     //update subtotal
//     _amountController.text = totalAgreement().toStringAsFixed(2);

//     //update Tax
//     _taxAmountController.text = calculateTax().toStringAsFixed(2);

//     //update grandtotal
//     _grandTotalController.text = grandTotal().toStringAsFixed(2);

//     setState(() {});
//   }

//   double totalAgreement() {
//     double sum = 0;

//     for (var item in AgreementItems) {
//       double t = double.tryParse(item._totalController.text) ?? 0;
//       sum += t;
//     }

//     return sum;
//   }

//   double grandTotal() {
//     double AgreementTotal = double.tryParse(_amountController.text) ?? 0;
//     double gstTotal = double.tryParse(_taxAmountController.text) ?? 0;
//     double total = AgreementTotal + gstTotal;
//     return total;
//   }

//   double calculateTax() {
//     double tax = double.tryParse(_taxPercentController.text) ?? 0;
//     double Agreement = double.tryParse(_amountController.text) ?? 0;
//     return (Agreement * tax) / 100;
//   }

//   void addNewItem() {
//     setState(() {
//       AgreementItems.add(AgreementItem());
//     });
//   }

//   void removeItem(int i) {
//     setState(() {
//       AgreementItems.removeAt(i);
//       _amountController.text = totalAgreement().toStringAsFixed(2);
//       _taxAmountController.text = calculateTax().toStringAsFixed(2);
//       _grandTotalController.text = grandTotal().toStringAsFixed(2);
//     });
//   }

//   @override
//   void dispose() {
//     _AgreementNumberController.dispose();
//     _clientNameController.dispose();
//     _clientAddressController.dispose();
//     _clientPhoneController.dispose();
//     _clientEmailController.dispose();
//     _eventVenueController.dispose();
//     _amountController.dispose();
//     _dateController.dispose();
//     _notesController.dispose();
//     _taxAmountController.dispose();
//     _taxPercentController.dispose();
//     _grandTotalController.dispose();
//     _eventTypeController.dispose();
//     _otherEventController.dispose();

//     super.dispose();
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       print("Agreement: ${_AgreementNumberController.text}");
//       print("Client: ${_clientNameController.text}");
//       print("Amount: ${_amountController.text}");

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Agreement added successfully!")),
//       );

//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(builder: (_) => const DashboardScreen()),
//       // );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add Agreement"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               bool isWide = constraints.maxWidth > 650;

//               return isWide
//                   ? Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(child: _buildFormSection()),
//                         const SizedBox(width: 25),
//                         Expanded(child: _buildPreviewSection()),
//                       ],
//                     )
//                   : Column(
//                       children: [
//                         _buildFormSection(),
//                         const SizedBox(height: 25),
//                         _buildPreviewSection(),
//                       ],
//                     );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   // FORM SECTION

//   Widget _buildFormSection() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Agreement Information",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 15),

//           // --- Row 1 ---
//           Row(
//             children: [
//               Expanded(
//                 child: _input(
//                   controller: _AgreementNumberController,
//                   label: "Agreement Number",
//                   validator: (v) =>
//                       v!.isEmpty ? "Agreement number is required" : null,
//                 ),
//               ),
//               const SizedBox(width: 15),
//               Expanded(
//                 child: TextFormField(
//                   controller: _dateController,
//                   readOnly: true,
//                   decoration: const InputDecoration(
//                     labelText: "Event Date",
//                     border: OutlineInputBorder(),
//                   ),
//                   onTap: () async {
//                     DateTime? picked = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(2100),
//                     );
//                     if (picked != null) {
//                       _dateController.text =
//                           "${picked.day.toString().padLeft(2, '0')}-"
//                           "${picked.month.toString().padLeft(2, '0')}-"
//                           "${picked.year}";
//                       setState(() {});
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),

//           // --- Row 2 ---
//           Row(
//             children: [
//               Expanded(
//                 child: _input(
//                   controller: _clientNameController,
//                   label: "Client Name",
//                   validator: (v) =>
//                       v!.isEmpty ? "Client name is required" : null,
//                 ),
//               ),
//               const SizedBox(width: 15),
//               Expanded(
//                 child: _input(
//                   controller: _clientPhoneController,
//                   label: "Phone Number",
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Number is required";
//                     }
//                     if (value.length != 10) {
//                       return "Enter 10-digit Number";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),
//           // Phone
//           _input(
//             controller: _clientAddressController,
//             label: "Client Address",
//             validator: (v) => v!.isEmpty ? "Address is required" : null,
//           ),
//           const SizedBox(height: 15),

//           Row(
//             children: [
//               Expanded(
//                 child: _input(
//                   controller: _clientEmailController,
//                   label: "Email Address",
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Email is required";
//                     }
//                     if (!RegExp(
//                       r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
//                     ).hasMatch(value)) {
//                       return "Enter a valid email";
//                     }
//                     return null;
//                   },
//                 ),
//               ),

//               const SizedBox(width: 15),

//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     DropdownButtonFormField<String>(
//                       value: _items.contains(_eventTypeController.text)
//                           ? _eventTypeController.text
//                           : null,
//                       decoration: const InputDecoration(
//                         labelText: "Event Type",
//                         border: OutlineInputBorder(),
//                       ),
//                       items: _items.map((item) {
//                         return DropdownMenuItem<String>(
//                           value: item,
//                           child: Text(item),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         _eventTypeController.text = value ?? "";
//                         setState(() {});
//                       },
//                       validator: (value) {
//                         if (_eventTypeController.text.isEmpty) {
//                           return "Please select an item";
//                         }
//                         if (_eventTypeController.text == "Other" &&
//                             _otherEventController.text.isEmpty) {
//                           return "Please enter a value for Other";
//                         }
//                         return null;
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),
//           if (_eventTypeController.text == "Wedding")
//             Row(
//               children: [
//                 Expanded(
//                   child: _input(controller: _groomController, label: "Groom"),
//                 ),
//                 const SizedBox(width: 15),
//                 Expanded(
//                   child: _input(controller: _brideController, label: "Bride"),
//                 ),
//               ],
//             ),

//           if (_eventTypeController.text == "Other")
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: Align(
//                 alignment: Alignment.centerRight, // moves it to the end
//                 child: SizedBox(
//                   width: 280, // or any width you want
//                   child: TextFormField(
//                     controller: _otherEventController,
//                     decoration: const InputDecoration(
//                       labelText: "Enter Item",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//           // Email
//           const SizedBox(height: 15),
//           _input(
//             controller: _eventVenueController,
//             label: "Event Venue",
//             validator: (v) => v!.isEmpty ? "Venue is required" : null,
//           ),
//           const SizedBox(height: 15),

//           const SizedBox(height: 10),
//           const Text(
//             "Agreement items",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//           const SizedBox(height: 15),

//           Column(
//             children: [
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: AgreementItems.length,
//                 itemBuilder: (context, i) {
//                   final item = AgreementItems[i];
//                   return Card(
//                     color: const Color.fromARGB(255, 231, 231, 231),
//                     margin: EdgeInsets.only(bottom: 10),
//                     child: Padding(
//                       padding: const EdgeInsets.all(30),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               controller: item._itemController,
//                               decoration: InputDecoration(
//                                 labelText: "Item",
//                                 border: OutlineInputBorder(),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           Expanded(
//                             child: TextFormField(
//                               controller: item._quantityController,
//                               decoration: InputDecoration(
//                                 labelText: "Qty",
//                                 border: OutlineInputBorder(),
//                               ),
//                               keyboardType: TextInputType.number,
//                               onChanged: (_) => calculateTotal(i),
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           Expanded(
//                             child: TextFormField(
//                               controller: item._priceController,
//                               decoration: InputDecoration(
//                                 labelText: "Price",
//                                 border: OutlineInputBorder(),
//                               ),
//                               keyboardType: TextInputType.number,
//                               onChanged: (_) => calculateTotal(i),
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           IconButton(
//                             icon: Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => removeItem(i),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),

//               // Add button
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: TextButton.icon(
//                   onPressed: addNewItem,
//                   icon: Icon(Icons.add, color: Colors.green),
//                   label: Text(
//                     "Add Item",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),

//           Row(
//             children: [
//               Expanded(
//                 child: _input(
//                   controller: _taxPercentController,
//                   label: "Tax %",
//                   keyboardType: TextInputType.number,
//                   onChanged: (_) {
//                     _taxAmountController.text = calculateTax().toStringAsFixed(
//                       2,
//                     );
//                     _grandTotalController.text = grandTotal().toStringAsFixed(
//                       2,
//                     );
//                     setState(() {});
//                   },
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: _input(controller: _notesController, label: "Notes"),
//               ),
//             ],
//           ),

//           const SizedBox(height: 15),

//           Center(
//             child: ElevatedButton(
//               onPressed: _submitForm,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 40,
//                   vertical: 15,
//                 ),
//               ),
//               child: const Text(
//                 "Add Agreement",
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Simple wrapper for TextFormField
//   Widget _input({
//     required TextEditingController controller,
//     required String label,
//     String? Function(String?)? validator,
//     TextInputType keyboardType = TextInputType.text,
//     Function(String)? onChanged,
//   }) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(),
//       ),
//       validator: validator,
//       onChanged: (value) {
//         if (onChanged != null) onChanged(value); // call extra callback
//         setState(() {}); // rebuild preview automatically
//       },
//       keyboardType: keyboardType,
//     );
//   }

//   // ---------------------------------------------------------
//   // PREVIEW SECTION
//   // ---------------------------------------------------------
//   Widget _buildPreviewSection() {
//     return Card(
//       color: const Color.fromARGB(255, 231, 231, 231),
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Agreement Preview",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               "Agreement:${_AgreementNumberController.text}",
//               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               "Evergreen Decoration and Outdoor Catering",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               "6th Floor, Bishop Jerome Nagar Old Block,\n"
//               "Bishop Jerome Ln, Chinnakada, Kollam, Kerala 691001",
//             ),
//             const SizedBox(height: 10),
//             Divider(color: Colors.black),
//             const SizedBox(height: 10),

//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // LEFT COLUMN
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Bill To",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(_clientNameController.text),
//                       Text(_clientAddressController.text),
//                       Text(_clientPhoneController.text),
//                       Text(_clientEmailController.text),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(width: 20),

//                 // RIGHT COLUMN
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Event Details",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text("Event Date: ${_dateController.text}"),
//                       Text(
//                         "Event Type: ${_eventTypeController.text == "Other" ? _otherEventController.text : _eventTypeController.text}",
//                       ),
//                       if (_eventTypeController.text == "Wedding")
//                         Text(
//                           "${_groomController.text} & ${_brideController.text}",
//                         ),
//                       Text("Venue: ${_eventVenueController.text}"),
//                       Text("Amount: ₹${_amountController.text}"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 7),
//             Divider(color: Colors.black),
//             const SizedBox(height: 7),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Items",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 5),

//                 ...AgreementItems.map((m) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 4),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // LEFT SIDE: Item description
//                         Expanded(
//                           flex: 3,
//                           child: Text(
//                             "${m._itemController.text} "
//                             "(${m._quantityController.text} × ${m._priceController.text})",
//                           ),
//                         ),

//                         // RIGHT SIDE: Total
//                         Expanded(
//                           flex: 1,
//                           child: Text(
//                             m._totalController.text,
//                             textAlign: TextAlign.right,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }),
//               ],
//             ),

//             const SizedBox(height: 7),
//             Divider(color: Colors.black),
//             const SizedBox(height: 7),
//             const Text(
//               "Notes",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(_notesController.text),
//             const SizedBox(height: 7),
//             Divider(color: Colors.black),
//             const SizedBox(height: 7),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     const Text(
//                       "Subtotal :",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [Text("₹${totalAgreement().toStringAsFixed(2)}")],
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       "Tax ${_taxPercentController.text}% :",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(children: [Text("₹${_taxAmountController.text}")]),
//               ],
//             ),
//             const SizedBox(height: 7),
//             Divider(color: Colors.black),
//             const SizedBox(height: 7),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     const Text(
//                       "Grand Total :",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(children: [Text("₹${grandTotal().toStringAsFixed(2)}")]),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
















































// import 'package:flutter/material.dart';


// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   String selectedType = "Invoice";
//   // Dummy data for table
//   final List<Map<String, String>> invoices = [
//     {
//       'invoice': '001',
//       'client': 'John Doe',
//       'event': 'Wedding',
//       'date': '2025-12-05',
//       'venue': 'Kollam',
//       'amount': '4,50,000',
//       'created': '2025-12-05',
//     },
//     {
//       'invoice': '002',
//       'client': 'Jane Smith',
//       'event': 'Birthday',
//       'date': '2025-12-10',
//       'venue': 'Trivandrum',
//       'amount': '1,20,000',
//       'created': '2025-12-05',
//     },
//   ];

//   final List<Map<String, String>> agreements = [
//     {
//       'agreement': '001',
//       'client': 'John Doe',
//       'event': 'Wedding',
//       'date': '2025-12-05',
//       'venue': 'Kollam',
//       'amount': '4,50,000',
//       'created': '2025-12-05',
//     },
//     {
//       'agreement': '002',
//       'client': 'Jane Smith',
//       'event': 'Birthday',
//       'date': '2025-12-10',
//       'venue': 'Trivandrum',
//       'amount': '1,20,000',
//       'created': '2025-12-05',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final isInvoice = selectedType == "Invoice";

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Evergreen"),
//         backgroundColor: Colors.green,
//         actions: [
//           TextButton(
//             onPressed: () {
//               // Navigator.pushAndRemoveUntil(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => const LoginScreen()),
//               //   (context) => false,
//               // );
//             },
//             child: const Text("Logout", style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             // Top cards
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Card(
//                   elevation: 4,
//                   child: Padding(
//                     padding: const EdgeInsets.all(30),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Text("Total Invoice"),
//                         Text(invoices.length.toString()),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 Card(
//                   elevation: 4,
//                   child: Padding(
//                     padding: const EdgeInsets.all(30),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text("Total Agreement"),
//                         Text(
//                           agreements.length.toString(),
//                         ), // update later with real data
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 30),
//             Row(
//               children: [
//                 Radio(
//                   value: "Invoice",
//                   groupValue: selectedType,
//                   onChanged: (value) {
//                     setState(() {
//                       selectedType = value!;
//                     });
//                   },
//                 ),
//                 Text("Invoice"),

//                 Radio(
//                   value: "Agreement",
//                   groupValue: selectedType,
//                   onChanged: (value) {
//                     setState(() {
//                       selectedType = value!;
//                     });
//                   },
//                 ),
//                 Text("Agreement"),
//               ],
//             ),

//             const SizedBox(height: 30),

//             // Table header
//             Text(
//               isInvoice ? "Invoice List" : "Agreement List",
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),

//             // Table
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection:
//                     Axis.horizontal, // allow horizontal scroll for many columns
//                 child: DataTable(
//                   columns: isInvoice
//                       ? const [
//                           DataColumn(label: Text('Invoice #')),
//                           DataColumn(label: Text('Client')),
//                           DataColumn(label: Text('Event Type')),
//                           DataColumn(label: Text('Event Date')),
//                           DataColumn(label: Text('Venue')),
//                           DataColumn(label: Text('Amount')),
//                           DataColumn(label: Text('Created')),
//                           DataColumn(label: Text('Action')),
//                         ]
//                       : const [
//                           DataColumn(label: Text('agreement #')),
//                           DataColumn(label: Text('client')),
//                           DataColumn(label: Text('event')),
//                           DataColumn(label: Text('Date')),
//                           DataColumn(label: Text('Amount')),
//                           DataColumn(label: Text('Created')),
//                           DataColumn(label: Text('Action')),
//                         ],

//                   rows: isInvoice
//                       ? invoices.map((invoice) {
//                           return DataRow(
//                             cells: [
//                               DataCell(
//                                 Text(
//                                   invoice['invoice'] ??
//                                       invoice['agreement'] ??
//                                       "",
//                                 ),
//                               ),
//                               DataCell(Text(invoice['client']!)),
//                               DataCell(Text(invoice['event']!)),
//                               DataCell(Text(invoice['date']!)),
//                               DataCell(Text(invoice['venue']!)),
//                               DataCell(Text(invoice['amount']!)),
//                               DataCell(Text(invoice['created']!)),
//                               DataCell(
//                                 Row(
//                                   spacing: 5,
//                                   children: [
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         print(
//                                           "View ${invoice['invoice']} pressed",
//                                         );
//                                         // Navigate to view invoice screen
//                                       },
//                                       child: const Text("View"),
//                                     ),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         print(
//                                           "Edit ${invoice['invoice']} pressed",
//                                         );
//                                         // Navigate to edit invoice screen if needed
//                                       },
//                                       child: const Text("Edit"),
//                                     ),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         print(
//                                           "Edit ${invoice['invoice']} pressed",
//                                         );
//                                         // Navigate to edit invoice screen if needed
//                                       },
//                                       child: const Text("PDF"),
//                                     ),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         print(
//                                           "Edit ${invoice['invoice']} pressed",
//                                         );
//                                         // Navigate to edit invoice screen if needed
//                                       },
//                                       child: const Text("Agreement"),
//                                     ),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         print(
//                                           "Edit ${invoice['invoice']} pressed",
//                                         );
//                                         // Navigate to edit invoice screen if needed
//                                       },
//                                       child: const Text("WhatsApp"),
//                                     ),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         print(
//                                           "Delete ${invoice['invoice']} pressed",
//                                         );
//                                         // Add delete logic here
//                                       },
//                                       child: const Text("Delete"),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList()
//                       : agreements.map((agr) {
//                           return DataRow(
//                             cells: [
//                               DataCell(Text(agr['agreement']!)),
//                               DataCell(Text(agr['client']!)),
//                               DataCell(Text(agr['event']!)),
//                               DataCell(Text(agr['date']!)),
//                               DataCell(Text(agr['amount']!)),
//                               DataCell(Text(agr['created']!)),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     ElevatedButton(
//                                       onPressed: () =>
//                                           print("Edit ${agr['agreement']}"),
//                                       child: const Text("Edit"),
//                                     ),
//                                     const SizedBox(width: 5),
//                                     ElevatedButton(
//                                       onPressed: () =>
//                                           print("Delete ${agr['agreement']}"),
//                                       child: const Text("Delete"),
//                                     ),
//                                     const SizedBox(width: 5),
//                                     ElevatedButton(
//                                       onPressed: () =>
//                                           print("View ${agr['agreement']}"),
//                                       child: const Text("View"),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Bottom buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => const AddInvoiceScreen(),
//                     //   ),
//                     // );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.black,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 40,
//                       vertical: 15,
//                     ),
//                   ),
//                   child: const Text("Add Invoice"),
//                 ),
//                 const SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => const AddAgreementScreen(),
//                     //   ),
//                     // );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.black,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 40,
//                       vertical: 15,
//                     ),
//                   ),
//                   child: const Text("Add Agreement"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
