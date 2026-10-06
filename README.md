# ¿Cuánto sabés de Boca?

Trivia de Boca Juniors para jugar en el iPhone (o cualquier celular) desde el navegador.

- 10 preguntas al azar por partida, 15 segundos cada una.
- 100 puntos por acierto, más un extra por responder rápido.
- Racha: con 3 aciertos seguidos los puntos valen x2, con 5 valen x3.
- El récord se guarda en el teléfono.

## Cómo jugarlo en el iPhone

1. Publicá la carpeta en cualquier hosting estático (por ejemplo GitHub Pages: *Settings → Pages → Deploy from branch*).
2. Abrí el enlace en Safari.
3. Tocá *Compartir → Añadir a pantalla de inicio*. Queda como una app más, a pantalla completa.

## Agregar preguntas

Las preguntas están en `index.html`, en la lista `PREGUNTAS`. Cada una tiene:

```js
{ c: "Categoría", p: "La pregunta", r: ["Respuesta correcta", "Incorrecta", "Incorrecta", "Incorrecta"], d: "Dato que se muestra después" }
```

La primera respuesta siempre es la correcta; el juego las mezcla solo.
