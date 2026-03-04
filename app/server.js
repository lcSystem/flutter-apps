const express = require('express');
const app = express();
const PORT = 3000;

app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
    res.send(`
        <h2>Login</h2>
        <form method="POST" action="/login">
            <input type="text" name="username" placeholder="Usuario" required />
            <br><br>
            <input type="password" name="password" placeholder="Contraseña" required />
            <br><br>
            <button type="submit">Ingresar</button>
        </form>
    `);
});

app.post('/login', (req, res) => {
    const { username, password } = req.body;

    if (username === "admin" && password === "admin") {
        res.redirect('/dashboard');
    } else {
        res.send(`
            <h3>Usuario o contraseña incorrectos</h3>
            <a href="/">Volver al login</a>
        `);
    }
});

app.get('/dashboard', (req, res) => {
    res.send(`
        <h1>Bienvenido Admin 🎉</h1>
        <form method="GET" action="/">
            <button type="submit">Cerrar Sesión</button>
        </form>
    `);
});

app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
