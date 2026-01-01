// import 'package:flutter/material.dart';

// class AddAgreementScreen extends StatefulWidget {
//   const AddAgreementScreen({super.key});

//   @override
//   State<AddAgreementScreen> createState() => _AddAgreementScreenState();
// }

// class DynamicItem {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descController = TextEditingController();
//   TextEditingController qtyController = TextEditingController(text: "1");
//   TextEditingController amountController = TextEditingController(text: "0");

//   // Helper to copy data to the chips list
//   DynamicItem clone() {
//     return DynamicItem()
//       ..titleController.text = titleController.text
//       ..descController.text = descController.text
//       ..qtyController.text = qtyController.text
//       ..amountController.text = amountController.text;
//   }

//   // Helper to clear the persistent box
//   void clear() {
//     titleController.clear();
//     descController.clear();
//     qtyController.text = "1";
//     amountController.text = "0";
//   }
// }

// class _AddAgreementScreenState extends State<AddAgreementScreen> {
//   final _formKey = GlobalKey<FormState>();

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

//   // The lists that store finalized items (Chips)
//   List<DynamicItem> serviceItems = [];
//   List<DynamicItem> foodMenuItems = [];
//   List<DynamicItem> eventListingItems = [];

//   // These are the "Constant" boxes for typing
//   DynamicItem serviceDraft = DynamicItem();
//   DynamicItem foodDraft = DynamicItem();
//   DynamicItem eventDraft = DynamicItem();

//   List<String> eventTypes = ["Wedding", "Corporate", "Birthday", "Other"];

//   void calculateTotals() {
//     double grandTotal = 0;
//     List<List<DynamicItem>> allLists = [serviceItems, foodMenuItems, eventListingItems];
//     for (var list in allLists) {
//       for (var item in list) {
//         double q = double.tryParse(item.qtyController.text) ?? 0;
//         double a = double.tryParse(item.amountController.text) ?? 0;
//         grandTotal += (q * a);
//       }
//     }
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

//               // SECTIONS WITH THE FIXED PATTERN
//               _buildInvoiceBoxSection("Services", serviceItems, serviceDraft),
//               const SizedBox(height: 30),
//               _buildInvoiceBoxSection("Food Menu Items", foodMenuItems, foodDraft),
//               const SizedBox(height: 30),
//               _buildInvoiceBoxSection("Event Listing Items", eventListingItems, eventDraft),

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
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
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

//   Widget _buildInvoiceBoxSection(String sectionTitle, List<DynamicItem> savedList, DynamicItem draftItem) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(sectionTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 10),

//         // 1. CHIPS SECTION (Saved Items)
//         if (savedList.isNotEmpty)
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: Wrap(
//               spacing: 8.0,
//               runSpacing: 4.0,
//               children: savedList.asMap().entries.map((entry) {
//                 int idx = entry.key;
//                 var item = entry.value;
//                 String itemName = item.descController.text.isEmpty ? "Item ${idx + 1}" : item.descController.text;
//                 return Chip(
//                   label: Text("$itemName (x${item.qtyController.text})", style: const TextStyle(fontSize: 12)),
//                   deleteIcon: const Icon(Icons.close, size: 14),
//                   onDeleted: () => setState(() {
//                     savedList.removeAt(idx);
//                     calculateTotals();
//                   }),
//                   backgroundColor: Colors.green.withOpacity(0.1),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Colors.green)),
//                 );
//               }).toList(),
//             ),
//           ),

//         // 2. THE CONSTANT INPUT ROW (Only one box)
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: Colors.grey[100],
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: Colors.grey.shade300),
//           ),
//           child: Row(
//             children: [
//               Expanded(flex: 2, child: _smallItemField(draftItem.titleController, "Title")),
//               const SizedBox(width: 8),
//               Expanded(flex: 3, child: _smallItemField(draftItem.descController, "Item")),
//               const SizedBox(width: 8),
//               Expanded(flex: 1, child: _smallItemField(draftItem.qtyController, "Qty", isNumber: true)),
//               const SizedBox(width: 8),
//               Expanded(flex: 2, child: _smallItemField(draftItem.amountController, "Price", isNumber: true)),
//             ],
//           ),
//         ),

//         // 3. THE BUTTON (The "Done" / Save action)
//         TextButton.icon(
//           onPressed: () {
//             // "Done" Logic: Save content to chips and clear the box
//             if (draftItem.titleController.text.isNotEmpty || draftItem.descController.text.isNotEmpty) {
//               setState(() {
//                 savedList.add(draftItem.clone());
//                 draftItem.clear();
//                 calculateTotals();
//               });
//             }
//           },
//           icon: const Icon(Icons.add, color: Colors.green),
//           label: Text(
//             "Add $sectionTitle",
//             style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _smallItemField(TextEditingController ctrl, String label, {bool isNumber = false}) {
//     return TextFormField(
//       controller: ctrl,
//       keyboardType: isNumber ? TextInputType.number : TextInputType.text,
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
//             Text("Venue: ${_venueController.text}"),
//             Text("Date: ${_dateController.text}"),
//             const Divider(height: 30),
//             _previewList("Services", serviceItems),
//             _previewList("Food Items", foodMenuItems),
//             const Divider(height: 30),
//             _amountRow("Total Amount:", "₹${_totalAmountController.text}"),
//             _amountRow("Balance Due:", "₹${_balanceController.text}", isBold: true),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _previewList(String title, List<DynamicItem> items) {
//     if (items.isEmpty) return const SizedBox.shrink();
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
//         ...items.map((item) => Text("- ${item.titleController.text} (${item.qtyController.text} x ${item.amountController.text})", style: const TextStyle(fontSize: 12))),
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
//         DateTime? pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2101));
//         if (pickedDate != null) setState(() => _dateController.text = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}");
//       },
//     );
//   }

//   Widget _dropdownField() {
//     return DropdownButtonFormField<String>(
//       decoration: const InputDecoration(labelText: "Event Type *", border: OutlineInputBorder()),
//       items: eventTypes.map((cat) => DropdownMenuItem(value: cat, child: Text(cat))).toList(),
//       onChanged: (newValue) => setState(() => _eventTypeController.text = newValue!),
//     );
//   }
// }