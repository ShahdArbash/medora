<!-- Medora App

A modern Flutter application built with clean architecture, BLoC state management, and a strong focus on user experience.
The app features a home screen with promotional sliders, user profiles, authentication flows, and reusable UI components.

Features

Promotional Slider: Interactive carousel displaying promotions with auto-play and manual navigation.

Custom App Bar: Personalized app bar with user profile, online status, and notifications.

Dots Indicator: Animated dots for carousel navigation.

Authentication: Google Sign-In integration and custom login/register forms.

Form Fields: Comprehensive form inputs with validation (email, password, full name).

Custom Buttons: Reusable button components with loading states.

Text Components: Consistent typography for titles and descriptions.

State Management: Powered by BLoC for predictable state handling.

Localization: Supports Arabic and English languages.

Responsive Design: Optimized for Android, iOS, Web, and Desktop.

RTL Support: Right-to-left layout support for Arabic.

Tech Stack

Framework: Flutter

State Management: BLoC (flutter_bloc)

UI Components: Material Design, Custom Widgets

Assets Management: Flutter Assets Generator

Fonts: Cairo Font Family

Icons: Cupertino Icons, Flutter SVG

Authentication: Google Sign-In

Loading Indicators: Flutter Spinkit

Dependencies

Key dependencies include:

flutter_bloc: ^9.1.1 — State management

carousel_slider: ^5.1.1 — Carousel functionality

google_sign_in: ^6.2.1 — Authentication

flutter_svg: ^2.2.3 — SVG support

flutter_spinkit: ^5.2.2 — Loading animations

equatable: ^2.0.7 — Value comparison

Project Structure
lib/
├── constants/
├── l10n/
├── presentation/
│   ├── Cubits/
│   ├── Models/
│   ├── views/
│   └── Widgets/
└── main.dart

Widgets Overview
Home View Widgets
PromotionsSlider

Location: lib/presentation/Widgets/Home_View_Widgets/promotions_slider.dart

A stateful widget that displays promotional content in a carousel format.
It integrates with PromotionsCubit for state management.

Key Features:

Auto-playing carousel with 4-second intervals

Manual navigation via dots indicator

Loading skeleton placeholders

Error handling

Responsive design with enlarged center page

State Management:

PromotionsInitial

PromotionsLoading

PromotionsSuccessful

PromotionsFailure

CarouselDotsIndicator

Location: lib/presentation/Widgets/Home_View_Widgets/carousel_dots_indicator.dart

A stateless widget providing visual indicators for carousel navigation.

Key Features:

Animated dot transitions

Tap-to-navigate functionality

Customizable appearance

Responsive active/inactive sizing

HomeAppBar

Location: lib/presentation/Widgets/Home_View_Widgets/home_app_bar.dart

Custom app bar widget for the home screen.

Key Features:

User avatar with online status

Notification badge

RTL support

Callback actions

Button Widgets

GenericButton

LoginButtonAction

RegisterButton

SignUpActionButton

TextButtonAction

All buttons are reusable, styled consistently, and support loading states.

Form Field Widgets

BuildTextFormField

EmailField

PasswordField

ConfirmPasswordField

FullNameField

BasePasswordField

Each field supports validation, RTL layout, and Cairo typography.

Login View Widgets

GoogleSignInWidget

ForgotPassword

Handles authentication and password recovery logic.

Text Widgets

TitleText

DescriptionText

Provides consistent typography across the app.

Utility Methods

BuildFormCardDecoration

BuildBackgroundView

Used for shared styling and layout logic.

Screens / Views Overview
SplashView

Displays the app logo and navigates to LoginView after a delay.

LoginView

Handles user authentication via email/password or Google Sign-In.

SignupView

Handles user registration with full validation.

HomeView

Main application screen displaying promotions and user dashboard.

App Navigation Flow
SplashView
  → LoginView
      → HomeView
      → SignupView
SignupView
  → HomeView
HomeView
  → Future screens (Profile, Notifications)

Architecture Overview

The app follows Clean Architecture principles:

Presentation Layer: UI and Widgets

Business Logic Layer: Cubits

Data Layer: Models (API integration planned)

Core Layer: Constants, localization, utilities

BLoC is used only for business logic, while UI-only state is handled locally for better performance.

Localization

Supported languages:

English

Arabic (RTL)

Implementation:

ARB files under lib/l10n

Generated localization classes

Automatic text direction handling

Assets Management

Images

Fonts (Cairo family)

SVG Icons

Assets are generated into a constants file for type safety.

Future Enhancements

User profile management

Notifications system

Offline support

Dark mode

Backend API integration

Testing (unit and widget tests)

Performance monitoring

Getting Started
Prerequisites

Flutter SDK ^3.10.1

Android Studio or VS Code

Installation
git clone <repository-url>
cd medoraapp
flutter pub get
flutter run

Development
Linting
flutter analyze

Testing
flutter test

Assets Generation
flutter pub run flutter_assets:generate

License

This project is private and not intended for public distribution.

Authors

Your Name — Initial development

Acknowledgments

Flutter team

BLoC library maintainers

Open-source contributors -->