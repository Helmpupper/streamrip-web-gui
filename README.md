# Streamrip Web GUI

A web interface for [Streamrip](https://github.com/nathom/streamrip), providing an easy-to-use GUI for downloading music from various streaming services.


![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Python](https://img.shields.io/badge/python-3.11-blue.svg)
![Docker](https://img.shields.io/badge/docker-ready-green.svg)

## Features

- **Multi-Service Support**: Download from Qobuz, Tidal, Deezer, SoundCloud, and more
- **Built-in Search**: Search and download directly from the web interface
- **Download Management**: Track active downloads, view history, and browse downloaded files
- **Configuration Editor**: Edit streamrip settings directly from the web interface
- **Docker Ready**: Easy deployment with Docker

## Screenshots

*[Add screenshots of your interface here]*

## Prerequisites

- Python 3.11+ (if running without Docker)
- Docker and Docker Compose (for containerized deployment)
- Valid streaming service credentials configured in streamrip

## Installation

### Option 1: Docker (Recommended)

1. Clone the repository:
```bash
git clone https://github.com/yourusername/streamrip-web.git
cd streamrip-web
```

2. Create a `docker-compose.yml` file:
```yaml
services:    
  streamrip:
        build: ./streamrip-web
        container_name: streamrip
        user: "1000:1000" 
        environment:
          - HOME=/config
          - XDG_CONFIG_HOME=/config
          - STREAMRIP_CONFIG=/config/streamrip/config.toml
          - DOWNLOAD_DIR=/music
          - MAX_CONCURRENT_DOWNLOADS=2
        volumes:
          - /home/me/.config/streamrip:/config/streamrip:rw
          - /home/me/media-server/data/Music:/music:rw
        ports:
          - "5002:5000"
        restart: unless-stopped
```

3. Build and run:
```bash
docker-compose up -d --build
```

4. Access the web interface at `http://localhost:5002`

### Option 2: Manual Installation

1. Install Streamrip:
```bash
pip install streamrip
```

2. Configure Streamrip:
```bash
rip config
```
Follow the [Streamrip configuration guide](https://github.com/nathom/streamrip/wiki/Configuration) to set up your streaming service credentials.

3. Clone this repository:
```bash
git clone https://github.com/anoddname/streamrip-web.git
cd streamrip-web
```

4. Install dependencies:
```bash
pip install flask gunicorn requests
```

5. Run the application:
```bash
python app.py
```

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `STREAMRIP_CONFIG` | `/config/config.toml` | Path to streamrip configuration file |
| `DOWNLOAD_DIR` | `/music` | Directory for downloaded music |
| `MAX_CONCURRENT_DOWNLOADS` | `2` | Maximum simultaneous downloads |

### Streamrip Configuration

Before using Streamrip Web, you need to configure streamrip with your streaming service credentials:

1. **Qobuz**: Requires email and password (or user_id and token)
2. **Tidal**: Requires email and password  
3. **Deezer**: Requires ARL token
4. **SoundCloud**: Works without authentication

Refer to the [Streamrip documentation](https://github.com/nathom/streamrip/wiki) for detailed setup instructions.

## Usage

### Downloading from URL

1. Paste a streaming service URL in the input field
2. Select quality (MP3 128/320 or FLAC 16/24-bit)
3. Click DOWNLOAD

### Searching for Music

1. Select a streaming service from the dropdown
2. Choose search type (Albums, Tracks, or Artists)
3. Enter your search query
4. Click on DOWNLOAD next to any result

### Managing Downloads

- **Active Tab**: View current downloads and their progress
- **History Tab**: See completed downloads
- **Files Tab**: Browse downloaded music files
- **Config Tab**: Edit streamrip configuration

## Project Structure

```
streamrip-web/
├── app.py                 # Flask application
├── Dockerfile            # Docker container definition
├── requirements.txt      # Python dependencies (create this)
├── templates/
│   └── index.html       # Main web interface
└── static/
    ├── css/
    │   └── style.css    # Styling
    └── js/
        └── app.js       # Frontend JavaScript
```

## Development

To run in development mode with hot reload:

```bash
flask --app app.py run --debug --reload
```

## Troubleshooting

### Common Issues

1. **"Config file not found"**: Make sure streamrip is properly configured. Run `rip config` to create a configuration file.

2. **Downloads failing/Searches timing out**: Check that your streaming service credentials are valid and properly configured in streamrip.

3. **Permission errors**: Ensure the download directory has proper write permissions.

4. **Search not working**: Some services (like SoundCloud) don't support all search types (albums/artists).

5. **Unable to open database file**: Check paths inside container and configure config.toml inside the container if need be. 

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- [Streamrip](https://github.com/nathom/streamrip) - The core downloading functionality
- Flask - Web framework
- IBM Plex Mono - Typography

## Disclaimer

This tool is for educational purposes only. Ensure you comply with the terms of service of the streaming platforms you use. Support artists by purchasing their music when possible.

## Support

For issues and questions:
- Open an issue on GitHub
- Check existing issues for solutions
- Refer to Streamrip documentation for service-specific problems

---

Fueled by spite