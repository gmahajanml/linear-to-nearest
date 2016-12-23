function run_linear(X_pos,X_neg)
	figure;
	plot(X_pos(:,1),X_pos(:,2),'.','MarkerSize',20);
	hold on
	plot(X_neg(:,1),X_neg(:,2),'r.','MarkerSize',20);
	ylim([-4 8]);
	xlim([-4 6]);
	axis manual;
	X = [zeros(200,1)+1 [X_neg; X_pos]];
	Y = [zeros(100,1)-1;zeros(100,1)+1];
	param = inv(transpose(X)*X)*transpose(X)*Y;
	line_y = -4:0.5:13;
	line_x = (0.5-(param(3)*line_y)-param(1))/param(2);
	plot(line_x,line_y);
	set(gca,'Color',[1 .5 0]);
	range = ylim;
	h = area(line_x,line_y, range(1));
	set (h(1), 'FaceColor', [.5 .5 1]);
end