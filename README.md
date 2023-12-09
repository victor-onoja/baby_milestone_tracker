# Baby Milestones Tracker

Baby Milestones Tracker is a Flutter app designed to help parents cherish and record special moments in their baby's development. This README provides an overview of the app's structure, key features, and design decisions.

## Introduction

Baby Milestones Tracker is a mobile app built with Flutter, a UI toolkit for creating natively compiled applications for mobile, web, and desktop from a single codebase.

## Key Features

- Onboarding Screen: Welcomes users to the app, providing information on how to use it effectively.
- Dashboard: Allows mothers to view a list of milestones and navigate to add or edit them.
- Milestone Editing: Users can add, view, and edit milestones, including details like date, milestone type, notes, and optional images.
- Light and Dark Modes: Supports both light and dark themes for user preference.

## Project Structure

- lib/: Contains the main Dart code for the app.
- screens/: Contains the different screens of the app (e.g., onboarding, dashboard).
- models/: Includes the data models used in the app (e.g., Milestone).

## Design Decisions

### Packages used

- Shared Preferences: The shared_preferences package is used for persisting simple data in key-value pairs on the device. In the Baby Milestones Tracker app, it is employed to store user's milestones This ensures that users' preferences are retained between app sessions.
- UUID: The uuid package is utilized for generating unique identifiers for milestones. Each milestone is assigned a unique ID using uuid to ensure that the data remains distinct and identifiable.
- Intro Slider: The intro_slider package is integrated to create an onboarding experience for new users. It provides a simple and engaging way to introduce users to the app's features and functionality.

### other design decision

- Fonts: Custom fonts are used to enhance the visual appeal of the app. The Caveat font family is chosen, which includes both regular and bold variants. These fonts are included in the assets directory and specified in the pubspec.yaml file.
- State Management: The app uses setState for simple state management.
- Onboarding: The onboarding screen provides clear instructions on using the app and highlights the importance of tracking baby milestones.
