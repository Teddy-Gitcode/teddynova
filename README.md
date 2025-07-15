# teddynova

# 📦 Project Structure - teddynova Flutter Portfolio

This document outlines the folder structure used in the `teddynova` Flutter web portfolio project.

lib/
├── main.dart # Entry point of the app

├── core/ # App-wide configurations and constants
│ ├── constants.dart # Static constants (e.g., colors, text)
│ ├── theme.dart # App themes and styles
│ └── firebase_options.dart # Firebase configuration file (auto-generated)

├── data/ # Data models and services
│ ├── models/
│ │ └── project_model.dart # Model for project objects
│ └── services/
│ └── firebase_service.dart # Firestore/Firebase logic

├── features/ # Feature-specific screens/pages
│ ├── home/ # Home page section
│ ├── about/ # About me section
│ ├── projects/ # Portfolio/projects section
│ └── contact/ # Contact form or social section

├── widgets/ # Reusable shared UI components
│ ├── navbar.dart # Navigation bar
│ └── custom_button.dart # Button or other shared widgets

├── router/ # Navigation/routing
│ └── app_router.dart # Page routing using GoRouter or similar


> ✅ **Firebase** is integrated to support dynamic content (e.g., portfolio projects, messages).
>  
> 🔧 You can manage your content using Firebase Firestore or connect with an admin panel.

---
