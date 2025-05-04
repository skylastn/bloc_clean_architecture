# 📦 Flutter BLoC Clean Architecture (DDD)

This repository demonstrates a scalable and testable Flutter project using **Clean Architecture** principles with **Domain-Driven Design (DDD)**, and **BLoC (Business Logic Component)** for state management. It's structured to promote separation of concerns, maintainability, and flexibility in application development.

## 🧱 Project Structure

This project follows a layered architecture with clear separation of concerns:

lib/
├── core/ # Shared utilities (e.g., failure, use case base, constants)
├── features/ # Each app feature grouped by domain
│ └── feature_name/
│ ├── domain/ # Entities, repositories (abstract), use cases
│ ├── data/ # Models, data sources, repository implementations
│ └── presentation/
│ ├── bloc/ # BLoC for state management
│ └── pages/ # UI Widgets
├── injection_container.dart # Dependency injection setup (using get_it)
└── main.dart # Application entry point

## ⚙️ Teknologi & Paket yang Digunakan

- **Flutter SDK**
- **BLoC** (`flutter_bloc`) – Manajemen state
- **Equatable** – Untuk perbandingan objek
- **GetIt** – Dependency Injection
- **Dartz** – Pendekatan pemrograman fungsional (Either, Option)
- **Clean Architecture Principles**
- **DDD Approach**

## 🚀 Key Features

- **Separation of Concerns**: Clearly separates UI, business logic, and data layers
- **Testable**: Easy to write unit and integration tests for each layer
- **Scalable**: Ideal structure for growing applications and teams
- **Maintainable**: Encourages clean, readable, and loosely coupled code

## 🧪 Testing Strategy

This architecture supports proper unit testing at all levels:

- **Domain Layer**: Completely independent from Flutter, easy to test
- **Data Layer**: Repositories and data sources can be mocked or stubbed
- **Presentation Layer**: BLoCs are tested using packages like `bloc_test`

## 🔧 Getting Started

1. Clone this repository:

   ```
   git clone https://github.com/skylastn/bloc_clean_architecture.git

   ```

2. Navigate into the project directory:

   ```
   cd bloc_clean_architecture
   ```

3. Install dependencies:

   ```
   flutter pub get
   ```

4. Register Firebase Console:

   ```
   dart pub global activate flutterfire_cli
   flutterfire configure --project=food-test-...
   ```

5. Run the App:

   ```
   flutter run
   ```

📂 Feature Module Example
Here’s a sample layout for a feature named auth:

features/
└── auth/
├── domain/
│ ├── entities/
│ ├── repositories/
│ └── usecases/
├── data/
│ ├── models/
│ ├── datasources/
│ └── repositories/
└── presentation/
├── bloc/
└── pages/

🤝 Contributions
Contributions are welcome! Feel free to fork the repository and open a pull request. For major changes, please open an issue first to discuss what you would like to change.

Built with ❤️ using Flutter, BLoC, and Clean Architecture.

---

Let me know if you'd like a badge section (e.g., build status, GitHub stars) or screenshots/demo instructions included too.
