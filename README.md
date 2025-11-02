# My Tasks Application  

## Overview

This repository contains a Flutter application developed as part of the **Flutter Developer Practical Test** for *Five Line for Web Services*.  
The project, titled **“My Tasks”**, is a task management app that allows users to efficiently organize, create, and track their daily tasks.  

The app demonstrates clean architecture using the **Bloc** and **Hydrated Bloc** state management approach with **Firebase** as the backend for authentication and data storage. It also includes localization (Arabic/English), offline persistence, and smooth UI animations.

---

## Core Features

*   **Splash and Authentication Screens**  
    - Splash screen with app logo and name.  
    - Firebase Authentication for login, signup, and logout.  
    - Authentication state persisted locally with **Hydrated Bloc**.

*   **Task Management (CRUD)**  
    - Add, edit, and delete tasks.  
    - Each task includes:  
        - **Title**  
        - **Description**  
        - **Status** (Done / Not Done).  
    - Real-time updates reflected instantly on the main task list.  
    - Offline caching and sync when the internet is restored.

*   **Localization**  
    - Supports both **Arabic 🇸🇦** and **English 🇬🇧**.  
    - Implemented using the `easy_localization` package.  
    - Changes apply instantly after restarting the app.

*   **Bonus Features**  
    - **Dark / Light Theme** switching.  
    - **Restart App** functionality using `restart_app` package.  
    - **Network Checker** using `data_connection_checker_tv` for real-time connection monitoring.  
    - **Dependency Injection** implemented with `get_it`.  
    - **Animations** and UI transitions for smooth navigation.  

---

## Project Structure

The application follows **Clean Architecture** principles and is organized feature-wise under the `lib/` directory.

