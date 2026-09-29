# Pianificazione Ferie

Calendario personale per tenere il conto di **ferie, ROL, chiusure aziendali e permessi retribuiti**.

Una pagina sola, nessun account, nessun server: i dati restano nel browser di chi la usa.

![Versione](https://img.shields.io/badge/versione-2.15-0F172A) ![Licenza](https://img.shields.io/badge/licenza-MIT-blue)

## Cosa fa

- **Calendario mensile** con le festività italiane calcolate automaticamente, Pasqua e Pasquetta comprese, e San Francesco dal 2026 (Legge 151/2025)
- **Quattro tipi di assenza**, ognuno con il suo colore e il suo timbro:
  - **Ferie** (azzurro chiaro)
  - **ROL** a ore (viola scuro)
  - **Chiusura aziendale** (azzurro a righe), che scala dalle ferie
  - **Permesso retribuito** (grigio, solo contorno), che non scala nulla: donazione sangue, Legge 104, lutto, congedo matrimoniale, assemblea sindacale, visita medica
- **Saldi sempre aggiornati**: parti dal saldo dell'ultima busta paga, anche negativo, e la pianificazione somma da sola la maturazione mensile
- **Riepilogo del mese**: una cifra principale con i giorni disponibili (ROL convertiti secondo la tua giornata lavorativa), barre che mostrano quanto resta di ferie e ROL, e la voce "Come è calcolato"
- **Al 31 dicembre**: il saldo previsto a fine anno, che tiene conto di quello che hai già messo a calendario
- **Avvisi a due livelli**: arancione quando ferie o ROL vanno sotto zero ma l'altro saldo li copre, rosso quando non basta nemmeno il totale. Se la busta paga parte in negativo, ti dice in quanti mesi torni in pari
- **Esportazione in PDF** dei permessi di un periodo (mese, anno, anno scorso o dalla busta paga), con i totali e il saldo residuo alla data finale
- **Vista annuale** a dodici mini-mesi per decidere dove piazzare le vacanze
- **Copia di sicurezza** scaricabile come file, con ripristino da file o da testo incollato
- **Tema chiaro e scuro**
- **Compleanni** con messaggio di auguri sulle date che ti interessano

## Come si usa

Tocca un giorno per segnarlo o modificarlo, trascina su più giorni per segnarli tutti insieme (weekend e festivi vengono saltati). Tieni premuto su un giorno già segnato per eliminarlo al volo. Dopo ogni azione hai qualche secondo per annullare.

Prima di cominciare, apri **Impostazioni**. Si apre una finestra con tre sezioni:

| Sezione | Cosa inserire |
| --- | --- |
| **Busta paga** | Saldo ferie (gg), saldo ROL (ore) e il mese a cui si riferisce |
| **Maturazione** | Quanti giorni di ferie e quante ore di ROL maturi ogni mese, e le ore di una giornata lavorativa |
| **Copia di sicurezza** | Scarica una copia o ripristinane una |

Salva si attiva solo quando hai cambiato qualcosa; se chiudi con modifiche non salvate ti chiede conferma, e dopo il salvataggio puoi annullare. Da lì in poi il conto va avanti da solo.

## Pubblicarlo online

Il file è autonomo: non c'è niente da compilare né da installare.

1. Carica questi file in un repository su GitHub
2. Vai in **Settings → Pages**
3. Alla voce *Source* scegli **Deploy from a branch**, poi il ramo `main` e la cartella `/ (root)`
4. Dopo un minuto la pagina è online all'indirizzo `https://<tuo-utente>.github.io/<nome-repo>/`

Funziona anche senza pubblicarlo: scarica `index.html` e aprilo con un doppio clic.

### Aggiornarlo dopo una modifica

Nella cartella c'è `pubblica.command`. **Doppio clic** e fa tutto: salva le modifiche e le manda su GitHub.

La prima volta chiede nome, email e l'indirizzo del repository, poi non lo chiede più. Se hai la riga di comando `gh` di GitHub già configurata, si offre di creare il repository al posto tuo.

Da terminale puoi anche dargli una descrizione di cosa hai cambiato:

```bash
./pubblica.command "v2.15 - impostazioni allineate"
```

Senza descrizione usa data e ora. Se non è cambiato niente te lo dice e si ferma.

### Il comando rapido `pubblica`

In alternativa al doppio clic, `comando-rapido.zsh` definisce un comando che funziona **da qualsiasi cartella**. Incolla il contenuto del file in fondo a `~/.zshrc`, apri un terminale nuovo, e da lì in poi:

```bash
pubblica                       # salva e pubblica
pubblica "sistemato il ROL"    # con la tua descrizione
pubblica -s                    # mostra solo cosa è cambiato
```

Se lo lanci dentro un repository pubblica quello; altrimenti usa la cartella indicata da `LIBRETTO_DIR`, che trovi in cima al file e puoi cambiare se sposti il progetto. Non ti sposta mai dalla cartella in cui sei.

## I tuoi dati

Tutto resta nel browser che usi, in locale. Non c'è nessun server, nessun account e niente lascia il tuo dispositivo.

Questo ha una conseguenza da tenere a mente: **ogni indirizzo è una pianificazione diversa**. La copia aperta da GitHub Pages e quella aperta dal tuo disco non si parlano, e svuotare i dati del browser cancella tutto.

Per spostare i dati o metterli al sicuro usa **Impostazioni → Copia di sicurezza**: scarica il file `.json` e conservalo (per esempio su iCloud o Google Drive). Sull'altro dispositivo, o dopo aver perso i dati, lo ripristini da file oppure incollandone il testo, scegliendo se unirlo ai dati attuali o sostituirli.

Un pallino sul pulsante **Impostazioni** ti avvisa quando ci sono modifiche non ancora salvate in una copia. Se apri la pagina e la pianificazione è vuota, ti viene proposto subito il ripristino.

Le chiavi di salvataggio sono rimaste le stesse del vecchio *Libretto Ferie*: aggiornando la pagina non si perde nulla, e i vecchi backup restano importabili.

## Personalizzare i compleanni

Le date sono nel codice, dentro `index.html`. Cerca `const COMPLEANNI` e modifica l'elenco:

```js
const COMPLEANNI = {
  '03-14': 'Marco',
  '09-02': 'Giulia'
};
```

Il formato è `'MM-GG': 'Nome'`. Le date valgono per tutti gli anni. Attenzione: se il repository è pubblico, questi nomi li vede chiunque apra il codice.

## Personalizzare le festività

Le festività nazionali sono in `const FIXED_HOLIDAYS`, nello stesso file. Se il tuo comune ha un patrono, aggiungilo lì con lo stesso formato.

## Versioni

Il numero di versione è in fondo alla pagina e dentro ogni copia di sicurezza. Sale di 0.01 a ogni modifica pubblicata. La cronologia è in [CHANGELOG.md](CHANGELOG.md).

## Tecnologia

HTML, CSS e JavaScript scritti a mano, in un unico file. Nessun passaggio di build. Le risorse esterne sono due:

- il font Plus Jakarta Sans da Google Fonts: senza rete la pagina ripiega sul font di sistema senza rompersi;
- la libreria jsPDF, caricata solo quando scarichi un PDF: senza rete il PDF non si genera, tutto il resto funziona.

Compatibile con i browser recenti, pensato prima per il telefono.

## Licenza

MIT — vedi [LICENSE](LICENSE).
