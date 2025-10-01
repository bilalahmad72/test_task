# Task Project - Reset Password Flow

A Flutter-based mobile application implementing a secure password reset flow with OTP verification.

----

## 📱 Overview

This project demonstrates a complete password reset functionality with real-time password strength validation and OTP-based verification system.

----

## 🏗️ Project Structure


## 🛠️ Tech Stack


## ✨ Features

- ✅ Real-time password strength indicator (4 levels)
- ✅ 6-digit OTP verification with auto-focus navigation
- ✅ Dynamic button states (active/inactive/loading)
- ✅ Custom toast notifications
- ✅ Responsive UI with custom theming
- ✅ State persistence with Riverpod

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

- /security-settings - Security settings list
- /reset-password - Password reset screen

----

## 📦 State Management

### Riverpod Providers:

- passwordProvider - Manages password state, strength, and loading status
- Uses StateNotifier for centralized state updates

---- 

## 📐 Architecture

- Pattern: Feature-first modular architecture
- Separation: Clear separation between UI, logic, and data
- Reusability: Shared components in core/ directory
- Type Safety: Enums for button states and password strength

---- 

## 👨‍💻 About the Developer

Flutter Developer with 3+ years of experience specializing in mobile app development and frontend technologies (HTML5, CSS3, Tailwind CSS).

**Hire me for your next project:**
- 💼 [Upwork Profile](https://www.upwork.com/freelancers/~01bb489da512873d44)
- 📧 Contact me for Flutter development, mobile app projects, and frontend work

---- 

Made with ❤️ using Flutter
