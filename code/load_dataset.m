% load dataset
dataset_filenames = { ...
    'and-results Ms.Eibl-Dox 2nd - p.txt', ...
    'and-results Ms.Eibl-Dox 2nd - p.txt', ...
    'and-results Ms.Eibl-Dox 2nd - p.txt', ...
    };
dataset_filename_base = 'data/';

all_data = [];
one_sample = zeros(1, 14);
tmp_line = '';

for step = 1:length(dataset_filenames)
    strcat(dataset_filename_base, dataset_filenames{step})
    fid = fopen( strcat(dataset_filename_base, dataset_filenames{step}) );
    
    line_num = 0;
    while true
        tmp_line = fgetl(fid); % get one line first
        if ~ischar(tmp_line) % check if the file has ended
            break;
        end
        line_num = line_num + 1;
        
        if line_num == 1 % we don't need the first line
            continue;
        end
            
        pieces = strsplit( ',', tmp_line ); % split the line using comma
        for step2 = 2:15 % for one pieces( a line), we dont need the first element
            one_sample(1, step2-1) = str2double( pieces{step2} );
        end
        all_data = [all_data; one_sample];
        
    end
    fclose(fid);
end


