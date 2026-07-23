<p align="center">
  <img src="./assets/repository-banner.svg" width="100%" alt="Social Feed — A Firebase-backed SwiftUI social app learning project" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Swift-5-F05138?style=flat-square&logo=swift&logoColor=white" alt="Swift 5" />
  <img src="https://img.shields.io/badge/UI-SwiftUI-0D96F6?style=flat-square&logo=swift&logoColor=white" alt="SwiftUI" />
  <img src="https://img.shields.io/badge/Auth-Firebase-FFCA28?style=flat-square&logo=firebase&logoColor=111827" alt="Firebase Auth" />
  <img src="https://img.shields.io/badge/Data-Firestore-FF6F00?style=flat-square&logo=firebase&logoColor=white" alt="Firestore" />
</p>

## Overview

Social Feed is a learning-focused SwiftUI application inspired by modern photo-sharing products. It explores a complete social-app structure: multi-step registration, authentication, profiles, a Firestore feed, photo selection, post creation, search, messaging, notifications, reels-style UI, and tab navigation.

## What it demonstrates

- Firebase Authentication for account creation, login, session restoration, and sign-out
- Firestore-backed user profiles and timestamp-ordered posts
- A multi-step SwiftUI registration flow
- Photo selection with PhotosUI and post composition
- Profile editing, user statistics, post grids, stories, and feed cards
- Real-time chat updates using Firestore snapshot listeners
- Search, notification, upload, reels, and messaging feature modules
- MVVM-style organization across authentication, feed, profile, search, and upload flows

## Project structure

```text
InstagramTutorial/
├── App/
├── Core/
│   ├── Authentication/
│   ├── Feed/
│   ├── Messages/
│   ├── Profile/
│   ├── Search/
│   ├── UploadPost/
│   └── TabBar/
├── Model/
└── Services/
```

## Run locally

### Requirements

- Xcode 16 or newer
- iOS 18.5+ target
- A Firebase project with Authentication and Firestore enabled

### Setup

1. Clone the repository and open `InstagramTutorial.xcodeproj`.
2. Select your signing team and use your own bundle identifier.
3. Register the app in Firebase and replace the Firebase configuration with your own.
4. Enable Email/Password authentication.
5. Create Firestore collections for `users`, `posts`, and `messages`.
6. Build and run.

## Current scope

This repository is an educational implementation rather than a production social network. Uploaded images are encoded into Firestore documents for demonstration; a production version should use Firebase Storage or another object store. Error handling, moderation, pagination, security rules, and media processing also need production hardening.

## Good next steps

- Move media uploads to object storage
- Add Firestore security rules and emulator-backed tests
- Paginate the feed and search results
- Improve surfaced error states instead of logging failures
- Add accessibility identifiers and meaningful UI tests
- Remove user-specific Xcode state files from version control
