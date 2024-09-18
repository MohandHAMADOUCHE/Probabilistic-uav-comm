function add_bnt_paths()
    myPath = genpathKPM('C:\Users\info\Downloads\bnt-master\bnt-master');  % Modify as needed
    
    setenv('MY_PATH', myPath);
    addpath(myPath);
end

