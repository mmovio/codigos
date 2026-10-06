-- Tabla de récords de "¿Cuánto sabés de Boca?"
-- Pegá todo esto en Supabase → SQL Editor → New query → Run.

create table if not exists public.records (
  jugador uuid primary key,                       -- id al azar de cada teléfono (no se muestra)
  nombre  text not null check (char_length(nombre) between 1 and 20),
  puntaje integer not null check (puntaje between 0 and 4500),  -- 10 preguntas x 150 x3 como máximo
  fecha   timestamptz not null default now()
);

alter table public.records enable row level security;

-- Todos pueden ver la tabla, pero solo nombre, puntaje y fecha.
drop policy if exists "todos leen" on public.records;
create policy "todos leen" on public.records for select using (true);
revoke all on public.records from anon, authenticated;
grant select (nombre, puntaje, fecha) on public.records to anon, authenticated;

-- La única forma de escribir: guarda el mejor puntaje de cada jugador.
create or replace function public.guardar_record(p_jugador uuid, p_nombre text, p_puntaje integer)
returns void
language sql
security definer
set search_path = public
as $$
  insert into records (jugador, nombre, puntaje)
  values (p_jugador, trim(p_nombre), p_puntaje)
  on conflict (jugador) do update
    set nombre  = excluded.nombre,
        puntaje = greatest(records.puntaje, excluded.puntaje),
        fecha   = case when excluded.puntaje > records.puntaje then now() else records.fecha end;
$$;

revoke all on function public.guardar_record(uuid, text, integer) from public;
grant execute on function public.guardar_record(uuid, text, integer) to anon, authenticated;
