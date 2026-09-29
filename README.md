# OmniTools Backend API ⚡

A high-performance Express.js backend server for media processing, YouTube & Instagram metadata retrieval, audio extraction, video aspect ratio conversion, and stream downloads.

---

## Features

- **YouTube Processing**:
  - Fetch video formats, quality options, codecs, and stream URLs (`/api/info`)
  - Video metadata extraction (Title, tags, description, keywords) (`/api/metadata`)
  - Real-time video/audio download & merge pipeline using `yt-dlp` and `ffmpeg` (`/api/download`)
  - Channel analytics, keyword discovery, and channel metadata (`/api/channel-info`, `/api/channel-keywords`)
- **Instagram Processing**:
  - Instagram post/reel metadata & media stream links (`/api/instagram/info`, `/api/instagram/download`)
- **Automated Lifecycle & Cleanup**:
  - Startup temp file cleanup and periodic 5-minute safety-net garbage collection.

---

## Prerequisites

1. **Node.js** (v16+ recommended)
2. **ffmpeg** (`ffmpeg.exe` placed in the project root or available in system PATH)
3. **yt-dlp** (`yt-dlp.exe` placed in the project root or available in system PATH)

---

## Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Sanal19610/omnitools-backend.git
   cd omnitools-backend
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Add Binaries (if on Windows and not in system PATH):**
   - Download [`yt-dlp.exe`](https://github.com/yt-dlp/yt-dlp/releases) and place it in the root directory.
   - Download [`ffmpeg.exe`](https://ffmpeg.org/download.html) and place it in the root directory.

---

## Running the Server

- **Start in production mode:**
  ```bash
  npm start
  ```
- **Start in development mode:**
  ```bash
  node server.js
  ```

By default, the server runs on port **3000** (`http://localhost:3000`).

---

## API Endpoints

| Method | Route | Description |
|---|---|---|
| `GET` | `/api/info?url=<YOUTUBE_URL>` | Get video stream formats, resolutions, and direct URLs |
| `GET` | `/api/metadata?url=<YOUTUBE_URL>` | Get video title, tags, description, and keywords |
| `GET` | `/api/channel-info?url=<CHANNEL_URL>` | Retrieve channel details and analytics |
| `GET` | `/api/channel-keywords?url=<CHANNEL_URL>` | Extract channel keywords and tags |
| `GET` | `/api/download?url=<URL>&quality=<TAG>&format=<mp4\|mp3>` | Download/stream processed media directly |
| `GET` | `/api/instagram/info?url=<IG_URL>` | Get Instagram post/reel details and media streams |
| `GET` | `/api/instagram/download?url=<IG_URL>` | Download Instagram video/image media |
| `GET` | `/api/keywords?url=<URL_OR_HANDLE>` | Extract hidden video tags or channel SEO keywords |

---

## License

ISC
