clear;
pkg load statistics
mu_pos = [1,3;1.2,3;1.4,3;1.6,3;1.8,3;2,3;2.2,3;2.4,3;2.6,3;2.8,3];
mu_neg = [0,3;0.2,3;0.4,3;0.6,3;0.8,3;1,3;1.2,3;1.4,3;1.6,3;1.8,3];
sigma = [1,1.5;1.5,3];
choice_pos = randi(10,[100,1]);
choice_neg = randi(10,[100,1]);

X_pos = zeros(100,2);
X_neg = zeros(100,2);

for i=1:numel(choice_pos)
  X_pos(i,:) = mvnrnd(mu_pos(choice_pos(i),:), sigma, 1);
end

for i=1:numel(choice_neg)
  X_neg(i,:) = mvnrnd(mu_neg(choice_neg(i),:), sigma, 1);
end

figure;
plot(X_pos(:,1),X_pos(:,2),'.','MarkerSize',20);
hold on
plot(X_neg(:,1),X_neg(:,2),'r.','MarkerSize',20);
X = [zeros(200,1)+1 [X_neg; X_pos]];
Y = [zeros(100,1)-1;zeros(100,1)+1];
param = inv(transpose(X)*X)*transpose(X)*Y;
line_y = -4:0.5:10;
line_x = (0.5-(param(3)*line_y)-param(1))/param(2);
plot(line_x,line_y);
set(gca,'Color',[1 .5 0]);
range = ylim;
h = area(line_x,line_y, range(1));
set (h(1), 'FaceColor', [.5 .5 1]);
axis tight
hold off