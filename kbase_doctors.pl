:- module(kbase_doctors, [назначить_raw/2, список_симптомов/1]).

:- consult(kbase_deseases).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% База знаний "врач - класс заболевания"


аллерголог(Симптомы, "аллерголог"):-
	аллергия(Симптомы).

кардиолог(Симптомы, "кардиолог"):-
    заболевание_для_кардиолога(Симптомы).

терапевт(Симптомы, "терапевт"):-
    орви(Симптомы);
	заболевание_для_терапевта(Симптомы).

нефролог(Симптомы, "нефролог"):-
	заболевание_для_нефролога(Симптомы).

флеболог(Симптомы, "флеболог"):-
	заболевание_для_флеболога_или_хирурга(Симптомы).

хирург(Симптомы, "хирург"):-
	заболевание_для_флеболога_или_хирурга(Симптомы).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% "Регистрация" специалистов для поиска

назначить_raw(Симптомы, Врачи):-
    кардиолог(Симптомы, Врачи);
    терапевт(Симптомы, Врачи);
	нефролог(Симптомы, Врачи);
	аллерголог(Симптомы, Врачи);
    хирург(Симптомы, Врачи);
	флеболог(Симптомы, Врачи).
