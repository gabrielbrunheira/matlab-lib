function [old_filenames,new_filenames] = rename_files(old_str,new_str,file_type)

folder = uigetdir
filenames = dir(strcat(folder,"\*.",file_type));

old_filenames = {};
new_filenames = {};

for idx_file = 1:length(filenames)
    old_filename = filenames(idx_file).name;
    
    if strfind(old_filename, old_str) > 0
        new_filename = replace(old_filename, old_str, new_str);

        old_filenames = [old_filenames; old_filename];
        new_filenames = [new_filenames; new_filename];

        movefile(strcat(folder, '\', old_filename), ...
                 strcat(folder, '\', new_filename));

        display(sprintf('OLD FILENAME: %s \nNEW FILENAME: %s\n\n', ...
                old_filename, new_filename))
    end
end