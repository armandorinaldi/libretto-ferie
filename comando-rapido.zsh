# ---------------------------------------------------------------
#  Libretto Ferie — comando rapido "pubblica"
#
#  Installazione: incolla questo blocco in fondo a ~/.zshrc
#  poi apri un terminale nuovo (oppure:  source ~/.zshrc)
#
#  Uso:
#    pubblica                        salva e pubblica, con data e ora
#    pubblica "cosa ho cambiato"     salva con la tua descrizione
#    pubblica -s                     mostra solo cosa è cambiato
#
#  Funziona da qualsiasi cartella: se sei dentro un repository usa
#  quello, altrimenti va sul libretto indicato qui sotto.
# ---------------------------------------------------------------

# Cartella del libretto — cambia questo percorso se la sposti
export LIBRETTO_DIR="$HOME/Downloads/libretto-ferie"

pubblica() {
  emulate -L bash 2>/dev/null

  local RAMO="main" CARTELLA MESSAGGIO USCITA STATO NUOVO DAINVIARE

  # in quale cartella lavoro?
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    CARTELLA="$(git rev-parse --show-toplevel)"
  elif [ -d "$LIBRETTO_DIR/.git" ]; then
    CARTELLA="$LIBRETTO_DIR"
  else
    printf '  STOP Non trovo nessun repository.\n'
    printf '       Entra nella cartella del progetto, oppure correggi\n'
    printf '       LIBRETTO_DIR dentro ~/.zshrc (ora punta a %s)\n' "$LIBRETTO_DIR"
    return 1
  fi

  ( # sottoshell: non ti sposta dalla cartella in cui sei
    cd "$CARTELLA" || return 1
    printf '  ·    %s\n' "$(basename "$CARTELLA")"

    # solo un'occhiata, senza pubblicare
    if [ "${1:-}" = "-s" ] || [ "${1:-}" = "--stato" ]; then
      if [ -z "$(git status --porcelain)" ]; then
        printf '  OK   Niente da pubblicare.\n'
      else
        printf '       File modificati:\n'
        git status --short | sed 's/^/         /'
      fi
      return 0
    fi

    # sai chi sono?
    if [ -z "$(git config user.name)" ] || [ -z "$(git config user.email)" ]; then
      printf '  STOP Git non sa ancora chi sei. Una volta sola:\n'
      printf '         git config --global user.name "Paolo Vastarella"\n'
      printf '         git config --global user.email "tua@email.it"\n'
      return 1
    fi

    git add -A
    NUOVO=0

    if ! git diff --cached --quiet 2>/dev/null; then
      if [ -n "${1:-}" ]; then
        MESSAGGIO="$1"
      else
        MESSAGGIO="Aggiornamento del $(date '+%d/%m/%Y alle %H:%M')"
      fi
      git commit -q -m "$MESSAGGIO" || return 1
      NUOVO=1
      printf '  OK   %s\n' "$MESSAGGIO"
      git show --stat --oneline HEAD | tail -n +2 | sed 's/^/         /'
    fi

    # ci sono salvataggi mai arrivati su GitHub? (es. un invio fallito prima)
    DAINVIARE="$(git rev-list --count "origin/$RAMO..HEAD" 2>/dev/null || printf '1')"

    if [ "$NUOVO" -eq 0 ] && [ "$DAINVIARE" = "0" ]; then
      printf '  OK   Niente da pubblicare: è già tutto aggiornato.\n'
      return 0
    fi

    if [ "$NUOVO" -eq 0 ]; then
      printf '       %s %s da inviare, rimasti indietro.\n' "$DAINVIARE" \
        "$( [ "$DAINVIARE" = "1" ] && printf 'salvataggio' || printf 'salvataggi' )"
    fi

    USCITA="$(git push -u origin "$RAMO" 2>&1)"
    STATO=$?

    if [ "$STATO" -eq 0 ]; then
      local INDIRIZZO UTENTE_REPO UTENTE REPO
      INDIRIZZO="$(git remote get-url origin 2>/dev/null)"
      UTENTE_REPO="$(printf '%s' "$INDIRIZZO" | sed -E 's#(git@github.com:|https://github.com/)##; s#\.git$##')"
      UTENTE="${UTENTE_REPO%%/*}"
      REPO="${UTENTE_REPO##*/}"
      printf '  OK   Pubblicato.\n'
      printf '       https://%s.github.io/%s/\n' "$UTENTE" "$REPO"
    else
      printf '  STOP GitHub ha rifiutato l'"'"'invio:\n'
      printf '%s\n' "$USCITA" | sed 's/^/         /'
      printf '       Se qualcuno ha modificato il repository altrove:\n'
      printf '         git pull --rebase origin %s\n' "$RAMO"
      return 1
    fi
  )
}
