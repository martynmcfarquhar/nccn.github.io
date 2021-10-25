Y = [21 21 22.8 21.4 18.7 18.1]';

X = [1 110 2.620 1; ...
     1 110 2.875 1; ...
     1 93  2.320 1; ...
     1 110 3.215 0; ...
     1 175 3.440 0; ...
     1 105 3.460 0];
 
Beta        = inv(X' * X) * X' * Y; 
Yhat        = X * Beta;
Residuals   = Y - Yhat;
Sigma2      = (Residuals' * Residuals) / (size(X,1) - size(X,2));
Vcov        = Sigma2 * inv(X' * X);
SE          = sqrt(diag(Vcov));

Effects = {'Constant';'Horsepower';'Weight';'Transmission'};
Estimate = round(Beta,3);
StandardError = round(SE,3);

table(Estimate,StandardError,'RowNames',Effects)