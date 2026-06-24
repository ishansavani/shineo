import 'package:flutter/material.dart';
import 'package:shineo/views/widgets/diamond_card.dart';
import 'package:shineo/views/screens/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to Login Screen after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for dynamic adaptive placement
    final screenSize = MediaQuery.of(context).size;
    const double centerCardSize = 80.0;
    const double outerCardSize = 85.0;
    
    // Exact structural spacing gap from the center logo card
    const double offsetSpacing = 120.0; 

    return Scaffold(
      body: Stack(
        children: [
          // Base Image Layer
          Positioned.fill(
            child: Image.asset(
              'assets/images/splashImage.png',
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Mix Overlay Layer
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF5151C6).withOpacity(0.55),
                    const Color(0xFF888BF4).withOpacity(0.45),
                  ],
                ),
              ),
            ),
          ),
          // Main Content
          Positioned.fill(
            child: Stack(
              alignment: Alignment.center,
              children: [
                
                // 1. TOP DIAMOND (Image Option 1)
                Positioned(
                  top: (screenSize.height / 2) - (outerCardSize / 2) - offsetSpacing,
                  child: const DiamondCard(
                    size: outerCardSize,
                    imagePath: 'assets/images/image1.png', 
                  ),
                ),

                // 2. LEFT DIAMOND (Image Option 2)
                Positioned(
                  left: (screenSize.width / 2) - (outerCardSize / 2) - offsetSpacing,
                  child: const DiamondCard(
                    size: outerCardSize,
                    imagePath: 'assets/images/image2.png', 
                  ),
                ),

                // 3. RIGHT DIAMOND (Image Option 3)
                Positioned(
                  right: (screenSize.width / 2) - (outerCardSize / 2) - offsetSpacing,
                  child: const DiamondCard(
                    size: outerCardSize,
                    imagePath: 'assets/images/image3.png', 
                  ),
                ),

                // 4. BOTTOM DIAMOND (Image Option 4)
                Positioned(
                  bottom: (screenSize.height / 2) - (outerCardSize / 2) - offsetSpacing,
                  child: const DiamondCard(
                    size: outerCardSize,
                    imagePath: 'assets/images/image4.png', 
                  ),
                ),

                // 5. CENTER LAYER APP LOGO
                DiamondCard(
                  size: centerCardSize,
                  gradientColors: const [
                    Color(0xFFE0EAFC),
                    Color(0xFFCFDEF3),
                  ],
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png', // Your gradient "S" style asset mark
                      width: 55,
                      height: 55,
                    ),
                  ),
                ),
                
              ],
            ),
          ),
          
          // Bottom Tagline
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Shine Before - You Share.',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
