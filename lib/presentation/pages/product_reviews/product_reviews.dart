import 'package:flutter/material.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/data/datasources/local/dummy_data.dart';
import 'package:t_store/presentation/pages/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:t_store/presentation/pages/product_reviews/widgets/rating_star.dart';
import 'package:t_store/presentation/pages/product_reviews/widgets/review_details_container.dart';
import 'package:t_store/presentation/widgets/appbar/appbar.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: const TAppBar(title: Text('Reviews & Ratings')),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Reviews List
              const Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: 10.0),
              const RatingAndProgressIndicator(),
              const RatingStars(value: 2.5, size: 20.0),
              const Text("12,611"),
              const SizedBox(height: TSizes.spaceBtwSections),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) => ReviewDetailsContainer(
                    productReview: DummyData.productReviews[index]),
                separatorBuilder: (_, __) =>
                    const SizedBox(height: TSizes.spaceBtwSections),
                itemCount: DummyData.productReviews.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
