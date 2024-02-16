import 'package:flutter/material.dart';

class Bank {
  final String name;
  final IconData icon;

  Bank(this.name, this.icon);
}

class BankSelection extends StatefulWidget {
  const BankSelection({Key? key}) : super(key: key);

  @override
  State<BankSelection> createState() => _BankSelectionState();
}

class _BankSelectionState extends State<BankSelection> {
  Bank? _selectedBank;
  List<Bank> _banks = [
    Bank('Ngân hàng A', Icons.account_balance),
    Bank('Ngân hàng B', Icons.account_balance),
    Bank('Ngân hàng C', Icons.account_balance),
    Bank('Ngân hàng D', Icons.account_balance),
    Bank('Ngân hàng E', Icons.account_balance),
    Bank('Ngân hàng F', Icons.account_balance),
    Bank('Ngân hàng G', Icons.account_balance),
    Bank('Ngân hàng H', Icons.account_balance),
    Bank('Ngân hàng I', Icons.account_balance),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 7,
            offset: Offset(1, 10),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      height: 50,
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButtonFormField<Bank>(
            isDense: true,
            value: _selectedBank,
            hint: Row(
              children: [
                Icon(
                  Icons.account_balance,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 15,
                ),
                Text("Chọn ngân hàng"),
              ],
            ),
            items: _banks.map((Bank bank) {
              return DropdownMenuItem<Bank>(
                value: bank,
                child: Row(
                  children: [
                    Icon(
                      bank.icon,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(bank.name),
                  ],
                ),
              );
            }).toList(),
            onChanged: (Bank? value) {
              setState(() {
                _selectedBank = value;
              });
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding:
              EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Bank Selection')),
      body: Center(child: BankSelection()),
    ),
  ));
}
