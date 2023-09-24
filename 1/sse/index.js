const express = require('express');

const app = express();
app.use(express.static('public'))

app.get('/events', (req, res) => {

    res.writeHead(200, {
        'Content-Type': 'text/event-stream',
        'Cache-Control': 'no-cache',
        'Connection': 'keep-alive',
        'Access-Control-Allow-Origin': '*'
    });
    res.flushHeaders();

        res.write(`id: 0\n`);
        res.write(`event: event1\n`);
        res.write(`data: Message`);
        res.write(`\n\n`);
        
        res.write(`id: 2\n`);
        res.write(`event: event1\n`);
        res.write(`data: Message`);
        res.write(`\n\n`);
        
        res.write(`id: 44\n`);
        res.write(`event: event1\n`);
        res.write(`data: Message`);
        res.write(`\n\n`);
        
        res.write(`id: 6\n`);
        res.write(`event: event1\n`);
        res.write(`data: Message`);
        res.write(`\n\n`);

});

app.listen(3000);