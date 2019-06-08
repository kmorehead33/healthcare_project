import os
import pandas as pd


# Create a funciton that will read any file for a particular year by
# 1. Reading the SAS program and searching for the input statement to get the variable names and formats
# 2. Taking infomration from the SAS file and passing them into a function to read the flat file (.dat)
def ReadFile(year,filename):
    
    print(f"Reading in file {filename} for year {year}")

    datapath = os.path.join('..','data',f'{year}')
    sasfile2read=os.path.join(datapath,f'{filename}.sas')
    datfile2read=os.path.join(datapath,f'{filename}.dat')
    
    f = open(sasfile2read, "r") 

    line_starting_input = 0
    line_ending_input = 0
    line_number = -1

    input_lines = []

    for x in f:

        line_number = line_number + 1
    
        # remove carriage returns
        x = x.replace("\n","")
        
        # The input lines start at the input statement that is not part of a comment and does not contain a semi-colon
        if x.upper().find('INPUT') > -1 and x.upper().find(';') == -1 and x.upper().find('*') == -1:
            line_starting_input = line_number

        # The input statement ends with the first semi-colon after it starts
        if line_starting_input > 0 and line_ending_input == 0 and x.find(';') > -1:
            line_ending_input = line_number
        
        # If this current line of code is...
        # 1. between the start and stop of the input 
        # 2. Not a comment line  (Note that the programs we are looking at have only full-line comments with no code)
        # 3. Not a blank line
        # Then we save it as one of the code lines
        if line_starting_input > 0 and line_number >= line_starting_input and \
            (line_ending_input == 0 or line_number <= line_ending_input) and \
            x.upper().find('*') == -1 and x.replace(" ","") != '':
            input_lines.append(x)
    
    f.close
          
    # create lists for variable names, starting position, ending position, and character flag
    varnames=[]
    starts=[]
    ends=[]
    charflags=[]
    widths=[]
    varcount = -1

    # loop through the input lines and pull the variable information into the lists
    for line in input_lines:

        # take off leading and trailing spaces
        line = line.strip()

        # The dash tells us how many variables are specified in the line of code
        # This particular codes has either 0 (count=0), 1 (count = 1), or 2 (count = 2)
        if line.count('-') > 0:
        
            templist = line.split()
       
            for word in templist:
            
                # remove any spaces or semi-colons in the word
                word = word.replace(' ','')
                word = word.replace(';','')
                        
                # Test to see if the word starts with a letter or underscore. If so, this is a variable name.
                if word[0].isalpha()==True or word[0]== "_":
                                
                    # Increment the number of variables
                    varcount = varcount + 1
                
                    # Store the variable name with no spaces
                    varnames.append(word)
                
                    # Set the type as numeric. We will reset this if we see a $ before the start/end
                    charflags.append(False)
                
                    # Set indicator to say if we have determined the start
                    found_start = False
                
                # Test to see if the word is $.  If so, change the character flag for this variable
                elif word == '$':
                    charflags[varcount] = True
           
                # If this is numeric, then it is either the start or stop place.
                elif word.isnumeric()==True:
                                
                    # If we have not yet found a start then this must be the start
                    # Otherwise it must be the end. Set the end and caluclate the width
                    if found_start == False:
                    
                        starts.append(word)
                        found_start = True                    
                    
                    else:
                        ends.append(word)
                        widths.append(int(ends[varcount]) - int(starts[varcount]) + 1)

    # Use the lists we created to read the data from the flat file (fwf=fixed width file)
    dfout = pd.read_fwf(datfile2read, widths=widths, names=varnames,parse_dates=True)

    # convert columns to string if they were specified that way in the sas code
    for i in range(len(charflags)):
        if charflags[i]==True:
            dfout[varnames[i]]=dfout[varnames[i]].astype(str)
    
    numvars = line_number + 1
    numrecs = len(dfout[varnames[0]])
    print(f"Results:  Dataframe created with {numrecs} rows and {numvars} columms.")

    # output the dataset
    return dfout