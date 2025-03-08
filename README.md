# Flutter To-Do App

This is a Flutter To-Do application that utilizes Firestore and SQLite for data storage. The app allows users to create, update, and delete tasks while syncing data between local storage (SQLite) and cloud storage (Firestore).

## Features
- Add, update, and delete tasks
- Offline storage with SQLite
- Cloud synchronization with Firestore
- GetX for state management
- User authentication (optional)

## Technologies Used
- **Flutter**: UI framework
- **Firebase Firestore**: Cloud database for syncing tasks
- **SQLite**: Local database for offline access
- **GetX**: State management

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/flutter-todo-app.git
   ```
2. Navigate to the project directory:
   ```sh
   cd flutter-todo-app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Set up Firebase:
   - Create a Firebase project
   - Enable Firestore database
   - Download the `google-services.json` file and place it in `android/app/`.
5. Run the app:
   ```sh
   flutter run
   ```

## Firestore Structure
```
users/
  {userId}/
    tasks/
      {taskId}
        title: "Task Title"
        description: "Task Description"
        completed: false
        timestamp: "2025-03-08T12:00:00Z"
```

## SQLite Structure
Table: `tasks`
- `id` (INTEGER, Primary Key)
- `title` (TEXT)
- `description` (TEXT)
- `completed` (INTEGER)
- `timestamp` (TEXT)

<div>
  <img src="https://github.com/user-attachments/assets/859188f3-5798-4a9a-9f8d-3248d6d4b557"height=500px>
   <img src="https://github.com/user-attachments/assets/d0931200-00fc-4762-a8f4-f3b194e919a9"height=500px>
   <img src="https://github.com/user-attachments/assets/bdc793d2-508d-4ff5-8a31-7167f04ab105"height=500px>
   <img src="https://github.com/user-attachments/assets/bae1dc88-a477-4a6e-9b1e-3ef30a2de6fa"height=500px>
   <img src="https://github.com/user-attachments/assets/a2b459e1-3122-4030-88b9-2abf39a8b339"height=500px>


</div>




https://github.com/user-attachments/assets/1759bada-5f25-4665-99e8-94e177be5f63

