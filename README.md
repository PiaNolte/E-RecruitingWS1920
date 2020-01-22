# E-RecruitingWS1920

## Gruppenmitglieder: 
* Anika Berghahn 
* Christina Koerfers 
* Pia Nolte  

## Forschungsfrage: 
_Wie wird Online-Recruiting (OR) von unterschiedlichen Altersgrupen wahrgenommen und welche Faktoren beeinflussen diese Wahrnehmung?_ 

# Zu replizierendes Ergebnis: 
_Fokus auf Wahrnehmung_: 
* überwiegend positiv bei einer jungen, gut gebildeten Personengruppe
* kritisch bei älteren Personengruppen 
* wird durch einzelne Faktoren beeinflusst

# Kernaussagen des Referenzpapers:
* OR wird von Arbeitnehmern gut angenommen (48% der Befragten bewerten OR positiv)
* Aber: Der Prozess ist unpersönlich
* Faktoren, die die Wahrnehmung beeinflussen: Praktikablität, Effizienz, Sicherheit, Interaktion, Zielgruppenerschließung etc.
* Nutzerprofil: weiblich, Millennial, Bacherloabschluss


# Unterschiedshypothesen:

1. Hypothese: Online-Recruiting wird positiv wahrgenommen.
* Verfahren: einfacher t-Test 
 * t.test(datensatz$ORAW, mu=3,5)
* H0: Die Wahrnehmung von Online-Recruiting liegt bei mu=3,5 (OR wird neutral gesehen)
*	H1: Online-Recruiting wird nicht neutral wahrgenommen.


2. Hypothese: Studierende nutzen Online-Recruiting eher als Rentner.
* Verfahren: unverbundener t-Test 
 * t.test(filter(datensatz, activitiy == “Student“)$ORE, filter(datensatz, activity == “Rentner“)$ORE)
 * t.test(datensatz$ORE ~ datensatz$activity) 
* H0: (Nicht-)Nutzung von Online-Recruiting unterscheidet sich nicht zwischen Studierenden und Rentnern.
* H1: Es gibt einen Unterschied in der Nutzung von Online-Recruiting zwischen Studierenden und Rentnern. 


3. Hypothese: Wer schon einmal OR genutzt hat, legt Wert auf die Interaktion zwischen Bewerber und Unternehmen.
*	Verfahren: one-way ANOVA
 *	anova(datensatz, dep=“ORRPI“, factors= c(“ore1“))
*	H0: Die persönlichen Erfahrungen mit OR beeinflussen die Bewertung der Interaktion im Bewerbungsprozess nicht.
*	H1: Die persönlichen Erfahrungen mit OR beeinflussen die Bewertung der Interaktion im Bewerbungsprozess.


4.	Hypothese: Frauen mit einem höheren Bildungsabschluss nehmen OR als sicherer, günstiger und schneller im Vergleicht zu traditionellen Bewerbungsverfahren wahr. 
*	Verfahren:  zweifaktorielle MANOVA
 *	mancova(datensatz, deps = c(“ORRPS“, “ORRPK“, “ORRPZ“), factors = c(“gender“, “education“))
*	H0: Die Wahrnehmung von Sicherheit, Kostenfaktoren und zeitliche Faktoren bezüglich OR sind unabhängig von Geschlecht und Schulabschluss.
*	H1: Die Wahrnehmung von Sicherheit, Kostenfaktoren und zeitliche Faktoren bezüglich OR sind abhängig von Geschlecht und Schulabschluss.


5.	Hypothese: Junge Frauen nehmen OR als praktisch und effizient und einfach (für jeden) zugänglich wahr. 
*	Verfahren: einfaktorielle MANCOVA
 *	mancova(datensatz, deps=c(“ORRPPE“, “ORRPZG“), factors = c(gender), covs=c(“age“))
*	H0: Geschlecht und Alter wirken sich nicht auf die Wahrnehmung von Praktikabilität/Effizienz und die Zielgruppenerschließung bezüglich OR aus. 
*	H1: Geschlecht und Alter wirken sich auf die Wahrnehmung von Praktikabilität/Effizienz und die Zielgruppenerschließung bezüglich OR aus. 


# Zusammenhangshypothesen

1. Hypothese: Das Alter hängt mit der Wahrnehmung von OR zusammen. (Korrelation)

2. Hypothese: Je älter man ist, desto negativer ist die Wahrnehmung von OR. (LR)

3. Hypothese: Negative Wahrnehmung von OR hängt zusammen mit schlechterer Bewertung von zeitlichen Faktoren. (Korrelation)

4. Hypothese: Je höher der KUT, desto praktischer/effizienter wird OR wahrgenommen. (LR)

5. Hypothese: Es gibt einen Zusammenhang zwischen KUT und allgemeiner Wahrnehmung. (Korrelation)



# _Faktorenraum_:

![Faktorenraum](Images/FaktorenraumE-Recruiting2.png)



