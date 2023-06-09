function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
    ro = max(abs(eig(G)));
    [n , n] = size(G);
    x = zeros(n , 1);

    if ro >= 1
        err = -1;
        steps = -1;
        disp("The Jacobi Method does not converge on given G - matrix.");
        return;
    endif

    steps = 0;
    err = 0;
    prev_x = x0;

    while 1
        x = G * prev_x + c;
        steps++;
        err = norm(x - prev_x);
        if err <= tol
            return;
        endif

        if steps >= max_steps
            return;
        endif

        prev_x = x; 
    endwhile
endfunction