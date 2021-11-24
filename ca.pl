advise:-
retract_,
consult('/Users/ramyanee/Downloads/AI/a5/facts.txt'),
name(Name),
get_intro(Name),
suggest_ai_electives,
suggest_de_electives,
suggest_is_electives,
suggest_mc_electives,
check_elective(Name),nl,nl.

:- dynamic elective/1.
:- style_check(-singleton).

check_elective(Name):-
elective(X) -> (nl,nl, write('Based on your fulfillment of prerequisites, interests, and skills,'),nl,nl,
write('Following electives are advisable for you'),nl,nl,get_electives(List_of_valid_electives),
display(List_of_valid_electives)); 
no_elective(Name).

retract_:-
retractall(cgpa(_)),
retractall(knows(_)),
retractall(good_at(_)),
retractall(interested(_)),
retractall(elective(_)).

get_intro(Name):-
nl,nl,
write('Hello '), write(Name),write('!'),nl.


suggest_ai_electives:-
knows(python),good_at(statistics_and_probability),good_at(linear_algebra),knows(scikit_learn),
(cgpa(high) -> (
    assert(elective('Advanced Machine Learning')),assert(elective('Machine Learning')),assert(elective('Statistical Machine Learning')));
    knows(numpy),knows(pandas),
    assert(elective('Data Mining'))),fail.

suggest_ai_electives:-
knows(prolog),good_at(logic),interested('Game Development'),
assert(elective('Artificial Intelligence')),assert(elective('Trustworthy AI Systems')),
fail.

suggest_ai_electives:-
knows(python),interested('Conversational AI'),
assert(elective('Natural Language Processing')),assert(elective('Speech Recognition and Understanding')),
fail.

suggest_ai_electives:-
(interested('Conversational AI');interested('Computer Vision')),(knows(tensorflow);knows(pytorch)),
knows(machine_learning),not(elective('Deep Learning')),
assert(elective('Deep Learning')),
fail.

suggest_ai_electives:-
interested('Computer Vision'),(knows(tensorflow);knows(pytorch)),
not(elective('Digital Image Processing')),
assert(elective('Digital Image Processing')),assert(elective('Advanced Computer Vision')),assert(elective('Image Analysis')),
fail.

suggest_ai_electives:-
true.


suggest_de_electives:-
knows('Python'),good_at(statistics_and_probability),good_at(linear_algebra),
(cgpa(high) -> (
assert(elective('Machine Learning')),assert(elective('Statistical Machine Learning')));
assert(elective('Data Mining'))),fail.

suggest_de_electives:-
(knows(hadoop);knows(spark)),knows(sql),not(elective('Big Data Analytics')),
assert(elective('Big Data Analytics')),
assert(elective('Business Intelligence and Data Warehousing')),
assert(elective('Web Intelligence and Big Data Analytics')),
fail.

suggest_de_electives:-
true.


suggest_is_electives:-
knows(unix),good_at(discrete_mathematics),good_at(number_theory),
(cgpa(high) -> (
assert(elective('Theory of Modern Cryptography')),assert(elective('Applied Cryptography')));
assert(elective('Foundations to Computer Security'))),fail.

suggest_is_electives:-
(knows(cpp);knows(java)),knows(unix),interested('ethical hacking'),not(elective('Ethical Hacking')),
assert(elective('Ethical Hacking')),
assert(elective('Internet Security & Privacy')),
assert(elective('Network Anonymity and Privacy')),
assert(elective('Digital and Cyber Forensics')),
fail.

suggest_is_electives:-
(knows(cpp);knows(java)),good_at(bash_scripting),not(elective('Secure Coding')),
assert(elective('Secure Coding')),
assert(elective('Network Security')),
assert(elective('Network Protocol Security')),
assert(elective('Privacy and Security in Online Social Media')),
fail.

suggest_is_electives:-
true.

suggest_mc_electives:-
knows('Operating System'),knows('Computer Networks'),
(cgpa(high) -> (
assert(elective('Advanced Topics in Mobile Computing')));
assert(elective('Mobile Computing'))),fail.

suggest_mc_electives:-
good_at('Embedded Systems'),(interested('Internet of Things');interested('Robotics')),
good_at('Programming'), not(elective('Advanced Internet of Things')),
assert(elective('Advanced Internet of Things')),
assert(elective('Smart Sensing for Internet of Things (IoT)')),
assert(elective('Artificial Intelligence')),
fail.

suggest_mc_electives:-
knows('Operating System'),knows('Computer Networks'),good_at('Programming'),
assert(elective('Cellular Data Networks')),
assert(elective('Network Security')),
assert(elective('Network Anonymity and Privacy')),
assert(elective('Mobile and Cellular Network Security')),
fail.

suggest_mc_electives:-
true.

display([H|T]):-
write(H),nl,!,
display(T).
display([]).

get_electives([H|T]):-
retract(elective(H)),
get_electives(T).
get_electives([]).

no_elective(Name):-
nl,nl,
write('Dear '),write(Name),nl,
write('Could not find a suitable elective for you'),nl,
write('Pre-requisites of the electives are not found to be met'),nl,
write('Please refer http://techtree.iiitd.edu.in/ to see the pre-requisite of the electives.').