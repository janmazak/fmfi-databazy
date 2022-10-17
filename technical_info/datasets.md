# Database schemas and datasets

## Employee

Databáza zamestnancov

https://dbis-uibk.github.io/relax/calc/gist/379b0fdd72490e8e634bb193f109d4a8


## Pijani

Databáza pijanov v troch podobách (líšia sa len v pomenovaní predikátov a atribútov).

```
	lubi(P, A)
	capuje(K, A, C)
	navstivil(I, P, K)
	vypil(I, A, M)
```
https://dbis-uibk.github.io/relax/calc/gist/b7c192435907b65961cac108b4fe7b87

---

```
	l(P, A)
	c(K, A, C)
	n(I, P, K)
	v(I, A, M)
```
https://dbis-uibk.github.io/relax/calc/gist/4f0e826d6b17eca36bb5876204fa9f72

---

```
	lubi(Pijan, Alkohol)
	capuje(Krcma, Alkohol, Cena)
	navstivil(Id, Pijan, Krcma)
	vypil(Id, Alkohol, Mnozstvo)
```
https://dbis-uibk.github.io/relax/calc/gist/f5f018befad7f720b5fb56898534ed3a

