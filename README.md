# Uber Pro - Professional Ride Sharing Application

A modern ride sharing application built with Flutter and GetX, featuring a clean architecture and comprehensive feature set.

## Project Structure

```
lib/
├── app/
│   ├── core/
│   │   ├── theme/
│   │   │   ├── app_colors.dart         # Global color definitions
│   │   │   ├── app_text_theme.dart     # Typography styles
│   │   │   └── app_theme.dart          # Theme configuration
│   │   ├── translations/
│   │   │   ├── app_translations.dart   # Translation configuration
│   │   │   ├── en.dart                 # English translations
│   │   │   ├── de.dart                 # German translations
│   │   │   └── fr.dart                 # French translations
│   │   └── widgets/                    # Reusable widgets
│   │       ├── custom_button.dart
│   │       └── custom_text_field.dart
│   ├── data/
│   │   ├── bindings/
│   │   │   └── initial_binding.dart    # Initial dependencies
│   │   ├── models/
│   │   │   ├── car_model.dart         # Car data model
│   │   │   ├── pricing_model.dart     # Pricing data model
│   │   │   ├── trip_model.dart        # Trip data model
│   │   │   └── user_model.dart        # User data model
│   │   ├── providers/
│   │   │   └── api_provider.dart      # API communication
│   │   └── services/
│   │       └── trip_service.dart      # Trip-related operations
│   ├── modules/
│   │   ├── admin/                     # Admin module
│   │   │   ├── bindings/
│   │   │   ├── controllers/
│   │   │   └── views/
│   │   ├── auth/                      # Authentication module
│   │   │   ├── bindings/
│   │   │   ├── controllers/
│   │   │   └── views/
│   │   ├── home/                      # Home module
│   │   │   ├── bindings/
│   │   │   ├── controllers/
│   │   │   └── views/
│   │   ├── inspection/                # Vehicle inspection module
│   │   │   ├── bindings/
│   │   │   ├── controllers/
│   │   │   └── views/
│   │   └── travel/                    # Travel module
│   │       ├── bindings/
│   │       ├── controllers/
│   │       └── views/
│   └── routes/
│       └── app_pages.dart             # Route definitions
└── main.dart                          # Application entry point
```

## Features

- **Authentication System**
  - Login/Register
  - Password Reset
  - Multi-language Support (English, German, French)

- **Admin Dashboard**
  - New Orders Management
  - Price Offers
  - Current Orders
  - Completed Orders

- **Trip Management**
  - View Available Trips
  - Make Price Offers
  - Track Current Rides
  - Transfer Protocol System

- **Vehicle Inspection**
  - Photo Documentation
  - Damage Reports
  - Digital Signatures
  - Weather Conditions

## Technology Stack

- **Framework**: Flutter
- **State Management**: GetX
- **Architecture**: Clean Architecture
- **API Communication**: Dio
- **Storage**: Flutter Secure Storage
- **Localization**: GetX Translations
- **UI Components**: Material Design

## Getting Started

1. **Prerequisites**
   - Flutter SDK
   - Dart SDK
   - Android Studio / VS Code

2. **Installation**
   ```bash
   # Clone the repository
   git clone [repository-url]

   # Navigate to project directory
   cd uber_pro

   # Install dependencies
   flutter pub get

   # Run the application
   flutter run
   ```

## Project Architecture

The project follows a modular architecture with clear separation of concerns:

- **Core**: Contains fundamental application components like themes, translations, and shared widgets.
- **Data**: Handles data management including models, API communication, and services.
- **Modules**: Feature-specific code organized into separate modules.
- **Routes**: Centralized routing configuration.

### Module Structure

Each module follows a consistent structure:

- **Bindings**: Dependency injection configuration
- **Controllers**: Business logic and state management
- **Views**: UI components and screens
- **Models**: Module-specific data models (if needed)

## API Integration

The application communicates with a RESTful API using the following components:

- **ApiProvider**: Handles HTTP requests with authentication
- **Services**: Business logic for API operations
- **Models**: Data structures for API responses

## State Management

GetX is used for state management, providing:

- Reactive state management
- Dependency injection
- Route management
- Internationalization

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.