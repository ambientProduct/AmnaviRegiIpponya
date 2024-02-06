import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

double? calculateCart(List<ItemDetailRecord>? cartItem) {
  // Initialize total sum
  double totalSum = 0;

  // Check if cartItem list is not null and iterate through each item
  if (cartItem != null) {
    for (var item in cartItem) {
      // Calculate the product of price and quantity for each item and add it to the total sum
      totalSum += item.price * item.quantity;
    }
  }

  return totalSum;
}
