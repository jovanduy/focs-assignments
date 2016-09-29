Student Name: Jordan Van Duyne
Check one:
[x] I completed this assignment without assistance or external resources.
[ ] I completed this assignment with assistance from \_\_\_
   and/or using these external resources: ___

## 1. For each of the following languages, decide whether it is regular

a) Strings containing only the symbol a whose length is a power of 2 (i.e. length 2^n)

[The strings a, aa, aaaa, and aaaaaaaa are in this language; the string aaaaa is not.]

Not regular.

Assume for contradiction that this language, *L*, is regular.

By the pumping lemma, there is some length *p* such that all words *w* in *L* of length *p* or greater can be pumped.

Let *s* be the string a<sup>2<sup>p</sup></sup>. Thus, the length of *s* is greater than *p*, since for any positive power *j* of 2, *2<sup>j</sup> > j* (1, 2, 4, 8, 16 are the values of 2 to the 0, 1, 2, ..., 4, respectively, and the values continue growing exponentially, while the exponents only increase by 1). The pumping lemma therefore guarantees that *s* can be split into three pieces *s = xyz*, where for any *i* ≥ 0, the string *xy<sup>i</sup>z* is in *L*.

Consider the strings *xyz* and *xyyz*, where *xyyz* should be the word in *L* where *n* is one greater than in *xyz*; so *s = xyz* and a<sup>2<sup>p + 1</sup></sup> = *xyyz*. These strings differ from each other by a single repetition of *y*, so their lengths differ by |*y*|.

By the pumping lemma, |*xy*| ≤ *p*, and thus |*y*| ≤ *p* since |*x*| ≥ 0. The pumping lemma also guarantees that *y* is not the empty string.

We have |*xyz*| = *2<sup>p</sup>*, so |*xyyz*| ≤ *2<sup>p</sup> + p*. However, *2<sup>p + 1</sup> = 2<sup>p</sup> +  2<sup>p</sup> > 2<sup>p</sup> + p* (as shown above). So, |*xyyz*| is between *2<sup>p</sup>* and *2<sup>p + 1</sup>*, meaning that the length of |*xyyz*| cannot be *2<sup>j</sup>*, so we have a contradiction! Thus, *xyyz* is not in *L*, meaning *L* cannot be regular.

b) All strings with an equal number of occurrences of the substrings 01 and 10.

(assuming ∑ = {0,1})

(0<sup>+</sup>(1<sup>+</sup>0<sup>+</sup>)\*)\*|(1<sup>+</sup>(0<sup>+</sup>1<sup>+</sup>)\*)*

![1b DFA](images/1b.png)

c) All strings (over {0,1}) consisting of a substring w followed by the reverse of the substring.

Not regular.

Assume for contradiction that this language, *L*, is regular.

By the pumping lemma, there is some length *p* such that all words *w* in *L* of length *p* or greater can be pumped.

Let *s* be the string *0<sup>p</sup>110<sup>p</sup>*. Since |*s*| = *2p + 2 ≥ p*, the pumping lemma guarantees that *s* can be split into three pieces *s = xyz*, where for any *i ≥ 0*, the string *xy<sup>i</sup>z* is in *L*.

By the pumping lemma, |*xy*| ≤ *p*, so *xy* has to be a subset of *0<sup>p</sup>*, meaning *x = 0<sup>j</sup>* and *y = 0<sup>k</sup>*, where *j + k ≤ p* and *k > 0* since |*y*| > *0* by the pumping lemma. Thus, *z = 0<sup>p-j-k</sup>110<sup>p</sup>*. If we pump *y* so that *i = 0*, we have are left with *xz*, where *xz = 0<sup>p-k</sup>110<sup>p</sup>*, which is not in *L*. Thus we have a contradiction! *L* cannot be regular.

## 2. Play the pumping game

### Exercise 1

* L={w∈Σ<sup>\*</sup> | |w|<sub>𝕒</sub><|w|<sub>𝕓</sub>}; p = 8

* My word: aaaabbbbb (a4b5)

* Substring (italicized section): aaaa*b*bbbb

* Pumped string: aaaabbbb (a4b4)

### Exercise 15

* L={a<sup>n</sup>b<sup>n<sup>2</sup></sup> | n∈ℕ}; p = 6

* My word: aaabbbbbbbbb (a3b9)

* Substring (italicized section): aaa*bbbb*bbbbb

* Pumped string: aaabbbbbbbbbbbbb (a3b13)

## 3. Create a PDA
 ![PDA](images/3.png)

## 4. Reading

Read Sipser!

## 5. Install gprolog

Done!
