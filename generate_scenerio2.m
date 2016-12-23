function [X_pos,X_neg] = generate_scenerio2()
	pkg load statistics
	mu_pos = [4,4;2,3;3,3;3.4,3;3.2,3;2,3;2.2,3;2.4,3;-1.8,-1;-2,-2];
	mu_neg = [0,0;0,3;0,4;0.6,1;0.8,3;1,3;1.2,3;1.4,3;1.6,3;1.8,3];
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
end