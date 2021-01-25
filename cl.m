function f = clusterhierarchicaleuclid (m)

[nrofrows nrofcols] = size(m);

%Make Euclidean distance matrix%
distancevector = pdist(m);
tree = linkage(distancevector, 'ward');
dendrogram(tree, 0,'orientation','right');
cophenetic = cophenet(tree,distancevector);
f = cophenetic