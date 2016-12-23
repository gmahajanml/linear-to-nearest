function run_nearest(X_pos,X_neg)
	figure;
	plot(X_pos(:,1),X_pos(:,2),'.','MarkerSize',20);
	hold on
	plot(X_neg(:,1),X_neg(:,2),'r.','MarkerSize',20);
	ylim([-4 8]);
	xlim([-4 6]);
	axis manual;
	X = [X_neg; X_pos];
	Y = [zeros(100,1)-1;zeros(100,1)+1];
	M = size(X)(1);
	l = linspace(-10, 10, 100);
	m = linspace(-10, 10, 100);

	[X1,X2] = meshgrid(l, m);

	N = length(X1(:));
	classes = zeros(size(X1));
	for i = 1:N
		this = [X1(i) X2(i)];
		dists = sum((X - repmat(this,M,1)).^2,2);
		[d I] = sort(dists,'ascend');

		neighbors = Y(I(1:10));
		prediction = sum(neighbors);
		if prediction>0
			classes(i)=1;
		else
			classes(i)=-1;
		end
	end

	contour(l,m,classes,[1,1]);
end