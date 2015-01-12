classdef sequence < handle
    
    %% Properties %%
    
    properties
        elements;
        height;
        width;
    end
    
    %% Methods %%
    
    methods
        
        %% Constuctor %%
        
        function obj = sequence()
            obj.elements = {};
            obj.height = -1;
            obj.width = -1;
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
        
        function fillFromImages(obj, imagesFilenames)
            for i = 1:1:length(imagesFilenames)
                image = double(imread(imagesFilenames{i}));
                obj.addElement(image);
            end
        end
        
        function fillFromDICOMs(obj, imagesFilenames)
            for i = 1:1:length(imagesFilenames)
                image = double(dicomread(imagesFilenames{i}));
                obj.addElement(image);
            end
        end
        
        function saveToImages(obj, path, extension, map)     
            for i = 1:1:getNumberOfElements(obj)
               image = normalizeImage(getElement(obj, i));
               [image, ~] = gray2ind(image);
               imwrite(image, map, strcat(path, num2str(i), '.', extension));
            end
        end
            
    end
    
end

