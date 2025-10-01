# Task Project - Reset Password Flow

A Flutter-based mobile application implementing a secure password reset flow with OTP verification.


https://github.com/user-attachments/assets/3ee6981f-ee8a-423f-b433-31584f5b576a

https://github.com/user-attachments/assets/2a461b5d-2bd3-4212-ba41-4d5cd58ccc1f



----

## 📱 Overview

This project demonstrates a complete password reset functionality with real-time password strength validation and OTP-based verification system.

----

## 🏗️ Project Structure

```
lib/
│
├── app/                                    # Application entry point
│   └── my_app.dart
│
├── core/                                   # Core utilities & shared components
│   ├── enums/                             # App-wide enumerations
│   │   ├── button_state.dart
│   │   └── password_strength.dart
│   ├── mixins/                            # Reusable mixins
│   ├── routing/                           # Navigation configuration
│   ├── utilities/                         # Helper utilities
│   ├── values/                            # Constants (colors, strings, sizes)
│   └── widgets/                           # Reusable widgets
│
└── features/                              # Feature modules
    ├── reset_password/
    │   ├── providers/                     # State management
    │   ├── screens/
    │   └── widgets/
    └── settings/
        ├── screens/
        └── widgets/

```


## 🛠️ Tech Stack

| Category | Technology |
| ------------- | ------------- |
| Framework | Flutter 3.9.2 |
| State Management | Riverpod 3.0.0 |
| Routing | GoRouter 16.2.4 |
| UI/UX | Material 3, Google Fonts |
| Assets | flutter_svg 2.2.1 |

----

## ✨ Features

- ✅ Real-time password strength indicator (4 levels)
- ✅ 6-digit OTP verification with auto-focus navigation
- ✅ Dynamic button states (active/inactive/loading)
- ✅ Custom toast notifications
- ✅ Responsive UI with custom theming
- ✅ State persistence with Riverpod

----

### Advanced UI/UX

- ✨ **Smooth Modal Transitions** - Airbnb-style bottom sheet animations
- ✨ **Animated Background Scaling** - Parent screen shrinks with margins when modal opens

----

## 🎨 Design System

### Colors

- Primary: #F95D0B
- Neutrals: 50-800 shades
- Success: #F1F7ED / #E3EFDC

### Typography

- Font Family: Albert Sans (Google Fonts)
- Sizes: 12, 14, 16, 18, 24

### Spacing

- Base unit: 4.0
- Standard spacing: 4, 8, 12, 16, 24, 36

----

## 🗺️ Navigation Flow

``` 
Security Settings → Reset Password → OTP Verification → Success Toast
```

### Routes:

- `/security-settings` - Security settings list
- `/reset-password` - Password reset screen

----

## 📦 State Management

### Riverpod Providers:

#### 1. passwordProvider

    - Manages password input state
    - Calculates real-time strength validation
    - Handles loading states during submission

#### 2. navigationProvider 

    - Tracks modal visibility state
    - Coordinates animations across multiple screens
    - Enables reactive UI scaling

## 🔐 Password Strength Logic

| Length | Strength |
| ------------- | ------------- |
| 0 | None (gray) |
| 1-3 | Weak (red) |
| 4-6 | Medium (orange) |
| 7-9 | Good (yellow) |
| 10+ | Strong (green) |

---- 

## 📐 Architecture

- **Pattern**: Feature-first modular architecture
- **Separation**: Clear separation between UI, logic, and data
- **Reusability**: Shared components in core/ directory
- **Type Safety**: Enums for button states and password strength

---- 

## 👨‍💻 About the Developer

Flutter Developer with 3+ years of experience specializing in mobile app development and frontend technologies (HTML5, CSS3, Tailwind CSS).

### Expertise Demonstrated in This Project:

    - ✨ Advanced Flutter animations and transitions
    - 🎨 Custom UI component development
    - 🏗️ Scalable architecture patterns
    - 📱 Responsive and adaptive layouts
    - ⚡ Performance-optimized state management

**Hire me for your next project:**
- 💼 [Upwork Profile](https://www.upwork.com/freelancers/~01bb489da512873d44)
- 📧 Contact me for Flutter development, mobile app projects, and frontend work

---- 

Made with ❤️ using Flutter
