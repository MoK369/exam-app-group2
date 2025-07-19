# Online Exam App 🎓📚📓

Online Exam App is a **Flutter-based mobile application** that enables users to take online exams, track their results, and manage their progress efficiently. The app provides a seamless experience with features such as **secure authentication, subject-wise exam selection, timer-based MCQ tests, and result tracking**. Built using **MVI architecture and Cubit for state management**, the app ensures a **structured, scalable, and maintainable** codebase for future enhancements.

## Features ✨

### 🔐 Authentication
- **Login Screen**: Users can log in to access their exams.
- **Register Screen**: New users can create an account.
- **Forget Password Screen**: Users can reset their password securely.

### 📈 Home Screen
- Displays a list of **subjects**.
- Users can select a subject to view **available exams**.

### 📖 Exam Flow
1. **Exam Selection**: Choose an exam from a subject.
2. **Instruction Screen**: Displays exam **instructions, duration, and number of questions**.
3. **Start Exam Button**: Begins the exam.
4. **MCQ Exam Screen**:
   - Timer-based questions according to the exam's duration.
   - Multiple-choice questions with 4 answer options.
   - Users can navigate between questions.
5. **Result Screen**: Shows the user's score after completing the exam.

### 📊 Results Tab
- Displays **results of completed exams** categorized by subjects.
- Users can review past performance.

### 👤 Profile Tab
- Displays **user profile information**.
- Users can **update their password** and manage account settings.

## Project Structure 📂

The project follows a well-structured directory organization:

```
lib/
│── api/          # API manager and services for fetching exam data
│── auth/         # Login, Register, and Forget Password screens
│── home/         # Main screens for Subjects, Exams, and Navigation
│── exam/         # Exam process screens (Instructions, MCQ, Timer, Results)
│── profile/      # User profile and settings
│── results/      # Result tracking and performance history
│── l10n/         # Localization support for multiple languages
│── providers/    # ChangeNotifier classes for managing app state
│── utils/        # Utility files like colors, constants, and helpers
│── main.dart     # Entry point of the application
```

## Tech Stack 🛠️
- **Flutter**: For building the cross-platform mobile app.
- **MVI Architecture**: Ensures a structured and maintainable codebase.
- **Cubit (flutter_bloc)**: For efficient state management.
- **Injectable & GetIt**: For dependency injection.
- **Dio & Pretty Dio Logger**: For API integration and debugging.
- **Shared Preferences**: For local data storage.
- **Google Fonts**: For elegant and customizable typography.
- **Easy Localization**: Supports multiple languages.
- **Lottie**: For animations.
- **Flutter ScreenUtil**: For responsive UI design.
- **Flutter Spinkit**: For loading animations.
- **Connectivity Plus**: For network connectivity checks.
- **Syncfusion Flutter Charts**: For visualizing results and performance.
- **Flutter Timer Countdown**: For handling exam timers.
- **OTP Text Field**: For OTP-based authentication.

## Installation & Usage ⚡

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/online-exam-app.git
   ```

2. Navigate to the project directory:
   ```sh
   cd online-exam-app
   ```

3. Install dependencies:
   ```sh
   flutter pub get
   ```

4. Run the app:
   ```sh
   flutter run
   ```

## 🎥 Demo & Presentation
[View App Demo on Google Drive](https://drive.google.com/drive/folders/1xFJ-HxQaJmOku1QKLHZvn1fxYUwNlArJ?usp=sharing)

# Pictures:
![WhatsApp Image 2025-07-17 at 8 54 08 PM](https://github.com/user-attachments/assets/3787fcad-ef64-4f12-8e48-86b1c3f362cb)

![WhatsApp Image 2025-04-25 at 17 38 08](https://github.com/user-attachments/assets/fc57a80d-b184-4285-b4e4-c89a8cc4febd)

![WhatsApp Image 2025-04-25 at 17 38 08 (1)](https://github.com/user-attachments/assets/380ba068-b409-48f8-97b1-873e7c00eaab)

![WhatsApp Image 2025-07-17 at 8 58 07 PM](https://github.com/user-attachments/assets/109321c9-071a-4d03-840e-b57e8de4ee50)

![WhatsApp Image 2025-07-17 at 9 03 01 PM (1)](https://github.com/user-attachments/assets/4c14220e-7b0c-46cc-a2ad-4490e95f5321)

![WhatsApp Image 2025-07-17 at 8 58 07 PM (1)](https://github.com/user-attachments/assets/4b5c7ea3-9543-41b4-bc85-2c9dbfd71c97)

![WhatsApp Image 2025-07-17 at 8 58 07 PM (2)](https://github.com/user-attachments/assets/413f53d2-3dc2-4d43-b58e-2b0451aa8cf5)

![WhatsApp Image 2025-04-25 at 17 38 08 (2)](https://github.com/user-attachments/assets/2a317825-2802-4abc-be4e-0aa2792507fd)

![WhatsApp Image 2025-04-25 at 17 38 08 (3)](https://github.com/user-attachments/assets/7a01e77e-ff66-46f6-acd7-fc524a4a7621)

![WhatsApp Image 2025-04-25 at 17 38 09](https://github.com/user-attachments/assets/01e5cac8-2a32-4f78-8b48-7d2364743e4c)

![WhatsApp Image 2025-07-17 at 9 07 06 PM](https://github.com/user-attachments/assets/e82de79b-3953-48e4-a90e-9e7a40b4906f)

![WhatsApp Image 2025-07-17 at 9 03 01 PM](https://github.com/user-attachments/assets/c5753ef8-c904-4faa-9c6a-aa648800b9b3)

![WhatsApp Image 2025-04-25 at 17 38 09 (1)](https://github.com/user-attachments/assets/68a14385-4cbc-4bee-90ad-f2c255580f43)
