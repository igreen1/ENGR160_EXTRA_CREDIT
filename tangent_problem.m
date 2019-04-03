function nothing = tangent_problem()


%{
Create a script that will require continuous input. The program will graph
any function f(x) that the user inputs using the number of points given by 
the user andwill plot the tangent line to the function at a point selected 
by the userwith an inputted index number. THE CATCH: the length of the
tangent line mustbe proportional to the rate of change of the 
function y = sin(x), meaning if the function has a high rate of 
change at a selected point, the tangent line will be longer and vice versa
%}

clear all
close all



%% main loop
running = true;
while(running)

    %define time matrix
    userTimeLength = input("How many time units? ");
    userTimeStart = input("Start time? ");
    userTimeEnd = input("End time? ");
    
    t = linspace(userTimeStart, userTimeEnd, userTimeLength);
    %get function
    ft = input("What is f(t)? ");
    
    %at what point do they want to tanget line (t sub n)
    tn = input("At what time do you want to graph the tangent line? ");
    
    %transform tn into index
    dt = (userTimeEnd-userTimeStart)/(userTimeLength-1);
    tx = tn - userTimeStart; %convert to time since beginning :)
    ii = round(tx/dt);
    
    %calculate derivative at tn using linear approximation
    if(ii > length(ft)-1) %too close to end for good approx
        df = ( ft(ii)-ft(ii-1))/dt;
    elseif(ii<1) % too close to beginning for good approx
        df = ( ft(ii+1)-ft(ii) ) /dt;
    else
        df = ( ft(ii+1) - ft(ii-1) ) / dt;
    end
    
    
    %slope of tangent is df!
    % so df = df/dt in reality
    %now for the equation
    
    % L(tangent) = k * cos(t) by the problem
    % do they mean L(tanget) = k*f'(t) ???
    
    %well, lets find the length :)
    %note, I define K because it only says proportional, does not
    %specify constant of proportionality
    k = 10; %pretty arbitrary
    L = k * cos(tn)
    
    %for testing
    
    %i think the problem wants L to be proportional to df
    %in which case it should be L = k * df
    %so could put
    % L = 1 * df(ii)
    
    %now for endpoints!
    %let v be the directional vector of length unknown in direction of the
    %tangent
    
    v = [df/2, 1];
    
    
 
    
    %we want |v| to be L so!
    %unit vector v now
    v = v/sqrt(v(1)^2 + v(2)^2); %from calc equations
    %and now set v to length L
    v = L .* v;
    
       %now go 1/2 to left, 1/2 to right
       
    left_point  = [ t(ii) - 0.5*v(2), ft(ii) - 0.5*v(1)];  
    right_point = [ t(ii) + 0.5*v(2), ft(ii) + 0.5*v(1)]; 
       
           
    
    %plot the function
    close all
    figure
    plot(t, ft)
    hold on
    %plot the derivative
    plot( [left_point(1),right_point(1)],[left_point(2), right_point(2)] )
    hold on
    
    %now what?
    command = 3;
    while (command ~= 1 && command ~=2)
        command = input("what now? 1 = exit, 2 = re-graph, 3 = hold your horses");
    end
    
    if(command == 1)
        break
    end
    
end
nothing = 0; %bc i moved files around
end


%% defines the matrix of time 
function t = convertToTimeMatrix(startTime, endTime, unit)

    t = linspace(startTime, endTime, unit);

end