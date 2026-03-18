# ✈️ QuickTrip AI

[![Ruby Version](https://img.shields.io/badge/ruby-3.2%2B-red.svg)](https://www.ruby-lang.org/)
[![Rails Version](https://img.shields.io/badge/rails-7.0%2B-red.svg)](https://rubyonrails.org/)
[![License](https://img.shields.io/badge/license-All%20Rights%20Reserved-lightgrey.svg)]()

AI-powered travel planner built with Ruby on Rails, featuring real-time chat, streaming responses, and asynchronous itinerary generation.

Users can create trips and interact with an AI assistant that dynamically generates personalized travel plans with real-time streaming and background processing.

🔗 **Live Demo:** [https://quicktrip-ai-53d7a1d73f9b.herokuapp.com/](https://quicktrip-ai-53d7a1d73f9b.herokuapp.com/)

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Architecture](#-architecture)
- [How It Works](#-how-it-works)
- [Setup Instructions](#-setup-instructions)
- [Screenshots](#-screenshots)
- [Challenges & Learnings](#-challenges--learnings)
- [Future Improvements](#-future-improvements)
- [Author](#-author)

---

## 🚀 Overview

Planning a trip can be time-consuming and overwhelming. **QuickTrip AI** simplifies this process by combining artificial intelligence with a smooth, real-time chat interface.

Users can create a trip, describe their preferences, and receive a personalized itinerary generated asynchronously, with responses streamed directly into the interface.

This project was designed to reflect a real-world SaaS application, focusing on **performance**, **user experience**, and **scalable architecture**.

---

## ✨ Features

- 🤖 **AI-generated** travel itineraries
- 💬 **Real-time** chat interface
- ⚡ **Streaming responses** (Turbo Streams)
- 🔄 **Asynchronous processing** with background jobs
- 🧠 **Context-aware** AI prompts
- 🔐 **User authentication**
- 🗂️ **Trip history** and persistence
- 📱 **Responsive user interface**

---

## 🛠 Tech Stack

### Backend
- **Ruby on Rails** - Web framework
- PostgreSQL (production) / SQLite (development)
- **Active Job** - Background job processing

### Frontend
- **Turbo (Hotwire)** - SPA-like experience without JavaScript
- **Stimulus.js** - JavaScript framework
- **HTML / CSS** - Markup and styling

### Real-time
- **ActionCable** - WebSocket-based communication
- **Turbo Streams** - Real-time DOM updates

### AI Integration
- **OpenAI API** - GPT model integration

### Deployment
- **Heroku** - Cloud platform

---

## 🧱 Architecture

The application follows a standard **Rails MVC** structure enhanced with real-time and asynchronous capabilities:

| Component | Purpose |
|-----------|---------|
| **Turbo Streams** | Real-time UI updates |
| **ActionCable** | WebSocket-based communication |
| **Background Jobs** | Process AI responses without blocking the UI |
| **Stimulus Controllers** | Frontend interactivity management |

---

## ⚙️ How It Works

1. 📝 The user **creates** a new trip
2. 💬 A **chat session** is initialized
3. ✉️ The user **sends a message** describing the desired itinerary
4. ⚙️ A **background job** asynchronously sends the request to the AI
5. 🤖 The AI response is **processed asynchronously**
6. 📥 The response is **streamed back** into the chat interface in real time

---

## 🧪 Setup Instructions

### Prerequisites

- Ruby 3.2+
- Rails 7.0+
- PostgreSQL (or SQLite for development)
- OpenAI API key

### Installation

```bash
# Clone the repository
git clone https://github.com/robertodefarias/quicktrip-ai.git
cd quicktrip-ai

# Install dependencies
bundle install

# Setup environment variables
cp .env.example .env
# Edit .env and add your OpenAI API key

# Setup the database
rails db:create db:migrate

# Run the server
rails server
```
The application will be available at `http://localhost:3000`

---

## 📸 Screenshots

<div align="center">

| Feature | Preview |
|:-------:|:-------:|
| **Homepage** | *Coming soon* |
| **Trip Creation** | *Coming soon* |
| **Chat Interface** | *Coming soon* |
| **AI Streaming** | *Coming soon* |

</div>

> 🚧 Screenshots will be added in the next release.

---

## 🧠 Challenges & Learnings

This project provided hands-on experience with:

- Implementing real-time features using Turbo Streams and WebSockets
- Handling asynchronous workflows with background jobs
- Designing a responsive chat-based interface
- Structuring AI prompts for better output quality
- Integrating third-party APIs into a Rails application
- Managing state and UI updates without page reloads

---

## 🔮 Future Improvements

- 🌍 Multilingual support (English / Portuguese)
- 📍 Integration with maps and location APIs
- 🧳 Save and export itineraries
- 🧠 Improved AI personalization
- 📊 User analytics dashboard
- 💳 Payment integration for premium features

---

## 👨‍💻 Author

**Roberto de Farias**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/robertodefarias)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=flat&logo=github&logoColor=white)](https://github.com/robertodefarias)

Originally developed as part of a collaborative bootcamp project and later independently refined, documented, and extended for portfolio presentation.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
