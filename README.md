# ✅ MyTodoApp Documentation

## 📱 Project Overview

**MyTodoApp** is a simple yet functional mobile task manager built with Flutter. It allows users to create, view, update, and delete their todos. The app supports due dates, categories, and a detailed todo view for better productivity and organization.

* **Platform:** Flutter (iOS & Android)
* **Purpose:** Help users manage their daily tasks efficiently
* **Users:** Students, professionals, general users

---

## 🚀 Features

* ✅ Add new todos with title, description, and category
* ✅ Edit existing todos
* ✅ View todo details (creation date, description)
* ✅ Mark todos as completed
* ✅ Filter by status (All, Completed, Pending)
* ✅ Category selection (e.g., Personal, Work)
* 🔜 Due date with “Overdue” status
* 🔜 Search bar for filtering todos
* 🔜 Delete todos with swipe or long-press confirmation

---

## 🧱 Architecture

* **State Management:** `Provider`
* **Design Pattern:** MVVM-lite
* **Main Components:**

  * `HomeScreen`: List view with filters
  * `AddTodoScreen`: Form to add/edit todos
  * `TodoDetailsScreen`: Detailed view with optional editing
  * `TodoProvider`: Central state and logic
* **Folder Structure:**

  ```
  lib/
    ├── models/
    │     └── todo.dart
    ├── providers/
    │     └── todo_provider.dart
    ├── screens/
    │     ├── home_screen.dart
    │     ├── add_todo_screen.dart
    │     └── todo_details_screen.dart
    └── main.dart
  ```

---

## 🛠️ Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **State Management:** Provider
* **Date Handling:** `showDatePicker`, `intl` (optional)
* **UI Widgets:** ListView, Dismissible, Dialogs, TextFields, DropdownButton, Chips

---

## ⚙️ Installation & Setup

### Prerequisites

* Flutter SDK (≥ 3.0.0)
* Android Studio or VS Code with Flutter extensions

### Setup Steps

```bash
git clone https://github.com/andremugabo/MyTodoApp.git
cd mytodoapp
flutter pub get
flutter run
```

---

## 🧪 Testing

```bash
flutter test
```

> Currently, testing is manual. Unit & widget tests can be added later.

---

## 🧍 User Guide

1. Launch the app
2. Tap **+** to add a new todo
3. Fill in the title, description, category, and (optionally) due date
4. Tap on a todo to see details
5. Swipe to delete (will prompt confirmation)
6. Use filter chips to view pending or completed tasks

---

## 🧑‍💻 Developer Guide

### Adding a New Feature

* Add field to `Todo` model
* Update `TodoProvider` for logic
* Modify `AddTodoScreen` form
* Bind to `HomeScreen` and `TodoDetailsScreen`

### Coding Guidelines

* Use meaningful names
* Prefer Provider updates via `notifyListeners()`
* Keep UI logic separate from business logic

---

## 🔐 Security

* Local-only, no external API or storage
* Future integration with Firebase Auth/SecureStorage possible

---

## 🧯 Troubleshooting

| Issue               | Solution                               |
| ------------------- | -------------------------------------- |
| App not building    | Run `flutter clean && flutter pub get` |
| State not updating  | Ensure `notifyListeners()` is called   |
| Date not displaying | Check `showDatePicker` format logic    |

---

## 📦 Deployment

To build a release version:

```bash
flutter build apk   
flutter build ios  
```

---

## 📚 Changelog

### v1.0.0 – Initial Release

* Core CRUD functionality
* Status filtering
* Todo details screen

### v1.1.0 – Upcoming

* Due dates with overdue tags
* Search functionality
* Category filters with UI chips
