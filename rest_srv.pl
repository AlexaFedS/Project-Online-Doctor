:- use_module(kbase_handler).

:- use_module(library(http/http_server)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).


:- http_handler('/symptoms_list',сервис1(M), [method(M),methods([post,get]),time_limit(10000)]).
:- http_handler('/answer',сервис2(M), [method(M),methods([post,get,options]),time_limit(10000)]).


сервстарт(Порт) :- http_server(http_dispatch, [port(Порт)]).

сервис1(get, _Request) :-
    список_симптомов(PrologOut),
    prolog_to_json(PrologOut, JSONOut),
    reply_json(JSONOut).

сервис2(post,Request) :-
    http_read_json_dict(Request, JSONIn),
    json_to_prolog(JSONIn, PrologIn),
    назначить(PrologIn, PrologOut),
    prolog_to_json(PrologOut, JSONOut),
    reply_json(JSONOut).

сервстоп(Порт) :-
    http_stop_server(Порт,_).
