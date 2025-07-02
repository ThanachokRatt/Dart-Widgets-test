import 'package:flutter/material.dart';

class FruitNutritionScreen extends StatelessWidget {
  const FruitNutritionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD670),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Top Section
            Expanded(flex: 3, child: TopSection()),

            // Bottom Section
            Expanded(flex: 5, child: BottomSection()),
          ],
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Back Button, Cart Button, "HAVE FUN EATING", and Food Image
        Positioned(
          top: 16,
          left: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white.withAlpha(170),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 22),
            ),
          ),
        ),

        Positioned(top: 16, right: 16, child: CartButtonWithBadge()),

        Positioned(
          top: 90,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("HAVE", style: _headingStyle),
              Text("FUN", style: _headingStyle),
              Text("EATING", style: _headingStyle),
            ],
          ),
        ),

        Align(
          alignment: Alignment.center,
          child: Image.asset('assets/banana.png', width: 120, height: 120),
        ),
      ],
    );
  }

  TextStyle get _headingStyle {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}

class CartButtonWithBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white.withAlpha(170),
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
            size: 20,
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.teal.shade200,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            alignment: Alignment.center,
            child: Text(
              '2',
              style: TextStyle(fontSize: 8, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class BottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Prevent clipping of floating widget
      children: [
        // Content box
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  "Fruit nutrition meal",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              RatingSection(),
              SizedBox(height: 16),
              _buildInfoRow(context),
              SizedBox(height: 20),
              _buildDescription(),
              SizedBox(height: 8),
              ExpandSection(),
              Spacer(),
              AddToCartSection(),
            ],
          ),
        ),

        Positioned(
          top: -24,
          right: 36,
          child: CircleAvatarWithShadow(icon: Icons.favorite),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconText(Colors.orange, Icons.circle_outlined, "Normal"),
          _iconText(Colors.teal.shade200, Icons.location_on_outlined, "1.7km"),
          _iconText(Colors.orange, Icons.access_time, "32min"),
        ],
      ),
    );
  }

  Widget _iconText(Color color, IconData icon, String text) {
    return Row(
      children: [Icon(icon, color: color), SizedBox(width: 6), Text(text)],
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "The pasta in the picture USES alkaline noodles, which many people are not very familiar with. The sauce is also very popular with the local people. if",
        style: TextStyle(color: Colors.grey[700]),
      ),
    );
  }
}

class RatingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Row(
            children: List.generate(
              4,
              (index) =>
                  Icon(Icons.star, color: Colors.teal.shade200, size: 18),
            ),
          ),
          Icon(Icons.star, color: Colors.grey.shade300, size: 18),
          SizedBox(width: 8),
          Text("4.5"),
          SizedBox(width: 8),
          Text("1287 comments"),
        ],
      ),
    );
  }
}

class ExpandSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text("Expand", style: TextStyle(color: Colors.teal.shade200)),
          const SizedBox(width: 8),
          Icon(Icons.expand_more, color: Colors.teal.shade200, size: 18),
        ],
      ),
    );
  }
}

class AddToCartSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100.withAlpha(200),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _quantityControl(),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.shade200.withAlpha(120),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: Offset(0, 8),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade200,
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "\$28 | Add to cart",
                  style: TextStyle(fontSize: 16).copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quantityControl() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 12,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.remove, color: Colors.grey),
          ),
          Text("2", style: TextStyle(fontSize: 16)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class CircleAvatarWithShadow extends StatelessWidget {
  final IconData icon;

  const CircleAvatarWithShadow({Key? key, required this.icon})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.teal.shade200,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.teal.shade100,
            blurRadius: 12,
            spreadRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
