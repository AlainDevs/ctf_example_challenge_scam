import 'package:flutter/material.dart';

// Since we don't have actual image assets yet, we'll create placeholder widgets
class PlaceholderImages {
  static Widget appleLogo() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.apple,
        color: Colors.black,
      ),
    );
  }

  static Widget iphoneGiveaway() {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.phone_iphone,
            size: 100,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'iPhone 15 Pro Max',
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}