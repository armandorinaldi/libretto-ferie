# Libretto Ferie

Un calendario in una sola pagina per tenere il conto di ferie, ROL e chiusure aziendali, con il saldo residuo calcolato a partire dall'ultima busta paga.

Nessun server, nessun account: è un unico file HTML e i dati restano nel browser di chi lo usa.

## Come funziona

Nelle **impostazioni** si inseriscono il saldo ferie e ROL riportati dall'ultima busta paga e il mese a cui si riferiscono. Da lì in poi il libretto aggiunge da solo la maturazione mensile, mese dopo mese, e sottrae quello che si segna sul calendario.

Sul calendario si sceglie un tipo di assenza e si toccano i giorni — o si trascina per selezionarne diversi di fila:

| Tipo | Scala da |
|---|---|
| Ferie intera | 1 giorno di ferie |
| Mezza giornata | 4 ore di ROL (valore modificabile nelle impostazioni) |
| ROL (ore) | le ore indicate |
| Chiusura aziendale | 1 giorno di ferie |

Weekend e festività non sono selezionabili. Le festività italiane sono calcolate in automatico, Pasqua e Pasquetta comprese.

## Uso

Apri `index.html` in un browser, oppure pubblicalo con GitHub Pages.

## Dati

I movimenti e le impostazioni sono salvati in `localStorage`, quindi restano sul dispositivo e sul browser in cui li hai inseriti: non vengono inviati da nessuna parte e non si sincronizzano tra dispositivi. Svuotare i dati del sito li cancella.

## Licenza

MIT
