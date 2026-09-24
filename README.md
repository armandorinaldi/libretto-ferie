# Libretto Ferie

Calendario personale per tenere il conto di **ferie, ROL, chiusure aziendali e permessi retribuiti**.

Una pagina sola, nessun account, nessun server: i dati restano nel browser di chi la usa.

![Licenza](https://img.shields.io/badge/licenza-MIT-blue)

## Cosa fa

- **Calendario mensile** con le festività italiane calcolate automaticamente, Pasqua e Pasquetta comprese, e San Francesco dal 2026 (Legge 151/2025)
- **Quattro tipi di assenza**: ferie, ROL a ore, chiusura aziendale (che scala dalle ferie) e permessi retribuiti che non scalano nulla — donazione sangue, Legge 104, lutto, congedo matrimoniale, assemblea sindacale
- **Saldi sempre aggiornati**: parti dal saldo dell'ultima busta paga e il libretto somma da solo la maturazione mensile
- **Totale a disposizione** in giorni, con i ROL convertiti secondo la durata della tua giornata lavorativa
- **Proiezione al 31 dicembre**, che tiene conto di quello che hai già messo a calendario
- **Avvisi di sforamento** quando pianifichi più di quanto hai maturato
- **Vista annuale** a dodici mini-mesi per decidere dove piazzare le vacanze
- **Copia di sicurezza** in JSON, con importazione che unisce o sostituisce
- **Tema chiaro e scuro**
- **Compleanni** con messaggio di auguri sulle date che ti interessano

## Come si usa

Tocca un giorno per segnarlo, trascina su più giorni per segnarli tutti insieme. Tieni premuto su un giorno già segnato per eliminarlo al volo. Dopo ogni azione hai qualche secondo per annullare.

Prima di cominciare, apri **Impostazioni** e inserisci il saldo dell'ultima busta paga, il mese a cui si riferisce e quanto maturi ogni mese. Da lì in poi il conto va avanti da solo.

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
./pubblica.command "aggiunto il compleanno di Marco"
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

Questo ha una conseguenza da tenere a mente: **ogni indirizzo è un libretto diverso**. La copia aperta da GitHub Pages e quella aperta dal tuo disco non si parlano, e svuotare i dati del browser cancella tutto.

Per spostare i dati o metterli al sicuro usa **Impostazioni → Copia di sicurezza**: copi il testo JSON, lo salvi in un file, e lo reimporti dove vuoi. Un indicatore ti avvisa quando ci sono modifiche non ancora salvate in una copia.

## Personalizzare i compleanni

Le date sono nel codice, dentro `index.html`. Cerca `const COMPLEANNI` e modifica l'elenco:

```js
const COMPLEANNI = {
  '02-03': 'Antonio',
  '04-07': 'Armando'
};
```

Il formato è `'MM-GG': 'Nome'`. Le date valgono per tutti gli anni.

## Personalizzare le festività

Le festività nazionali sono in `const FIXED_HOLIDAYS`, nello stesso file. Se il tuo comune ha un patrono, aggiungilo lì con lo stesso formato.

## Tecnologia

HTML, CSS e JavaScript scritti a mano, in un unico file. Nessuna dipendenza, nessun passaggio di build. L'unica risorsa esterna è il font Plus Jakarta Sans da Google Fonts, e senza rete la pagina ripiega sul font di sistema senza rompersi.

Compatibile con i browser recenti, pensato prima per il telefono.

## Licenza

MIT — vedi [LICENSE](LICENSE).
