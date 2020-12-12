%:- module(kbase_deseases).

:- use_module(library(lists)).


% список симптомов для выдачи клиенту

список_симптомов([
                 "гипертония",
                   "отек на двух ногах",
                   "кашель",
                   "насморк",
                   "высокая температура",
                   "отёчность_лица",
                   "расширение поверхностных вен нижних конечностей у пациента или в семейном намнезе",
                   "отек на одной ноге",
                   "принимает препараты из группы БКК",
                   "отеки постоянные/не проходят после сна и отдыха"
                 ]).

% или вот так его можно записать
%    список_симптомов(["гипертония","отек на двух ногах","кашель","насморк","высокая температура", "отёчность_лица", "расширение поверхностных вен нижних конечностей у пациента или в семейном намнезе","отек на одной ноге","принимает препараты из группы БКК","отеки постоянные/не проходят после сна и отдыха"]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% База знаний "класс заболевания - симптомы"
%

заболевание_для_кардиолога(Симптомы):-
    member("гипертония", Симптомы);
    member("отек на двух ногах", Симптомы).

орви(Симптомы) :-
    member("кашель", Симптомы);
    member("насморк", Симптомы);
    member("высокая температура", Симптомы).

аллергия(Симптомы):-
	member("отёчность_лица", Симптомы),
	\+ member("расширение поверхностных вен нижних конечностей у пациента или в семейном намнезе",Симптомы),
	\+ member("отек на ноге", Симптомы).

заболевание_для_флеболога_или_хирурга(Симптомы):-
	member("отек на ноге", Симптомы);
	member("расширение поверхностных вен нижних конечностей у пациента или в семейном намнезе",Симптомы).

заболевание_для_терапевта(Симптомы):-
	member("принимает препараты из группы БКК",Симптомы).

заболевание_для_нефролога(Симптомы):-
	member("отеки постоянные/не проходят после сна и отдыха", Симптомы),
	member("отечность лица",Симптомы).

