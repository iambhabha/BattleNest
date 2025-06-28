# 🎮 BGMI Tournament Automation App (Open Source)

This is an **open-source mobile app** to organize and automate **BGMI tournaments** with a beautiful UI and powerful backend automation — **fully powered by Firebase**!

> 💡 **UI Inspired by:**  
> 🎨 [Dribbble Design Source](https://cdn.dribbble.com/userupload/34262052/file/original-09e8e9a348b2c82cfac4983f8b66fc30.jpg?resize=1600x1026&vertical=center)  
> 💼 [Behance Project](https://www.behance.net/gallery/199177723/Mobile-Application-Design-for-Gaming-Platform)

---

## 📱 Preview

<div align="center">
  <img src="https://cdn.dribbble.com/userupload/34262052/file/original-09e8e9a348b2c82cfac4983f8b66fc30.jpg?resize=1600x1026&vertical=center" width="100%" />
</div>

---

## 🚀 Features

✅ Create tournaments with game mode, player capacity, and prize pool  
✅ Automated **room creation** with Firebase Cloud Functions  
✅ Auto **kick logic** using real-time validation in Firestore  
✅ Share tournaments via links  
✅ Player registration, match scheduling, and leaderboard  
✅ Admin/Host panel with control options  

---

## 🔥 Powered by Firebase

| Feature              | Firebase Service Used            |
|----------------------|----------------------------------|
| Authentication       | Firebase Auth                    |
| Database             | Firestore                        |
| Automation Logic     | Cloud Functions (Node.js)        |
| Storage (Images)     | Firebase Storage                 |
| Notifications        | Firebase Cloud Messaging (FCM)   |
| Hosting (Optional)   | Firebase Hosting (Web version)   |

---

## 💡 How Automation Works

- **Room Creation**  
  → When a match is scheduled, a Firebase Cloud Function creates a virtual "room" entry and updates all participants in real time.

- **Auto Kick System**  
  → Players not verifying before deadline or breaking rules are auto-removed using Firestore triggers.

- **Live Updates**  
  → Firestore streams enable instant updates for players and hosts.

---

## 🛠 Tech Stack

| Layer       | Technology      |
|-------------|-----------------|
| Frontend    | Flutter         |
| Backend     | Firebase (100%) |
| Auth        | Firebase Auth   |
| DB          | Firestore       |
| Logic       | Cloud Functions |
| Messaging   | FCM             |

---

## 🧪 Getting Started

1. **Clone the Repo**
   ```bash
   git clone https://github.com/yourusername/bgmi-tournament-app.git
   cd bgmi-tournament-app

![Uploading image.png…]()

