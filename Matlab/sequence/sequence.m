classdef sequence < handle
    
    %% Properties %%
    
    properties
        elements;
        height;
        width;
    end
    
    %% Methods %%
    
    methods
        
        %% Constuctors %%
        
        function obj = sequence()
            obj.elements = {};
            obj.height = -1;
            obj.width = -1;
        end
        
        function new = copy(obj)
            new = feval(class(obj));
            p = properties(obj);
            
            for i = 1:length(p)
                new.(p{i}) = obj.(p{i});
            end
        end
        
        %% Others methods %%
        
        function numberOfElements = getNumberOfElements(obj)
           numberOfElements = length(obj.elements); 
        end
        
        function size = getSizeOfElements(obj)
            size = [obj.height, obj.width];
        end
        
        function addElement(obj, elementToAdd)
            numberOfElements = obj.getNumberOfElements();
            
            obj.elements{numberOfElements + 1} = elementToAdd;
            
            if numberOfElements == 0
                [obj.height, obj.width] = size(elementToAdd);
            else
                if isequal(obj.getSizeOfElements(), size(elementToAdd)) == 0
                    'WARNING: Element and sequence have not the same size'
                end
            end
        end
        
        function element = getElement(obj, i)
           element = obj.elements{i}; 
        end
        
        function fillFromImages(obj, imagesFilenames, limit)
            for i = 1:1:min(length(imagesFilenames), limit) 
                image = double(imread(imagesFilenames{i}));
                obj.addElement(image);
            end
        end
        
        function fillFromDICOMs(obj, imagesFilenames, limit)
            for i = 1:1:min(length(imagesFilenames), limit)
                image = double(dicomread(imagesFilenames{i}));
                obj.addElement(image);
            end
        end
        
        function fillFromTestingSequence(obj, dataDirectory, sequenceName, limit)
            [imagesFilenames, type] = getTestingSequenceInfo(dataDirectory, sequenceName);
            
            if strcmp(type, 'image') == 1
                obj.fillFromImages(imagesFilenames, limit);
            elseif strcmp(type, 'DICOM') == 1
                obj.fillFromDICOMs(imagesFilenames, limit);
            end
        end
        
        function saveToImages(obj, path, extension, map)     
            for i = 1:1:getNumberOfElements(obj)
               image = normalizeImage(getElement(obj, i));
               [image, ~] = gray2ind(image);
               imwrite(image, map, strcat(path, num2str(i), '.', extension));
            end
        end
        
        function filterWithWindow(obj, window)
            for i = 1:1:getNumberOfElements(obj)
               image = normalizeImage(getElement(obj, i));
               filteredImage = conv2(image, window, 'same');
               obj.elements{i} = filteredImage;
            end
        end
        
        function filter(obj, windowSize, windowType)
            window = getWindow(windowSize, windowType);
            obj.filterWithWindow(window);
        end
            
    end
    
end

