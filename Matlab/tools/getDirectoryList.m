function [fileNames] = getDirectoryList(directoryPath)

    fileNames = {};

    listing = dir(directoryPath);
    
    for i = 1:1:length(listing)
        
        fileName = listing(i).name;
        
        if fileName(1) ~=  '.'
            
            fileNames{length(fileNames) + 1} = strcat(directoryPath, '/', fileName);
            
        end
        
    end

end