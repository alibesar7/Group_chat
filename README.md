# Chat App

This is a **Chat Application** built using **Flutter** and **Firebase**, allowing users to register, log in, and chat in real-time. The app uses **Firebase Authentication** for user registration and login, and **Cloud Firestore** for storing and retrieving messages.

---

## Features
- User Authentication (Register and Login)
- Real-time Messaging
- Firebase Firestore integration
- Simple and responsive UI
- Custom chat bubbles for messages
- Error handling and feedback via SnackBars
- **ModalProgressHUD** for displaying loading states

---

## Screens Overview
### Login Screen
- Users can log in with their registered email and password.
- Navigation to the **Register Screen** if the user does not have an account.

### Register Screen
- New users can register by entering their email and password.
- Basic error handling for common issues (weak password, email already in use).

### Chat Page
- Real-time chat functionality.
- Messages are displayed in custom chat bubbles.
- Messages are stored in Firestore with a timestamp and the sender's email.
- Chat scrolls automatically to the latest message.

---

## Technologies Used
- **Flutter**
- **Firebase Authentication**
- **Cloud Firestore**
- **ModalProgressHUD** (loading indicator)
- **Dart**

---

## Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/chatapp.git
   cd chatapp
flutter pub get
flutter run

lib
│
├── componnet
│   ├── chatbuble.dart              # Chat bubble widgets
│   ├── coustem_button.dart         # Custom button widget
│   └── coustem_text_failed.dart    # Custom text field widget
│
├── models
│   └── modelmessage.dart           # Message model
│
├── screen
│   ├── chatpage.dart               # Chat page screen
│   ├── loginscreen.dart            # Login screen
│   └── Rgisterscreen.dart          # Register screen
│
├── const.dart                      # Constants (e.g., colors)
└── main.dart                       # Main entry point

 
Would you like me to generate some images for the **Screenshots** section? I can help create mockups to showcase how your app would look!
  
