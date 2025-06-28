# BGMI Tournament Automation App (Open Source)

A mobile app to automate **BGMI tournaments** with a clean UI and fully serverless backend powered by **Firebase**.

> **UI Inspired by:**  
> [Dribbble Design](https://cdn.dribbble.com/userupload/34262052/file/original-09e8e9a348b2c82cfac4983f8b66fc30.jpg?resize=1600x1026&vertical=center)  
> [Behance Project](https://www.behance.net/gallery/199177723/Mobile-Application-Design-for-Gaming-Platform)

---

## Preview

<div align="center">
  <img src="https://cdn.dribbble.com/userupload/34262052/file/original-09e8e9a348b2c82cfac4983f8b66fc30.jpg?resize=1600x1026&vertical=center" width="100%" />
</div>

---

## Features

- Create tournaments with custom settings (mode, capacity, prize pool)
- Auto room creation via Firebase Cloud Functions
- Auto-kick system with Firestore triggers
- Player registration, match scheduling, and leaderboard
- Admin panel with control features
- Share tournaments via invite links

---

## Firebase Services Used

| Feature              | Service                     |
|----------------------|------------------------------|
| Authentication       | Firebase Auth                |
| Realtime Database    | Firestore                    |
| Backend Logic        | Cloud Functions (Node.js)    |
| Image Uploads        | Firebase Storage             |
| Push Notifications   | Firebase Cloud Messaging     |
| Optional Web Hosting | Firebase Hosting             |

---

## Automation Workflow

### Room Creation  
A scheduled match triggers a Firebase Function that creates the match room and notifies participants.

### Auto Kick Logic  
Users who fail to verify or break rules are auto-removed via Firestore triggers.

### Live Sync  
All match and player data updates in real time using Firestore listeners.

---

## Tech Stack

| Layer     | Technology             |
|-----------|------------------------|
| Frontend  | Flutter                |
| Backend   | Firebase (Serverless)  |
| Database  | Firestore              |
| Auth      | Firebase Auth          |
| Functions | Firebase Cloud Functions (Node.js) |
| Messaging | Firebase Cloud Messaging |

---

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/bgmi-tournament-app.git
cd bgmi-tournament-app'
```

## Contribution Guide

We welcome all contributors — developers, designers, writers, and testers.

### How You Can Contribute

#### Code Contributions
- Fix bugs or crashes  
- Add new features (e.g., team system, dark mode)  
- Improve UI/UX or app performance

#### Firebase Enhancements
- Create or optimize Cloud Functions  
- Enhance automation for room creation or kicking logic

#### Documentation
- Improve the README and setup guides  
- Translate content or write walkthroughs

#### Community Support
- Report bugs with context and details  
- Help answer GitHub Issues or discussions  
- Suggest practical features or improvements

---

### Contribution Rules

- Use Pull Requests for all changes (no direct pushes to main)  
- Code should be clean, tested, and well-documented  
- Avoid blindly submitting AI-generated code without review  
- Collaborate respectfully and ensure peer review before merging

---

### Recognition

Meaningful contributors will:
- Be added to `CONTRIBUTORS.md`  
- Receive a Contributor badge on GitHub  
- Be mentioned in release notes  
- Be listed in the app’s “Top Contributors” section (coming soon)

---

### Earning Opportunities

If the project generates revenue via:
- Sponsorships  
- Premium features  
- Freelance work  

Then top contributors may receive:
- Paid feature development tasks  
- Custom module work  
- Revenue share based on contribution

---

### Suggest a Feature or Report an Issue

- Open an Issue here: [GitHub Issues](https://github.com/iambhabha/tournament_app/issues)  
- Submit a Pull Request with your improvements or fixes

