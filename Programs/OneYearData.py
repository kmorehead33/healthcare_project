# This program creates a funciton that reads one year's worth of family, adult, and child data from the NHIS
# It creates key indicator variables and merges into one dataframe that can be used in significance training and trends

import pandas as pd
import os
from ReadData import ReadFile

def OneYearData(year, *args, **kwargs):
        
    ##############################
    ##         Family           ##
    ##############################
        
    # Run the read-file function to pull the family data from the sas and ascii files
    Familydf = ReadFile(year,'familyxx')
    
    # Set up the variables we will be creating
    Familydf['HH with Food Concern due to Money']=0
    Familydf['HH with Children']=0   
    
    for index, row in Familydf.iterrows():
    
        # Use variables indicating family was worried food would run out
        if Familydf.loc[index, 'FSRUNOUT'] in (1,2):
            Familydf.loc[index, 'HH with Food Concern due to Money'] = 1
        if Familydf.loc[index, 'FSLAST'] in (1,2):
            Familydf.loc[index, 'HH with Food Concern due to Money'] = 1
        
        # Set family-with-children indicator using the family type variable
        if Familydf.loc[index, 'FM_TYPE'] in (3,4):
            Familydf.loc[index, 'HH with Children'] = 1
    
    # Reduce family data to only the variables we need for analysis
    Familydf = Familydf.filter(['SRVY_YR','HHX','FMX', 'FM_SIZE', 'FM_TYPE', 'HH with Children'
                                'HH with Food Concern due to Money', 'WTFA_FAM','REGION'])
            
    ##############################
    ##          Adult           ##
    ##############################

    # Run the read-file function to pull the adult data from the sas and ascii files
    Adultdf = ReadFile(year,'samadult')
        
    # Create placeholders for the variables we will be creating
    Adultdf['HH with Smoker']=0
    
    for index, row in Adultdf.iterrows():
    
        # Use smoking status variable to flag the person as a smoker (or not)
        if Adultdf.loc[index,'SMKSTAT2'] in (1,2,5):
            Adultdf.loc[index,'HH with Smoker'] = 1
    
    # Reduce adult data to only the variables we need for analysis
    Adultdf = Adultdf.filter(['HHX','FMX','HH with Smoker'])


    ##############################
    ##          Child           ##
    ##############################
    
    # Run the read-file function to pull the adult data from the sas and ascii files
    Childdf = ReadFile(year,'samchild')
    
   
    # Create placeholders for the variables we will be creating
    Childdf['HH with Asthmatic Child']=0
    Childdf['HH with ADHD/ADD Child']=0
    Childdf['HH with Autistic Child']=0
    Childdf['HH with Child With Concentration/Emotional/Behavior Issues']=0
    
    for index, row in Childdf.iterrows():
    
        # Check variables related to autism diagnoses
        if Childdf.loc[index,'CASHMEV'] == 1:
            Childdf.loc[index,'HH with Asthmatic Child'] = 1
        if Childdf.loc[index, 'ADD2N'] == 1:
            Childdf.loc[index, 'HH with ADHD/ADD Child'] = 1
        if Childdf.loc[index, 'AUTISMN']== 1:
            Childdf.loc[index,'HH with Autistic Child'] = 1

        # Check if child has been diagnosed with any concentration, emotional or behavioral issues
        if Childdf.loc[index, 'RSCL6'] in (1,2,3):
            Childdf.loc[index, 'HH with Child With Concentration/Emotional/Behavior Issues'] = 1     
           
    # Reduce to only the variables we need for analysis
    Childdf = Childdf.filter(['HHX','FMX','HH with Asthmatic Child', 'HH with ADHD/ADD Child',
                              'HH with Autistic Child','HH with Child With Concentration/Emotional/Behavior Issues'])
  
    ##############################
    ##   Merge Adult/Child      ##
    ##############################
    
    # Merg the adult and child info into one dataframe
    merge_adult_child = pd.merge(Adultdf, Childdf, on=["HHX","FMX"])
    acvars = len(merge_adult_child.columns.tolist())
    acrecs = len(merge_adult_child['HHX'].tolist())
    print(f"Results:  adult/child Year {year} Dataframe created with {acrecs} rows and {acvars} columms.")

    
    ##############################
    ##   Merge Family info      ##
    ##############################
    family_merge = pd.merge(Familydf, merge_adult_child, on=['HHX', 'FMX'])    
    allvars = len(family_merge.columns.tolist())
    allrecs = len(family_merge['HHX'].tolist())
    print(f"Results:  final Year {year} Dataframe created with {allrecs} rows and {allvars} columms.")

    outdatapath = os.path.join('..','output_data',"year_{year}.csv")
    family_merge.to_csv(outdatapath, index=False, header=True)
    print(f"Dataframe output to {outdatapath}")

    return family_merge
    