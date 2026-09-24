#!/bin/bash
# ---------------------------------------------------------------
#  Libretto Ferie — pubblica su GitHub
#
#  Come si usa:
#    doppio clic su questo file,
#    oppure da terminale:  ./pubblica.command "cosa ho cambiato"
#
#  La prima volta prepara tutto e chiede l'indirizzo del repository.
#  Dalle volte successive salva e pubblica, e basta.
# ---------------------------------------------------------------

set -u

# lavora sempre nella cartella in cui si trova questo file
cd "$(dirname "$0")" || exit 1

RAMO="main"

riga()  { printf '\n%s\n' "────────────────────────────────────────"; }
ok()    { printf '  OK   %s\n' "$1"; }
info()  { printf '       %s\n' "$1"; }
errore(){ printf '\n  STOP %s\n\n' "$1"; }

fine() {
  printf '\nPremi Invio per chiudere questa finestra.'
  read -r _
  exit "${1:-0}"
}

riga
printf '  LIBRETTO FERIE — pubblicazione su GitHub\n'
riga

# --- 1. c'è git? ------------------------------------------------
if ! command -v git >/dev/null 2>&1; then
  errore "Git non è installato su questo computer."
  info "Aprilo dal Terminale con:  xcode-select --install"
  info "Poi riprova con questo file."
  fine 1
fi

# --- 2. il repository esiste già? -------------------------------
if [ ! -d .git ]; then
  info "Prima pubblicazione: preparo la cartella."
  git init -q
  git branch -M "$RAMO"
  ok "Cartella pronta."
fi

# --- 3. chi sei? ------------------------------------------------
if [ -z "$(git config user.name || true)" ]; then
  printf '\nCome ti chiami? (comparirà accanto alle modifiche)\n> '
  read -r NOME
  [ -n "$NOME" ] && git config user.name "$NOME"
fi
if [ -z "$(git config user.email || true)" ]; then
  printf '\nLa tua email di GitHub\n> '
  read -r EMAIL
  [ -n "$EMAIL" ] && git config user.email "$EMAIL"
fi

# --- 4. dove pubblico? ------------------------------------------
if ! git remote get-url origin >/dev/null 2>&1; then
  printf '\nNon so ancora su quale repository pubblicare.\n'

  if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
    printf 'Ne creo uno nuovo al posto tuo? [s/n] > '
    read -r RISPOSTA
    if [ "$RISPOSTA" = "s" ] || [ "$RISPOSTA" = "S" ]; then
      printf 'Nome del repository (invio per "libretto-ferie")\n> '
      read -r NOMEREPO
      [ -z "$NOMEREPO" ] && NOMEREPO="libretto-ferie"
      if gh repo create "$NOMEREPO" --public --source=. --remote=origin; then
        ok "Repository creato."
      else
        errore "Non sono riuscito a crearlo. Crealo a mano su github.com e riprova."
        fine 1
      fi
    fi
  fi

  if ! git remote get-url origin >/dev/null 2>&1; then
    printf '\nCrea un repository vuoto su github.com, poi incolla qui il suo indirizzo.\n'
    printf 'Esempio: https://github.com/tuonome/libretto-ferie.git\n> '
    read -r INDIRIZZO
    if [ -z "$INDIRIZZO" ]; then
      errore "Senza indirizzo non posso pubblicare."
      fine 1
    fi
    git remote add origin "$INDIRIZZO"
    ok "Indirizzo salvato: non te lo chiederò più."
  fi
fi

# --- 5. c'è qualcosa di nuovo? ----------------------------------
git add -A

if git diff --cached --quiet 2>/dev/null && [ -n "$(git rev-parse --verify HEAD 2>/dev/null || true)" ]; then
  riga
  info "Nessuna modifica da pubblicare: è già tutto aggiornato."
  fine 0
fi

# --- 6. salva -----------------------------------------------------
if [ "$#" -gt 0 ] && [ -n "$1" ]; then
  MESSAGGIO="$1"
else
  MESSAGGIO="Aggiornamento del $(date '+%d/%m/%Y alle %H:%M')"
fi

git commit -q -m "$MESSAGGIO"
ok "Modifiche salvate: $MESSAGGIO"

printf '\n  File aggiornati in questa pubblicazione:\n'
git show --stat --oneline HEAD | tail -n +2 | sed 's/^/      /'

# --- 7. pubblica --------------------------------------------------
riga
info "Invio a GitHub…"

USCITA="$(git push -u origin "$RAMO" 2>&1)"
STATO=$?
printf '%s\n' "$USCITA" | sed 's/^/      /'

if [ "$STATO" -eq 0 ]; then
  riga
  ok "Fatto. Il libretto è su GitHub."

  INDIRIZZO="$(git remote get-url origin)"
  UTENTE_REPO="$(printf '%s' "$INDIRIZZO" | sed -E 's#(git@github.com:|https://github.com/)##; s#\.git$##')"
  UTENTE="${UTENTE_REPO%%/*}"
  REPO="${UTENTE_REPO##*/}"

  printf '\n  Repository:  https://github.com/%s\n' "$UTENTE_REPO"
  printf '  Pagina web:  https://%s.github.io/%s/\n' "$UTENTE" "$REPO"
  info "(la pagina web funziona dopo aver attivato Settings → Pages)"
  fine 0
else
  riga
  errore "GitHub ha rifiutato l'invio."
  info "Di solito succede per uno di questi motivi:"
  info "  · le credenziali: serve un token al posto della password"
  info "  · qualcuno ha modificato il repository da un'altra parte"
  info "    in quel caso prova prima:  git pull --rebase origin $RAMO"
  fine 1
fi
