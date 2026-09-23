# SpacePeng! APK

This APK is a build of SpacePeng!, an open-source Android game by Frank Gerbig, released under the GNU General Public License v3.0 (GPLv3).

**Original source code**:
https://gitlab.com/fgerbig/SpacePeng

The APK is provided for educational purposes, in particular for demonstrating Android application reverse engineering techniques.

License: GNU GPLv3.
Copyright © 2015, 2017 Frank Gerbig.



## Utilizzo di SpacePeng! nel presente manuale

**SpacePeng!** è un'applicazione open source sviluppata da **Frank Gerbig**. Il progetto dichiara di essere distribuito secondo i termini della **GNU General Public License version 3 (GPLv3)**.

Repository del progetto:

https://gitlab.com/fgerbig/SpacePeng

Copyright dichiarato dal progetto:

> Copyright 2015, 2017 by Frank Gerbig

Licenza:

> GNU General Public License v3 (GPLv3)

Nel presente manuale SpacePeng! viene utilizzato come **caso di studio didattico** per illustrare tecniche di analisi e reverse engineering di applicazioni Android.

L'utilizzo didattico comprende, ad esempio:

- analisi della struttura dell'APK;
- analisi del bytecode e del codice decompilato;
- analisi delle classi e dei metodi;
- analisi del comportamento dell'applicazione;
- utilizzo di strumenti di reverse engineering;
- modifica dell'applicazione a scopo di laboratorio;
- riproduzione degli esercizi in un ambiente controllato;
- discussione di tecniche di analisi statica e dinamica.

La GPLv3 è una licenza **copyleft** per software libero. La Free Software Foundation identifica quattro libertà fondamentali: utilizzare il software per qualsiasi scopo, studiarlo, modificarlo e condividere copie e modifiche.

## Cosa permette la GPLv3

Per il caso di studio presentato in questo manuale, sono particolarmente rilevanti le seguenti possibilità.

### 1. Utilizzare il software

La GPLv3 permette di utilizzare il programma per qualsiasi scopo, compresi scopi didattici e di ricerca.

Pertanto SpacePeng! può essere utilizzato come applicazione di laboratorio per esercitazioni di Android reverse engineering.

### 2. Studiare il funzionamento del software

La GPLv3 tutela la libertà di studiare il programma e di analizzarne il funzionamento.

Questo rende appropriato utilizzare SpacePeng! per:

- esaminare il codice;
- osservare il comportamento dell'app;
- analizzare le classi;
- effettuare decompilazione e disassemblaggio nell'ambito dello studio del programma;
- utilizzare strumenti quali JADX, apktool, Frida, Ghidra o strumenti analoghi per finalità didattiche.

La GPLv3 non vieta il reverse engineering del programma distribuito sotto la licenza; al contrario, la libertà di studiare e modificare il software è una delle finalità fondamentali della licenza.

### 3. Modificare il software

La GPLv3 permette di modificare il programma.

Di conseguenza, in un laboratorio didattico è possibile, ad esempio:

- modificare il codice;
- modificare il comportamento dell'applicazione;
- ricompilare il progetto;
- creare una versione modificata per un esercizio;
- analizzare le differenze tra la versione originale e quella modificata.

Se una versione modificata viene successivamente distribuita, entrano in gioco gli obblighi della GPLv3 relativi alle opere modificate.

### 4. Ridistribuire il software

La GPLv3 permette di distribuire copie del programma, anche a pagamento.

Questo significa che la distribuzione di SpacePeng! non è limitata al solo uso personale o non commerciale.

Tuttavia, la redistribuzione deve rispettare le condizioni previste dalla GPLv3, tra cui la conservazione degli avvisi di copyright e della licenza e, quando si distribuisce una forma eseguibile/object code, la disponibilità del relativo **Corresponding Source** secondo le modalità previste dalla licenza.

## Redistribuzione dell'APK

L'APK Android costituisce una forma di **object code** del programma.

La GPLv3 consente la distribuzione dell'object code, ma richiede che sia disponibile anche il **Corresponding Source**, cioè il codice sorgente necessario per generare, installare, eseguire e modificare quella versione del programma, nei termini definiti dalla licenza.

Per una distribuzione tramite Internet, la GPLv3 prevede una modalità particolarmente utile per questo caso: è possibile offrire l'object code da un determinato luogo e fornire un accesso equivalente al Corresponding Source, anche attraverso un server diverso, purché siano fornite indicazioni chiare su dove reperire il sorgente e tale disponibilità sia mantenuta per il periodo necessario a soddisfare gli obblighi della licenza.

### Esempio di distribuzione utilizzata per il laboratorio

L'APK utilizzato negli esercizi può essere pubblicato in un repository GitHub dedicato al materiale didattico, indicando chiaramente:

- il nome del software;
- il copyright dell'autore;
- la licenza GPLv3;
- la versione dell'APK;
- il repository contenente il codice sorgente corrispondente;
- l'eventuale relazione tra la versione dell'APK e il commit/tag del repository originale.

Esempio:

```text
SpacePeng! APK
Copyright 2015, 2017 Frank Gerbig
Licensed under the GNU General Public License v3.0 (GPLv3)

Original source code:
https://gitlab.com/fgerbig/SpacePeng
```

**Importante:** il semplice collegamento alla pagina principale del progetto è appropriato solo se quel repository contiene effettivamente il **Corresponding Source della specifica versione dell'APK distribuita**. Prima della pubblicazione è quindi opportuno verificare la corrispondenza tra APK, versione/tag/commit e sorgenti.

## Utilizzo in un libro commerciale

La GPLv3 non vieta la vendita del software o la pubblicazione di materiale che lo accompagna.

Pertanto il fatto che il presente manuale sia commercializzato non impedisce, di per sé, l'utilizzo di SpacePeng! come caso di studio né la distribuzione dell'APK secondo i termini della GPLv3.

È tuttavia importante distinguere:

1. **il manuale**, che è un'opera separata;
2. **il codice di SpacePeng!**, che è soggetto alla GPLv3;
3. **eventuali immagini, audio, font, librerie o altri componenti di terze parti**, che potrebbero avere licenze differenti.

La GPLv3 del progetto non implica automaticamente che ogni singolo elemento contenuto nell'APK sia soggetto alla stessa licenza. Per questo motivo, prima di redistribuire l'APK, è opportuno verificare le licenze degli eventuali componenti di terze parti.

## Utilizzo di codice nel manuale

Nel manuale possono essere mostrati estratti di codice necessari a spiegare le tecniche di reverse engineering.

Quando vengono riprodotti estratti del codice di SpacePeng!, è buona pratica:

- indicare chiaramente che il codice proviene da SpacePeng!;
- attribuire il copyright a Frank Gerbig;
- indicare la GPLv3;
- fornire il riferimento al repository originale;
- utilizzare solamente gli estratti necessari alla spiegazione tecnica.

Esempio di attribuzione:

```text
The following code is derived from SpacePeng!
by Frank Gerbig and is licensed under the GNU GPLv3.

Source:
https://gitlab.com/fgerbig/SpacePeng
```

## Modifiche e distribuzione di versioni modificate

Se il materiale didattico include una versione modificata di SpacePeng! che viene distribuita come software, la GPLv3 impone ulteriori condizioni.

In particolare, devono essere mantenuti gli avvisi di copyright e licenza e devono essere indicate le modifiche apportate. Le versioni modificate distribuite come opere coperte dalla GPLv3 devono essere rese disponibili secondo i termini della licenza.

Per un laboratorio di reverse engineering è quindi preferibile distinguere chiaramente:

- **APK originale**: versione originale dell'autore;
- **APK modificato per il laboratorio**: versione modificata dall'autore del manuale, con indicazione esplicita delle modifiche e rispetto degli obblighi GPLv3.

## Cosa NON significa la GPLv3

La GPLv3 non significa che:

- il software sia privo di copyright;
- sia possibile rimuovere il nome dell'autore;
- sia possibile presentare SpacePeng! come software sviluppato dall'autore del manuale;
- ogni elemento grafico o multimediale dell'app sia automaticamente GPLv3;
- sia possibile distribuire un APK senza rispettare gli obblighi relativi al Corresponding Source.

La GPLv3 è una licenza che **concede ampie libertà, ma a determinate condizioni**.

## Riepilogo per questo manuale

| Attività | GPLv3 |
|---|---|
| Utilizzare SpacePeng! come esempio didattico | Sì |
| Analizzare il codice | Sì |
| Effettuare reverse engineering a scopo di studio | Sì |
| Decompilare/disassemblare il programma per analizzarlo | Sì |
| Mostrare il funzionamento delle tecniche di reverse engineering | Sì |
| Modificare il programma | Sì |
| Pubblicare estratti di codice nel contesto della spiegazione | In linea generale sì, nel rispetto della licenza |
| Distribuire l'APK | Sì, nel rispetto della GPLv3 |
| Distribuire l'APK da GitHub | Sì, nel rispetto degli obblighi di distribuzione |
| Indicare il repository originale come sorgente | Sì, se contiene il Corresponding Source della versione distribuita |
| Vendere un libro che contiene il caso di studio | Sì, la GPLv3 non vieta la commercializzazione |
| Presentare SpacePeng! come software proprio | No |
| Rimuovere copyright/licenza | No |
| Ignorare le licenze di eventuali componenti di terze parti | No |

## Riferimenti ufficiali

- GNU General Public License v3:
  https://www.gnu.org/licenses/gpl-3.0.html

- GNU — A Quick Guide to GPLv3:
  https://www.gnu.org/licenses/quick-guide-gplv3.html

- GNU GPLv3 — testo e condizioni di distribuzione:
  https://www.gnu.org/licenses/gpl-3.0.html

- SpacePeng! — repository originale:
  https://gitlab.com/fgerbig/SpacePeng

> **Nota:** questa sezione è una sintesi informativa della GPLv3 e non costituisce consulenza legale. Per la redistribuzione commerciale dell'APK è opportuno verificare la licenza della specifica versione utilizzata e le licenze dei componenti di terze parti eventualmente inclusi nell'APK.
