# Cronologia delle versioni

Dalla 2.01 l'app si chiama **Pianificazione Ferie** e il numero di versione compare in fondo alla pagina e in ogni copia di sicurezza. Sale di 0.01 a ogni modifica pubblicata. Le versioni precedenti (V1–VRawit, *Libretto Ferie*) sono in fondo.

## 2.18 — versione telefono più compatta · 30/09/2026

Su telefono il calendario compare già nella prima schermata.

- Testata compatta: titolo più piccolo, tema e Impostazioni come icone da 44px.
- Riepilogo richiudibile: totale, ferie e ROL affiancati con le barre, e la riga "Al 31 dicembre" (arancione o rossa se sfori). "Dettagli" apre il riepilogo completo, "Meno" lo richiude. Gli avvisi di sforamento restano sempre visibili.
- Legenda su una riga scorrevole e suggerimento d'uso più breve.
- Su tutti gli schermi: i Movimenti del mese si aprono e chiudono con la freccia, con il numero dei movimenti accanto al titolo e un riassunto quando sono chiusi. La scelta viene ricordata. Ogni movimento ha il nome sopra e il dettaglio in grigio sotto.

## 2.17 — via i compleanni · 30/09/2026

Tolti torta, messaggio di auguri ed elenco dei nomi: non avevano effetto sui saldi, affollavano le celle e, con la repository pubblica, rendevano visibili i nomi a chiunque. Il calendario mostra solo ciò che conta per ferie e permessi.

## 2.16 — credits · 29/09/2026

In fondo alla pagina compaiono il nome dell'app, la versione e l'autore: "Pianificazione Ferie v2.16 · realizzata da Paolo V". L'autore è indicato anche nei dati della pagina e nella copia di sicurezza.

## 2.15 — colonne allineate nelle Impostazioni · 29/09/2026

Busta paga e Maturazione usano la stessa griglia: le colonne sono allineate e la terza (Mese / Ore al giorno) è più larga delle prime due.

## 2.14 — Impostazioni più compatte · 29/09/2026

Tre campi per riga. Busta paga: Saldo ferie · Saldo ROL · Mese. Maturazione: Ferie · ROL · Ore al giorno. Etichette più corte, perché l'unità (gg / ore) è scritta dentro il campo. Su telefono il Mese va a capo a tutta larghezza.

## 2.13 — Impostazioni in una finestra · 29/09/2026

Le Impostazioni si aprono in una finestra invece che in un pannello che spingeva giù la pagina; su telefono è un foglio che sale dal basso. Tre sezioni: Busta paga, Maturazione, Copia di sicurezza.

- Salva si attiva solo se c'è qualcosa da salvare; un pallino arancione segna i campi cambiati e in basso si legge lo stato ("2 modifiche da salvare").
- Controlli sui valori: maturazione non negativa, ore della giornata tra 1 e 24, mese obbligatorio. I saldi possono essere negativi.
- Chiudendo con modifiche in sospeso chiede "Chiudere senza salvare?" con Continua / Scarta modifiche.
- Dopo il salvataggio si può annullare dalla pillola in basso.
- Da tastiera il focus resta nella finestra, Esc chiude e il focus torna al pulsante Impostazioni.

## 2.12 — categorie distinguibili per luminosità · 29/09/2026

Barra delle ferie più chiara, perché l'azzurro e il viola dei ROL avevano la stessa luminosità. I pallini nei movimenti, nel pannello del giorno e nel PDF hanno lo stesso aspetto dei timbri.

## 2.11 — nuova palette · 29/09/2026

Ogni colore ha un solo significato. Ferie azzurro chiaro, chiusura azzurro a righe (stessa famiglia: scala dalle ferie), ROL viola scuro, permesso retribuito grigio con solo contorno (non scala nulla), festività rosa tenue. Verde solo per le conferme, arancione per gli avvisi, rosso per gli errori. Comandi in ardesia scura. Colori del PDF allineati.

## 2.10 — avvisi a due livelli · 28/09/2026

Arancione se solo le ferie o solo i ROL vanno sotto zero ma l'altro saldo li copre ("puoi coprirle con i ROL"); rosso solo se non basta nemmeno il totale.

## 2.09 — busta paga in negativo · 28/09/2026

Il saldo di partenza può essere negativo: il riepilogo lo distingue dai giorni pianificati troppo presto e dice in quanti mesi si torna in pari.

## 2.08 — riquadro "Al 31 dicembre" · 28/09/2026

La nota di fine anno sta dentro il riquadro, con icona; se sfori, il riquadro diventa rosso e dice cosa e di quanto. "Come è calcolato" con icona e freccia che si apre.

## 2.06–2.07 — periodo sempre chiaro · 28/09/2026

Pillola "Saldo al 30 settembre 2026" che pulsa quando cambi mese; "Al 31 dicembre" con l'anno.

## 2.05 — nuovo riepilogo · 28/09/2026

Una cifra principale con i giorni disponibili, barre che mostrano quanto resta, riga "Al 31 dicembre" e "Come è calcolato" richiudibile. I movimenti passano sotto il calendario; su telefono il riepilogo sta sopra. "Scarica PDF" diventa il pulsante principale.

## 2.04 — un solo linguaggio per i timbri · 28/09/2026

Stessa forma e misura per tutti: pieno = scala dal saldo, solo contorno = non scala nulla. Niente più scorrimento laterale sui telefoni stretti.

## 2.03 — rifiniture del calendario · 28/09/2026

Timbri sotto il numero del giorno e movimenti del mese meglio allineati.

## 2.01–2.02 — nuovo nome · 28/09/2026

*Libretto Ferie* diventa **Pianificazione Ferie**. Numero di versione in fondo alla pagina e nella copia di sicurezza.

## Esportazione in PDF e copia su file · 28/09/2026

Scarica i permessi di un periodo (questo mese, quest'anno, anno scorso, dalla busta paga o date a scelta), filtrando per tipo. Il PDF ha i totali, il saldo residuo alla data finale e l'elenco raggruppato per mese. La copia di sicurezza si scarica come file `.json`; se la pagina è vuota viene proposto subito il ripristino.

## Icone · 24/09/2026

Favicon e icona per la schermata Home.

---

# Libretto Ferie (prima del cambio di nome)

## VRawit — compleanni

Icona a forma di torta sulle date di compleanno, con messaggio di auguri al passaggio del mouse o al tocco. La torta è un pulsante vero: raggiungibile da tastiera, con etichetta per screen reader, e non apre il pannello del giorno. Compare anche sui weekend e sulle festività, dove il resto del calendario non reagisce. Il compleanno viene ricordato anche nel pannello del giorno.

## V11 — tre migliorie sul pannello

Sottotitolo informativo al posto della domanda retorica: su un giorno vuoto dice a che punto sei nel mese, su uno già segnato dice cosa c'è, su una selezione multipla conferma il conteggio reale escludendo weekend e festivi. Salva a larghezza piena con Annulla in secondo piano. Preset ROL ridotti a 4h e 8h più l'inserimento manuale.

## V10 — ritorno alla lista

Il selettore a ghiera viene scartato e il pannello torna alla lista di quattro voci.

## V9 — ghiera di scelta (scartata)

Selettore circolare a quattro spicchi, ruotabile o toccabile. Abbandonato: la rotazione annulla il vantaggio dei menu radiali ed è un gesto che richiede comunque un'alternativa a tocco singolo.

## V8 — gerarchia nel pannello

Ferie come voce primaria, le altre tre compatte su una riga. Spiegazione visibile solo per la voce scelta invece che su tutte.

## V7 — annullamento e scorciatoie

Annullamento dell'ultima azione con pillola in basso, valido per creazione, modifica ed eliminazione. Mezza giornata fusa dentro ROL con preset di ore. Eliminazione con pressione prolungata sulla cella.

## V6 — tutto parte dalla cella

Eliminata la barra delle modalità. Ogni operazione — creare, leggere, modificare, eliminare — avviene nel pannello che si apre toccando un giorno.

## V5 — permessi retribuiti

Nuova categoria che non scala né ferie né ROL, con il motivo da scegliere. Timbro a goccia per la donazione sangue. Blocco dedicato nel riepilogo, con il conteggio per motivo.

## V4 — proiezione e vista annuale

Proiezione dei saldi al 31 dicembre, che tiene conto di quanto è già pianificato. Vista annuale a dodici mini-mesi.

## V3 — promemoria della copia

Indicatore dello stato del backup basato sulle modifiche, non solo sul tempo trascorso, con segnalazione sul pulsante Impostazioni.

## V2 — copia di sicurezza

Esportazione in JSON e importazione da file o da testo incollato, con riepilogo di conferma e scelta fra unione e sostituzione.

## V1 — base

Correzione del colore di sforamento, chiusure aziendali dichiarate come scalate dalle ferie, avvisi di sforamento, totale complessivo in giorni con durata della giornata lavorativa configurabile.
