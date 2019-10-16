# Wielki algorytm rzucania palenia (prawdopodobnie) zgodny z wytycznymi Narodowego Programu Zdrowia oraz Centrum Onkologii by Bartosz Chejchman

## Krótki opis:

----

**Faza analizy** -  Nie ma żadnej zmiany w ilości palonych papierosów (ewentualnie tylko z inicjatywy użytkownika). Trwa około 5 dni (można wydłużyć w razie nieścisłych danych) i ma za zadanie zebrać jak najwięcej informacji o nawykach i nałogu użytkownika. Nawyki wykorzystać można w różnych poradach i podpowiedziach dla użytkownika, my skupimy się na jednej zmiennej, czyli średniej ilości wypalanych papierosów dziennie w okresie analizy (później w tekście nazywaną zmienną **b**. Wartość ta może zostać obliczona poprzez średnią sumy orientacyjnej podanej przez użytkownika i sumy papierosów zliczonej przez aplikacje (z większą przychylnością ku danych podanych przez użytkownika, w końcu on zna siebie najlepiej). Użytkownik w tej fazie powinien również podawać dane o sytuacjach w których pali, o rzeczach które przypominają mu palenie itd. aby aplikacja wysyłać mu mogła spersonalizowane komunikaty i porady. Po tych pięciu dniach następuje:

--------
**Faza przejściowa** - w tym momencie algorytm ustalając tę fazę powołuje się tylko na zmienną *b*, chociaż w przyszłości powinien uwzględniać też emocje(?) i odczucia użytkownika. Faza ma na celu stopniowe zmniejszanie ilości palonych papierosów dziennie.
Zmiana jest funkcją liniową, która dla zmiennych:
**x0**=*0*
**y0**=*b*
**y1**=min(6,**y0****20%*)
**x1**
+   dla **y0**<=10 = 5
+   dla **y0**>=30 = 15
+   else = **y0**/2

ma postać równą:
*y*=-[(*y1*-*y0*)/(*x1*-*x0*)]*x*+*y0*
gdzie *x* to dzień okresu przejściowego a *y* to ilość zalecanych palonych papierosów dziennie

Dzięki temu po około 5-15 dniach okresu osoba powinna zejść do poziomu 6 papierosów dziennie.

Przez ten okres przygotowujemy użytkownika do dnia 0, czyli momentu od którego nie powinien palić żadnego papierosa. Robimy to nie tylko poprzez zmniejszanie dawek, ale również poprzez informowaniu go o terminie dnia 0 oraz informowaniu go o skutkach jego decyzji. Użytkownik powinien mieć realny wpływ na datę dnia 0.

---

**Faza zero** - bez papierosa, staramy się jak najmniej przeszkadzać mu w życiu żeby nie przypominał sobie o papierosie, jeżeli mieliśmy jakieś tipy to lepiej dać w poprzedniej fazie, wyciszamy aplikacje, po 2 tygodniach możemy wysłać powiadomienie czy się udało. Jeżeli w trakcie użytkownik naliczył kolejnego papierosa lub przyznał się po 2 tygodniach to sprawdzamy wartość zmiennej b (może być poprzez pytanie “Ile papierosów palisz dziennie teraz?”) i układamy kolejny plan, tym razem bez fazy analizy.