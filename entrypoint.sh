#!/bin/sh

HOSTNAME=$(hostname)
IP=$(ip route get 1.2.3.4 | awk '{print $7}')

cat <<EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pagina cloud de prueba</title>

<style>
body{
    margin:0;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#0f172a,#1e3a8a);
    font-family:Arial,sans-serif;
    color:white;
}

.container{
    text-align:center;
    background:rgba(255,255,255,0.08);
    padding:40px;
    border-radius:20px;
    box-shadow:0 8px 30px rgba(0,0,0,0.3);
}

h1{
    font-size:3.5rem;
    margin-bottom:20px;
}

.info{
    font-size:1.4rem;
    margin:10px 0;
    color:#dbeafe;
}
</style>
</head>

<body>
<div class="container">
    <h1>Pagina cloud de prueba</h1>
    <div class="info">Nodo: $HOSTNAME</div>
    <div class="info">IP Local: $IP</div>
</div>
</body>
</html>
EOF

nginx -g 'daemon off;'
