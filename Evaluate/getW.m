function W_IT = getW(I, T)

te_n_I = size(I, 1);
te_n_T = size(T, 1);

D = pdist([I; T], 'cosine');
W = - squareform(D);
W_IT = W(1:te_n_I, te_n_I + 1 : te_n_I + te_n_T);