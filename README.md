**Nume: Tudor Cristian-Andrei**

**Grupa: 311CAa**

# <font color="#B6E388"> Metode numerice - Tema 1 </font>


## <font color="#E7B10A"> Task 1 - Markov is coming . . .</font>

### Structura codului pentru acest task:

1. <font color="B6E388">parse_labyrinth</font> <br> Pentru a parsa fisierul text, se citesc toate datele din fisier, intr-un vector auxiliar. Din acest vector se extrag primele 2 elemente, care reprezinta numarul de linii si de coloane (**m  = numar de linii**, **n = numar de coloane**). Se face reshape la acest vector, transformand vectorul intr-o matrice n * m, care ulterior o sa fie transpusa. Deoarece fscanf citeste pe linii, vectorul contine liniile matricei in ordine, dar reshape, face cumva invers, ia elementele la rand si le transforma in coloane, este nevoie si de o transpunere.

>> Spre exemplu: <br> Matricea $\begin{bmatrix}1 & 2 & 3 \\ 2 & 5 & 7 \\ 1 & 12 & 15 \\ 12 & 1 & 6\end{bmatrix}$ va fi refacuta in urma citirii ca un **vector coloana** (dar il voi scrie sub forma de vector linie) cu elementele $\begin{bmatrix}1 & 2 & 3 & 2 & 5 & 7 & 1 & 12 & 15 & 12 & 1 & 6 \end{bmatrix}$, pe care trebuie sa se aplice un reshape invers (**n * m** in loc de ~~**m * n**~~, pentru a putea recupera originala), ca sa obtinem coloanele : $\begin{bmatrix}1 \\ 2 \\ 3 \end{bmatrix}$ $\begin{bmatrix}2 \\ 5 \\ 7 \end{bmatrix}$ $\begin{bmatrix}1 \\ 12 \\ 5 \end{bmatrix}$ $\begin{bmatrix}12 \\ 1 \\ 6 \end{bmatrix}$, care alturate formeaza matricea initiala transpusa. <br> <br> obs: Am ignorat primele 2 elemente, care sunt m si n, nu le consider redunante in explicatie, deoarece sintaxa de Octave iti permite sa sari peste ele foarte usor.

2. <font color="B6E388">get_adjacenecy_matrix</font> <br> Pentru aceast sub-task, m-am mai folosit de o functie pe care o apeleaza si get_link_matrix, anume **<font color="B6E388">get_side_walls</font>**, care returneaza 5 valori, 4 valori de 1 sau 0 (1 daca **exista** perete, 0 daca **nu exista**), si inca o valoare, **o probabilitate**, probabilitatea ca din celula curenta sa treci intr-o alta celula (si ma refer aici la distributia egala a probabilitatii, adica, pentru o casuta care are legatura cu 2 celule, probabilitatea o sa fie de  **1 / 2**, cu 3 celule, o sa fie **1 / 3**, etc). Pentru testarea daca o celula are perete sau nu, m-am gandit la operatiile pe biti, mai exact **reprezentarea puterilor lui 2 pe biti**, impreuna cu operatia **& ( si / and)**.
>> Testarea se face un pic ineficient, deoarece se fac 4 if-uri. Probabil exista un mod mult mai eficient de a face asta, dar atat s-a putut din partea mea de data asta. Functioneaza astfel: <br> Se verifica fiecare bit din numar daca este setat pe **1** prin operatia de **si** pe biti (cu functia **bitand**). Pentru ca puterile lui 2, scrise in binar, sunt reprezentate printr-un 1 si restul numai 0, in urma operatiei din si sunt 2 posibilitati, ori **0**, ori **acea putere a lui 2 cu care s-a facut operatia**. Codificarile labirintului fiind pe 4 biti, se face **si** cu **1**, **2**, **4** si **8**.

3. <font color="B6E388">get_link_matrix</font> <br> Functia este foarte asemanatoare cu cea de mai sus, apeleaza la fel, **<font color="B6E388">get_side_walls</font>**, si se foloseste de rezultatul acesteia, punand de acesta data in matrice, daca este cazul, in loc de 1, probabilitatea returnata de functie.
>> Pentru a lucra cu matrici rare de la inceput, am folosit functia **spalloc**. Cel mai important este paramterul care asigura numarul de elemente nenule, **nz**. Fiecare linie reprezinta o celula, care poate avea maxim 4 vecini, deci pe fiecare linie a matricelor (de adiacenta, si de legaturi), se pot afla maxim 4 elemente nenule (este un caz ideal, in care nu ar exista niciun perete), la care se mai adauga inca 2 elemente, prezente mereu, deoarece **WIN** are legatura doar cu **WIN**, si **LOSE** are legatura doar cu **LOSE**. Deci, nz = **m * n * 4 + 2**.

4. <font color="B6E388">get_Jacobi_parameters</font> <br> Deoarece lucram in Octave, aceasta functie este usor de realizat, se face doar o atribuire, astfel : **G** devine toate liniile din Link, mai putin ultimele 2, si toate coloanele din Link, mai putin ultimele 2, iar **c** devine penultima coloana din Link, fara ultimele de linii (nu prea am ce sa explic aici).

5.  <font color="B6E388">perform_iterative</font> <br> Aceasta functie este implementarea Jacobi de la laborator, doar ca si mai simpla, pentru ca G si c sunt deja calculate, si nu mai trebuie impartita A in N si P.

6. <font color="B6E388">heuristic_greedy</font> <br> Este o implementare pas cu pas a pseudocodului dat in enunt. Practic, plec de la o pozitie de start, si mereu ma duc pe pozitia adiacenta cu probabilitatea cea mai mare, si retin int-un vector ordinea parcurgerii. In cazul in care pozitia este o "infundatura", se sterge cate o pozitie de la final si se incearca o alta cale. Pentru a determina vecinii unei celule, am creat 2 functii (desi ajungea doar una, daca stau sa ma gandesc).
>> <font color="B6E388">check_neighbours</font>, care verifica daca o celula are vecini nevizitati. Se cauta vecinii celulei in matricea de adiacenta, dupa care se verifica daca celula vecin a fost marcata ca vizitat in vectorul *visited*.

>> <font color="B6E388">get_neighbour</font>, care intoarce pozitia vecina, nevizitata, cu cea mai mare probabilitate. Se cauta vecinii pe linia i din matricea de adiacenta, se testeaza daca au fost vizitati, iar pentru cei nevizitati, se retine indexul valorii maxime si valoarea maxima (aceasta pentru a putea compara).

7. <font color="B6E388">decode_path</font> <br> Functia se bazeaza mai mult pe formule matematice, pe care le-am decoperit prin mai multe incercari pe foaie. Tot ce am facut pentru aceasta functie a fost sa implementez urmatoarea logica:
>> Am plecat de la urmatoarele : <br> Orice stare se scrie ca : $ stare = (i - 1) * n + j$ cu $1 \le i \le m$ si $1 \le j \le n$ . <br> Vrem sa aflam i si j, stiind m, n si starea <br> Este clar ca $ j = stare \bmod n$, daca $j$ nu este multiplu de $n$, si $j = n$, daca $j$ este multiplu de $n$, adica $stare \bmod n = 0$. <br> Acum, cunoscandu-l pe $j$, il putem scadea in ambele parti ale primei egalitati : <br>$stare - j = (i - 1) * n$ <br> Impartim prin $m$ : <br> $i - 1 = \dfrac{stare - j }{n}$. <br> Adunam $1$ in ambele parti si rezulta $i$: <br> $ i = 1 + \dfrac{stare - j }{n}$

<br>

## <font color="#E7B10A"> Task 2 - Linear Regression</font>

### Structura codului pentru acest task:

1. <font color="B6E388">parse_data_set_file</font> <br> Pentru a parsa textul, am optat sa citesc linie cu linie din fisier (cu functia **fgetl** ). Citesc toate datele de pe linie intr-un string, un buffer, pe care il prelucrez cum vreau. Doar prima citire este diferita, deoarece extrag din buffer 2 numere intregi, **m** si **n**, fata de restul liniilor, din care intai "extrag" un intreg, respectiv valoarea lui **y** de pe linia curenta, iar apoi impart string-ul mare intr-un vector de "cuvinte", dupa delimitatorul spatiu. Se sare peste primul element (corespunzator lui **y**), iar restul se pun in matricea de tip cell.

2. <font color="B6E388">parse_csv_file</font> <br> Asemanatoare functiei de mai sus, de data aceasta, prima linie este practic folosita doar pentru a numara coloanele, si apoi ignorata (este "headerul" fisierului csv). In rest, se procedeaza la fel, doar ca delimitatorul este acum virgula ( **,** ), in loc de spatiu. In plus, **for**-ul este inlocuit de un **while**, necunoscand numarul de linii.

3. <font color="B6E388">prepare_for_regression</font> <br> Inainte de a incepe transformarea priopriu-zisa a matricei, se cauta intai index-ul coloanei care trebuie impartita in 2 campuri. Se parcurge matricea pana la acel index, si se fac comparatii pentru a transforma toate datele in date numerice. Se parcurge coloana ce trebuie impartita, si se imparte dupa modelul dat. Ultima parte este identica primei. <br> **obs**: Nu prea sunt asa multe de explicat aici, se vede mai bine din cod modul in care se fac comparatiile si conversiile.

4. <font color="B6E388">linear_regression_cost_function</font> <br> Datorita enuntului detaliat, nici nu prea am ce sa explic aici (altfel era muuult mai greu). Practic, am aplicat in Octave, formula functiei de cost din document, doar ca vectorizata, in loc sa inmultesc fiecare linie pe rand cu vectorul $\theta$, inmultesc toata matricea cu $\theta$.

5. <font color="B6E388">gradient_descent</font> <br> Pana sa ajung la task-ul 3, nu prea m-am gandit la vectorizari, si de asta functiile de la task-ul asta sunt un mix, unele au for-uri, unele sunt vectorizate. Am mai creat o functie, <font color="B6E388">get_cost_function_gradient</font>, care face prima parte a metodei, si intoarce vectorul de gradienti. Nu prea sunt multe de explicat, este implementata formula cu for-uri, nu am vectorizat (acum probabil as face altfel si as vectoriza).

6. <font color="B6E388">normal_equation</font> <br> Reprezinta implementarea pseudocodului din document, plus calcularea unei inmultiri de matrici, si matrice cu vector. Pentru a verifica daca matricea este pozitiv definita, am folosit functia <font color="B6E388">positive_definite</font>, in care calculez determinanti din stanga sus (**"upper left k $\times$ k matrix"**), si verific sa fie mai mari decat 0. In rest este doar implementarea pas cu pas a pseudocodului.
>> Spre exemplu, daca am matricea $A = \begin{bmatrix}3 & 4 & 7 \\ 2 & 5 & 9 \\ 8 & 3 & 4\end{bmatrix}$, functia calculeaza pe rand $\det \begin{bmatrix} 3 \end{bmatrix}$, $\det \begin{bmatrix}3 & 4 \\ 2 & 5\end{bmatrix}$, si $\det{A}$, iar daca vreunul e mai mic decat $0$, returneaza fals.

7. <font color="B6E388">lasso_regression_cost_function</font> si <font color="B6E388">ridge_regression_cost_function</font> <br> Am pus in aceeasi categorie aceste functii, deoarece sunt simple de implementat, doar am facut formula in Octave. La ambele functii, m-am folosit de **linear_regression_cost_function**, deoarece ambele au termeni care contin acea suma calculata (la **Ridge** e chiar aceea suma, la **Lasso** este inmultita cu 2, ca sa ramana dpar $m$ la numitor, in loc de $2m$).

>> Observatie: Nu am mai specificat, dar la toate functiile ignor primul termen din $\theta$, si la functiie din care rezulta $\theta$, il adaug la finalul operatiilor.

<br>

## <font color="#E7B10A"> Task 3 - MNIST 101</font>

### Structura codului pentru acest task:

1. <font color="B6E388">load_dataset</font> <br> Cea mai simpla functie din aceasta tema, o singura comanda **load**.

2. <font color="B6E388">split_dataset</font> <br> Foarte simpla de realizat in Octave si aceasta functie, intai amestec liniile in functie de o permutare generata de **randperm**, dupa care impart in 2 seturile (tinand cont sa fac acceasi permutare si aceeasi impartire si la **X** si la **y**).

3. <font color="B6E388">initalize_weights</font> <br> Se calculeaza $\epsilon$, si cu ajutorul functiei **rand**, care genereaza numere aleatoare intre $0$ si $1$, se pot aduce numere la orice interval.

>> Tin sa mentionez ca la inceput nu am stiut ca **rand** genereaza numerele intre $0$ si $1$, asa ca am cautat si am gasit pe [Forumul oficial MATLAB](https://www.mathworks.com/matlabcentral/answers/87815-floating-numbers-generation-in-a-range) raspunsurile de care am avut nevoie.

4. <font color="B6E388">cost_function</font> <br> Probabil cel mai greu task din toata tema, dificultate a constat in vectorizari. La cele mai multe formule au fost usor de facut vectorizarile, dar pentru mine, personal, cel mai dificil a fost sa gasesc o formula pentru $\Delta = \Delta + \delta * a^T$ (desi nu e asa greu, doar mi-a fost mie greu sa inteleg de ce functioneaza asa cum am facut).

>> Pentru ca ar fi iesit o functie mult prea mare, am impartit codul in doua,  <font color="B6E388">get_costJ</font> si  <font color="B6E388">get_gradient</font>.

5.  <font color="B6E388">split_params</font> si <font color="B6E388">unsplit_params</font> <br> Functiile sunt "opuse". Una transforma un vector desfasurat in 2 matrici, iar cealalta transforma 2 matrici, intr-un vector desfasurat. Toate operatiile se fac cu **reshape**.

6. <font color="B6E388">predict_classes</font> <br> Practic, aceasta functie este prima parte din **cost_function**, se efectueaza **forward propagation** vectorizat,in functie de vectorul **weights** optimizat,  si se cauta pe fiecare coloana a matricei rezultate elementul maxim, adica cu  probabilitatea cea mai mare de a fi clasa din care face parte setul de date, si se retine index-ul elementului maxim (foarte usor de realizat cu functia **max**).
