function [X_pos,X_neg] = generate_scenerio1()
	pkg load statistics
	mu_pos = [2,3];
	mu_neg = [0,3];
	sigma = [1,1.5;1.5,3];
	X_pos = mvnrnd(mu_pos,sigma,100);
	X_neg = mvnrnd(mu_neg,sigma,100);
end