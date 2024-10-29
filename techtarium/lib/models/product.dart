// lib/models/product.dart

import '../utils/currency_converter.dart'; // Import the conversion function

class Product {
  final int id;
  final String name;
  final double price; // Price in dollars
  final String image;
  final String description;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
  });

  // Getter to convert price to rupees
  double get priceInRupees {
    return convertDollarToRupees(price); // Convert to rupees
  }
}

// Sample product list
final List<Product> products = [
  Product(
    id: 1,
    name: "Premium Wireless Headphones",
    price: 199.99,
    image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800&q=80",
    description: "High-quality wireless headphones with noise cancellation",
    category: "Electronics",
  ),
  Product(
    id: 2,
    name: "Minimalist Watch",
    price: 149.99,
    image: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=800&q=80",
    description: "Elegant minimalist watch with leather strap",
    category: "Accessories",
  ),
  Product(
    id: 3,
    name: "Smart Fitness Tracker",
    price: 89.99,
    image: "https://images.unsplash.com/photo-1575311373937-040b8e1fd5b6?w=800&q=80",
    description: "Advanced fitness tracker with heart rate monitoring",
    category: "Electronics",
  ),
  Product(
    id: 4,
    name: "Designer Sunglasses",
    price: 129.99,
    image: "https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=800&q=80",
    description: "Stylish UV protection sunglasses",
    category: "Accessories",
  ),
  Product(
    id: 5,
    name: "Leather Backpack",
    price: 179.99,
    image: "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=800&q=80",
    description: "Premium leather backpack with laptop compartment",
    category: "Bags",
  ),
  Product(
    id: 6,
    name: "Wireless Earbuds",
    price: 159.99,
    image: "https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=800&q=80",
    description: "True wireless earbuds with premium sound quality",
    category: "Electronics",
  ),
];
