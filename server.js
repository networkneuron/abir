const express = require('express');
const app = express();
const http = require('http').createServer(app);
const io = require('socket.io')(http);
const path = require('path');

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

// Store connected players
const players = {};

// Socket.IO connection handling
io.on('connection', (socket) => {
    console.log('Player connected:', socket.id);
    players[socket.id] = { x: 0, y: 1, z: 0 };

    // Handle player position updates
    socket.on('updatePosition', (data) => {
        players[socket.id] = data;
        io.emit('updatePlayers', players);
    });

    // Handle node placement
    socket.on('placeNode', (data) => {
        io.emit('newNode', data);
    });

    // Handle puzzle completion
    socket.on('puzzleComplete', (data) => {
        io.emit('puzzleUpdate', { playerId: socket.id, ...data });
    });

    // Handle disconnection
    socket.on('disconnect', () => {
        delete players[socket.id];
        io.emit('updatePlayers', players);
        console.log('Player disconnected:', socket.id);
    });
});

// Start the server
const PORT = process.env.PORT || 3000;
http.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
}); 