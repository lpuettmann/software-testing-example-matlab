function tests = test_add_one
    tests = functiontests(localfunctions);
end

function test_normal1(testCase)
    x = 1;
    actSol = add_one(x);
    expSol = 2;
    verifyEqual(testCase, actSol, expSol)
end

function test_normal_pi(testCase)
    x = pi;
    actSol = add_one(x);
    expSol = pi + 1;
    verifyEqual(testCase, actSol, expSol)
end

function test_irrationalNr(testCase)
    x = 3 + i;
    actSol = add_one(x);
    expSol = 4 + i;
    verifyEqual(testCase, actSol, expSol)
end

function test_negative(testCase)
    x = -5;
    actSol = add_one(x);
    expSol = -4;
    verifyEqual(testCase, actSol, expSol)
end

function test_matrix(testCase)
    x = [1, 2; 3, 4];
    actSol = add_one(x);
    expSol = [2, 3; 4, 5];
    verifyEqual(testCase, actSol, expSol)
end

function test_empty(testCase)
    x = [];
    y = add_one(x);
    actSol = +isempty(y); % plus converts logical to double
    expSol = 1;
    verifyEqual(testCase, actSol, expSol)
end

function test_nan(testCase)
    x = nan;
    y = add_one(x);
    actSol = +isnan(y); % plus converts logical to double
    expSol = 1;
    verifyEqual(testCase, actSol, expSol)
end

function test_stringError(testCase)
    x = 'Hello world';
    
    try
        y = add_one(x);
        actSol = 0;
    catch
        actSol = 1;
    end        
    
    expSol = 1;
    verifyEqual(testCase, actSol, expSol)
end
