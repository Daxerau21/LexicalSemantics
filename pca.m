function [newmatrix, eigvect, eigval, variances] = pca (data, rotation, nroffactors)

% data is an m x n matrix in which the m rows are observations and the n
% columns are the variables.
% Rotation:
% 0 = no rotation
% 1 = varimax

%determine size of matrix
[nrofrows nrofcols] = size (data);

%Calculate the column means for mean-centering
for j = 1:nrofcols
 sum = 0;
 for i = 1:nrofrows
  sum = sum + data(i,j);
 end
 colmeans(j) = sum / nrofrows;
end

%Mean-center the columns of the data matrix;
for j = 1:nrofcols
 for i = 1:nrofrows
  data(i,j) = data(i,j) - colmeans(j);
 end
end

%Get the covariance of the mean-centered data matrix
covdata = cov(data);

%Get the eigtenvectors and eigenvalues
[evect eval] = eig(covdata);

%Abstract the variances from the eigenvalue matrix
variancevector = diag(eval);

%Matlab outputs the eigenvectors and eigenvalues in ascending rather than
%descending order of importance. Reverse-sort both the variance vector and
%the eigenvector matrix.
[junk, reverseindices] = sort(-1*variancevector);
variancevector = variancevector (reverseindices);
evect = evect(:,reverseindices);
eval = eval(:,reverseindices);

%Rotation
if rotation == 1
 evect = rotatefactors (evect, 'Method', 'varimax');
end

%Project the data into the new basis
for i = 1:nroffactors
 evectreduced(:,i) = evect(:,i);
end
proj = evectreduced' * data';

%Output 
newmatrix = proj';
eigvect = evect;
eigval = eval;
variances = variancevector;

