# E-RecruitingWS1920

## Gruppenmitglieder: 
* Anika Berghahn 
* Christina Koerfers 
* Pia Nolte  

## Forschungsfrage: 
_Wie wird Online-Recruiting wahrgenommen und welche Personengruppen nutzen dieses Bewerbungsverfahren?_ 

# Unterschiedshypothesen:

1. Hypothese: Online-Recruiting wird positiv wahrgenommen.
* Verfahren: einfacher t-Test 
 * t.test(datensatz$ORAW, mu=3,5)
* H0: Die Wahrnehmung von Online-Recruiting liegt bei mu=3,5 (OR wird neutral gesehen)
*	H1: Online-Recruiting wird nicht neutral wahrgenommen.
* Feedback: Super!! Bitte aufpassen wegen 1 bis 6 vs. 0 bis 5. 

2. Hypothese: Studierende nutzen Online-Recruiting eher als Rentner.
* Verfahren: unverbundener t-Test 
 * t.test(filter(datensatz, activitiy == “Student“)$ORE, filter(datensatz, activity == “Rentner“)$ORE)
 * t.test(datensatz$ORE ~ datensatz$activity) 
* H0: (Nicht-)Nutzung von Online-Recruiting unterscheidet sich nicht zwischen Studierenden und Rentnern.
* H1: Es gibt einen Unterschied in der Nutzung von Online-Recruiting zwischen Studierenden und Rentnern. 
* Feedback: Sieht auch super aus, die zweite Code-Variante funktioniert aber nur, wenn es nur exakt zwei Ausprägungen von activity gibt. 

3. Hypothese: Wer schon einmal OR genutzt hat, legt Wert auf die Interaktion zwischen Bewerber und Unternehmen.
*	Verfahren: one-way ANOVA
 *	anova(datensatz, dep=“ORRPI“, factors= c(“ore1“))
*	H0: Die persönlichen Erfahrungen mit OR beeinflussen die Bewertung der Interaktion im Bewerbungsprozess nicht.
*	H1: Die persönlichen Erfahrungen mit OR beeinflussen die Bewertung der Interaktion im Bewerbungsprozess.
* Feedback: I see what you did there... ore1 hat drei Ausprägungen: Ja, Nein und weiß nicht. Insofern haben Sie drei Gruppen und Anova ist eigentlich korrekt. Ich empfehle ihen trotzdem, die "weiß nichts" rauszunehmen und einen T-Test zu nehmen. Real gehören die "weiß nichts" nämlich in eine der anderen Gruppen.

4.	Hypothese: Frauen mit einem höheren Bildungsabschluss nehmen OR als sicherer, günstiger und schneller im Vergleicht zu traditionellen Bewerbungsverfahren wahr. 
*	Verfahren:  zweifaktorielle MANOVA
 *	mancova(datensatz, deps = c(“ORRPS“, “ORRPK“, “ORRPZ“), factors = c(“gender“, “education“))
*	H0: Die Wahrnehmung von Sicherheit, Kostenfaktoren und zeitliche Faktoren bezüglich OR sind unabhängig von Geschlecht und Schulabschluss.
*	H1: Die Wahrnehmung von Sicherheit, Kostenfaktoren und zeitliche Faktoren bezüglich OR sind abhängig von Geschlecht und Schulabschluss.
* Feedback: Wunderbar! :-)

5.	Hypothese: Junge Frauen nehmen OR als praktisch und effizient und einfach (für jeden) zugänglich wahr. 
*	Verfahren: einfaktorielle MANCOVA
 *	mancova(datensatz, deps=c(“ORRPPE“, “ORRPZG“), factors = c(gender), covs=c(“age“))
*	H0: Geschlecht und Alter wirken sich nicht auf die Wahrnehmung von Praktikabilität/Effizienz und die Zielgruppenerschließung bezüglich OR aus. 
*	H1: Geschlecht und Alter wirken sich auf die Wahrnehmung von Praktikabilität/Effizienz und die Zielgruppenerschließung bezüglich OR aus. 
* Feedback: Sehr mutig und weitestgehend korrekt, aber nicht ganz ;-) Der Schönheitsfehler: Die Covariate ist eigentlich dazu da, einen vorhandenen Einfluss zu kontrollieren. Also die korrekte Hypothese zu ihrer MANCOVA ist: "Frauen nehmen - bei kontrolliertem Alterseinfluss - OR als praktisch und effizient und einfach (für jeden) zugänglich wahr.". Die korrekte Methode zu ihrer Hypothese wäre zweifaktorielle MANOVA, mit gender und (noch zu bildenden) Altersgruppen als Faktoren, z.B. alt und jung. Googlen Sie mal Mediansplit. 

# Zusammenhangshypothesen

1. Hypothese: Das Alter hängt mit der Wahrnehmung von OR zusammen. (Korrelation)

2. Hypothese: Je älter man ist, desto negativer ist die Wahrnehmung von OR. (LR)

3. Hypothese: Negative Wahrnehmung von OR hängt zusammen mit schlechterer Bewertung von zeitlichen Faktoren. (Korrelation)

4. Hypothese: Je höher der KUT, desto praktischer/effizienter wird OR wahrgenommen. (LR)

5. Hypothese: Es gibt einen Zusammenhang zwischen KUT und allgemeiner Wahrnehmung. (Korrelation)

# Zu replizierendes Ergebnis: 
_Wahrnehmung_: 
* überwiegend positiv bei einer jungen, gut gebildeten Personengruppe
* kritisch bei älteren Personengruppen 

_Nutzung_: 
* eher jüngere Generation 

_eigener Akzent (zusätzlich, nicht im Fokus)_:
* Ob es in gewissen Branchen überhaupt E-Recruiting gibt? Besteht dort überhaupt Interesse und Bedarf? 

# _Neuere Version_:

![Faktorenraum](Images/FaktorenraumE-Recruiting2.png)

# _Ältere Version_:

![Faktorenraum](FaktorenraumE-Recruiting.png) 



