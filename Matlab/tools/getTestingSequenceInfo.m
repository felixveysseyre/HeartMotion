function [fileNames, type] = getTestingSequenceInfo(dataDirectory, sequenceName)

    if strcmp(sequenceName, 'TestingSequence0') == 1 ...
        || strcmp(sequenceName, 'TestingSequence1') == 1 ...
        || strcmp(sequenceName, 'TestingSequence2') == 1 ...
        || strcmp(sequenceName, 'TestingSequence3') == 1 ...
        || strcmp(sequenceName, 'TestingSequence3.5') == 1 ...
                
        directory = strcat(dataDirectory, sequenceName);
        fileNames = getDirectoryList(directory);
        type = 'image';

    elseif strcmp(sequenceName, 'Sequence1') == 1 ...
        || strcmp(sequenceName, 'Sequence2') == 1

        directory = strcat(dataDirectory, sequenceName);
        fileNames = getDirectoryList(directory);
        type = 'DICOM';
        
    else
        
        'WARNING: unknown sequence'
    
    end

end