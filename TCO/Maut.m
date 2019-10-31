function [ Toll_rate ] = Maut(SSK, costStruct)
%Maut(SSK) bestimmt den Toll_rate pro Kilometer f�r das Gesamtfahrzeug auf 
%deutschen Autobahnen gem�� �3, Absatz 3 Bundesfernstra�enmautgesetz 
%(BFStrMG). 
%   Die Einteilung in die Kategorien A bis D erfolgt nach � 48 StVZO 
%   (Anlage XIV) je nach Schadstoffklasse

% globale Variablen: Composition enth�lt die Objekte des Lastzuges, c_obj
% die Zahl der Objekte in Composition
global Composition c_obj;
%Theisen 20.03.2016
%Umstellung auf EU-Abgasnormen 1-6  (vorher war immer 6 eingestellt, jetzt variabel)
%Schatkowski 30.08.2016
%Aktualisiert auf g�ltige Mauts�tze vom 01.10.2015

% Gesamtzahl der Achsen bestimmen
Achszahl = 5;
for i=1:c_obj
    Achszahl = Achszahl+Composition{i}.N;
end

% Ber�cksichtigung, dass f�r alle Kompositionen �ber 4 Achsen der gleiche
% Toll_rate berechnet wird
if Achszahl > 4
    Achszahl = 5;
end

% Matrix Maut laden, Stand 01.10.2015
%load('Toll_Oct_2015_Euro_per_km.mat')


% Toll_rate berechnen in Abh�ngigkeit der Schadstoffklasse und Achsanzahl
Toll_rate = costStruct.TCO.Toll_Oct_2015_Euro_per_km{SSK, Achszahl};

end

