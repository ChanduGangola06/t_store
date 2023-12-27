import 'package:t_store/core/utils/formatters/formatter.dart';
import 'package:t_store/data/models/cart_model.dart';

import 'address_model.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String profilePicture;
  final CartModel? cart;
  final List<AddressModel>? addresses;

  UserModel(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.profilePicture,
      this.cart,
      this.addresses});

  /// Helpers
  String get fullName => '$firstName $lastName';
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static UserModel empty() => UserModel(
      firstName: '',
      lastName: '',
      email: '',
      phoneNumber: '',
      password: '',
      profilePicture: '');
}
