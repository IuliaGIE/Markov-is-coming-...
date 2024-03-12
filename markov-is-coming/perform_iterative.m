function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
    % G -> iteration matrix
    % c -> iteration vector
    % x0 -> initial solution
    % tol -> accepted tolerance (norm of the difference between two solutions)
    % max_steps -> the maximum number of iterations

    % x -> final solution
    % err -> last calculated difference (as an euclidean norm)
    % steps -> actual number of steps performed

    x = x0;
    x = c;
    err = tol + 1;
    steps = 1;
    % tai ultimele 2 linii din G
    G = G(1:end-2, :);
    while (err > tol && steps < max_steps)
        % initializăm vectorul solutiei noi
        nex = zeros(size(x));
        nex = G * x; 
        x_new = nex + c;
        err = norm(x_new - x);
        x = x_new;
        steps = steps + 1;
    end
end
