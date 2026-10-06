# ¿Cuánto sabés de Boca?

Trivia de Boca Juniors para jugar en el iPhone (o cualquier celular) desde el navegador.

- 10 preguntas al azar por partida, 15 segundos cada una.
- 100 puntos por acierto, más un extra por responder rápido.
- Racha: con 3 aciertos seguidos los puntos valen x2, con 5 valen x3.
- El récord se guarda en el teléfono.
- Tabla de récords compartida (nombre y puntaje): cada jugador queda anotado con su mejor marca.

## Publicarlo en GitHub Pages

1. En GitHub: *Settings → Pages → Build and deployment*. En *Source* elegí **Deploy from a branch**, la rama del juego y la carpeta **/ (root)**. Guardá.
2. A los uno o dos minutos el juego queda en `https://mmovio.github.io/codigos/`.

## Tabla de récords con Supabase

1. Creá un proyecto gratis en [supabase.com](https://supabase.com).
2. En *SQL Editor* pegá el contenido de `supabase.sql` y tocá **Run**.
3. En *Project Settings → API* copiá la **Project URL** y la clave **anon / publishable**.
4. Pegalas en `index.html`, en `const SUPABASE = { url: "...", key: "..." }`, y subí el cambio.

La clave anon es pública a propósito: las reglas de `supabase.sql` solo dejan leer nombre y puntaje, y escribir a través de `guardar_record`, que guarda el mejor puntaje de cada teléfono. Sin Supabase configurado, la tabla no aparece y el juego anda igual. Desde claude.ai la tabla usa la base de datos del Artifact.

## Instalarlo en el iPhone

Abrí el enlace en Safari y tocá *Compartir → Añadir a pantalla de inicio*. Queda como una app más, a pantalla completa.

## Agregar preguntas

Las preguntas están en `index.html`, en la lista `PREGUNTAS`. Cada una tiene:

```js
{ c: "Categoría", p: "La pregunta", r: ["Respuesta correcta", "Incorrecta", "Incorrecta", "Incorrecta"], d: "Dato que se muestra después" }
```

La primera respuesta siempre es la correcta; el juego las mezcla solo.
