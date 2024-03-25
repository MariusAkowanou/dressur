import 'package:dressur/widgets/CustomAppBarPage.dart';
import 'package:flutter/material.dart';

class ListContact extends StatefulWidget {
  const ListContact({super.key});

  @override
  State<ListContact> createState() => _ListContactState();
}

class _ListContactState extends State<ListContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarPage(title: 'Mes contact'),
    );
  }
}