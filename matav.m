
%% other ec problem

function flag = matav(A)

    flag = (matav1(A)==confirmAverage(A));

end

%A is a matri
%matav will average the matrix
function avg = matav1(A)

    counter = 0;
    summation = 0;
    for ii = 1:length(A(:))
        counter = counter + 1;
        summation = summation + A(ii);
    end
    
    avg = summation/counter;

end

function avg = confirmAverage(A)

    avg = sum(sum(A))/length(A(:));

end