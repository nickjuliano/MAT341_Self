function practice_IFS()

x = 8;

if x < 5
    
    A = 10;
    
else
    
    A = 57.5;
end

y = 37;

if y < 5
    
    B = 2*y - 1;
    
else if y < 10
    
    B = 3*y^2-2
    
end

x = 3;
if x < 2
    A = 1
elseif x < 10
    A = 3;
elseif x < 100
    A = 4;
else
    A = 5;
end

x = 5;
y = 3;
    
if x <= y
    C = 1;
end

if x >= y
    C = 2;
end

if x == y
    C = 3;
end

if x ~= y
    C = 0;
end

%AND
if ((x <= y) && (x ~= y))
    D=1;
end

%OR
if ((x>y)||(x<y))
    D = 2;
end



end