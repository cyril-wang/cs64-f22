I think that the secret formula file is taking an array / sequence of numbers, and applying a secret formula to it to "hide" the array's values. It does so by applying the secret formula detailed in secret_formula_apply to each of the elements in arr and storing those in c_arr. Then, it converts the encoded array back into its original array by applying the inverse of the secret formula and stores that result in m_arr. 

(i) secret_formula_apply results: 9, 14, 1   28, 9, 21

u * t = [21, 15, 21]
secret_formula_remove(9*28) = 21
secret_formula_remove(14*9) = 15
secret_formula_remove(1*21) = 21

It appears that it does hold for all entries in both arrays.

(ii) 
u + t = [10, 8, 22]
secret_formula_remove(9+28) = 31
secret_formula_remove(14+9) = 23
secret_formula_remove(1+21) = 22

It apperas that this does not hold for all entries in both arrays.


    