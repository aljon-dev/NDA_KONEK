import 'package:flutter/material.dart';
import 'package:nda_konek/WidgetsReusable/customText.dart';

Widget featuredCard({
  required Widget logo,
  required String role,
  required String company,
  required List<String> roleTypes, // e.g. ["Full time", "Design", "Junior"]
  required int priceRange, // e.g. 35000
  required String location,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF4DA3FF),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Row: Logo + Role + Company + Save Icon
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: logo),
            ),
            const SizedBox(width: 12),
            // Role and Company
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  company,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Save Icon
            const Icon(Icons.bookmark_add_outlined, color: Colors.white, size: 28),
          ],
        ),
        const SizedBox(height: 16),

        // Role Type Chips
        Row(
          children: roleTypes
              .map(
                (type) => Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    type,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 20),

        // Salary & Location
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customizableText(text: "₱${priceRange.toString()}/month", color: Colors.white, fontweight: FontWeight.bold, size: 14),
            customizableText(text: location, color: Colors.white, fontweight: FontWeight.bold, size: 14)
          ],
        ),
      ],
    ),
  );
}
