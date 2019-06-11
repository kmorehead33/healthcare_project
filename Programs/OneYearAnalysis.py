# This program creates a funciton that anaylyzes one year's combined data from the NHIS
# It creates counts, means, percentages and runs significance testing
import pandas as pd
import numpy as np
from scipy import stats
import os

# This function will cross-check two means (ex. asthma rate) by a certain status (smoking, poverty)
def crosscheck(df2update,bydf,byvar,checkvar,desc,alldf):
    
    # Find means and sums and append columns to the StatsBySmokingStatus dataframe
    df2update[f"Percent with {desc}"] = 100 * bydf[f"{checkvar}"].mean()
    df2update[f"Number with {desc}"] = bydf[f"{checkvar}"].sum()

    # Run the t-test
    (t_stat, p) = stats.ttest_ind(alldf.loc[alldf[f"{byvar}"]==1,[f"{checkvar}"]],\
                                  alldf.loc[alldf[f"{byvar}"]==0,[f"{checkvar}"]],equal_var=False)

    df2update[f"{desc} Difference P-Value"] = p[0]
    if p < 0.05:
        df2update[f"{desc} Difference Significant"] = "Yes"
    else:
        df2update[f"{desc} Difference Significant"] = "No"

# This function collapses yes/no datasets into one line per year
def collapse2year(df2collapse,byvar,yesdesc,nodesc,compdesc):
    
    # Create two dataframes:  one with the yes-status.  One with the no-status
    yesdf = df2collapse[df2collapse[f'{byvar}']==1]
    nodf = df2collapse[df2collapse[f'{byvar}']==0]
    
    # on the yes dataframe keep the p-values and significance results as well as all of the flags
    yesdf = yesdf.filter(['Year','Count','Percent with Asthmatic Child', 'Number with Asthmatic Child', \
                      'Asthmatic Child Difference P-Value','Asthmatic Child Difference Significant',\
                      'Percent with Autistic Child', 'Number with Autistic Child', \
                      'Autistic Child Difference P-Value','Autistic Child Difference Significant',\
                      'Percent with ADHD/ADD Child', 'Number with ADHD/ADD Child', \
                      'ADHD/ADD Child Difference P-Value','ADHD/ADD Child Difference Significant',\
                      "Number with Concentration/Emotional/Behavior","Percent with Concentration/Emotional/Behavior",\
                      'Concentration/Emotional/Behavior Difference P-Value',\
                      'Concentration/Emotional/Behavior Difference Significant'])
    
    # Rename variables on the yes dataframe
    yesdf = yesdf.rename(columns={"Count": f"Count {yesdesc}", \
                         "Percent with Asthmatic Child": f"Asthma Rate {yesdesc}", \
                         "Number with Asthmatic Child": f"Count Asthma {yesdesc}", \
                         'Asthmatic Child Difference P-Value': f"Asthmatic Child Difference P-Value {compdesc}", \
                         'Asthmatic Child Difference Significant': f"Asthmatic Child Difference Significant {compdesc}", \
                         "Percent with ADHD/ADD Child": f"ADHD/ADD Rate {yesdesc}", \
                         "Number with ADHD/ADD Child": f"Count ADHD/ADD {yesdesc}", \
                         'ADHD/ADD Child Difference P-Value': f"ADHD/ADD Child Difference P-Value {compdesc}", \
                         'ADHD/ADD Child Difference Significant': f"ADHD/ADD Child Difference Significant {compdesc}", \
                         "Percent with Autistic Child": f"Autism Rate {yesdesc}", \
                         "Number with Autistic Child": f"Count Autism {yesdesc}", \
                         'Autistic Child Difference P-Value': f"Autistic Child Difference P-Value {compdesc}", \
                         'Autistic Child Difference Significant': f"Autistic Child Difference Significant {compdesc}", \
                         "Percent with Concentration/Emotional/Behavior": f"Concentration/Emotional/Behavior Rate {yesdesc}", \
                         "Number with Concentration/Emotional/Behavior": f"Count Concentration/Emotional/Behavior {yesdesc}", \
                         "Concentration/Emotional/Behavior Difference P-Value": f"Concentration/Emotional/Behavior Difference P-Value {compdesc}", \
                         "Concentration/Emotional/Behavior Difference Significant": f"Concentration/Emotional/Behavior Difference Significant {compdesc}"})

    nodf = nodf.filter(['Year','Count','Percent with Asthmatic Child', 'Number with Asthmatic Child', \
                      'Percent with Autistic Child', 'Number with Autistic Child', \
                      'Percent with ADHD/ADD Child', 'Number with ADHD/ADD Child', \
                      "Number with Concentration/Emotional/Behavior","Percent with Concentration/Emotional/Behavior"])
    
    nodf = nodf.rename(columns={"Count": f"Count {nodesc}", \
                              "Percent with Asthmatic Child": f"Asthma Rate {nodesc}", \
                              "Number with Asthmatic Child": f"Count Asthma {nodesc}", \
                              "Percent with ADHD/ADD Child": f"ADHD/ADD Rate {nodesc}", \
                              "Number with ADHD/ADD Child": f"Count ADHD/ADD {nodesc}", \
                              "Percent with Autistic Child": f"Autism Rate {nodesc}", \
                              "Number with Autistic Child": f"Count Autism {nodesc}", \
                              "Percent with Concentration/Emotional/Behavior": f"Concentration/Emotional/Behavior Rate {nodesc}", \
                              "Number with Concentration/Emotional/Behavior": f"Count Concentration/Emotional/Behavior {nodesc}"})

    # Merge the yes/no dataframes together to create the comparison for this year
    comparedf = pd.merge(yesdf,nodf,on=["Year"])
    comparedf[f"Percent {yesdesc}"] = 100 * comparedf[f"Count {yesdesc}"] / (comparedf[f"Count {yesdesc}"]  + comparedf[f"Count {nodesc}"] )
    comparedf[f"Percent {nodesc}"] = 100 * comparedf[f"Count {nodesc}"] / (comparedf[f"Count {yesdesc}"]  + comparedf[f"Count {nodesc}"] )
    
    # Add percentages to the combined dataframe
    return comparedf


# This function will analyze one year of data
def analyze_year(year):

    # Bring in this year's combined data
    outdatapath = os.path.join('..','output_data',f"year_{year}.csv")
    yeardata = pd.read_csv(outdatapath)
    
    yeardata.head()

    ##########################################################
    ##    Analyze child conditions against smoking status   ##
    ##########################################################

    # Use the value counts to determine the number of smoking households
    smkcounts = yeardata['HH with Smoker'].value_counts()

    # Group by the smoking status of the household so we can run stats
    BySmokingStatus = yeardata.groupby(['HH with Smoker'])

    # Convert the value counts into a dataframe and add year
    StatsBySmokingStatus = pd.DataFrame({'Smoker Flag':smkcounts.index, 'Count':smkcounts.values})
    StatsBySmokingStatus["Year"] = BySmokingStatus["SRVY_YR"].mean()

    crosscheck(df2update=StatsBySmokingStatus, \
               bydf=BySmokingStatus, \
               byvar='HH with Smoker', \
               checkvar='HH with Asthmatic Child', \
               desc='Asthmatic Child',
               alldf=yeardata)

    crosscheck(df2update=StatsBySmokingStatus, \
               bydf=BySmokingStatus, \
               byvar='HH with Smoker', \
               checkvar='HH with ADHD/ADD Child', \
               desc='ADHD/ADD Child',
               alldf=yeardata)

    crosscheck(df2update=StatsBySmokingStatus, \
               bydf=BySmokingStatus, \
               byvar='HH with Smoker', \
               checkvar='HH with Autistic Child', \
               desc='Autistic Child',
               alldf=yeardata)

    crosscheck(df2update=StatsBySmokingStatus, \
               bydf=BySmokingStatus, \
               byvar='HH with Smoker', \
               checkvar='HH with Child With Concentration/Emotional/Behavior Issues', \
               desc='Concentration/Emotional/Behavior',
               alldf=yeardata)
    
    compare_smoke = collapse2year(df2collapse=StatsBySmokingStatus,byvar='Smoker Flag', \
                                   yesdesc='in Smoking HH',nodesc='in Non-Smoking HH', \
                                   compdesc="for Smoking Status")

    ##########################################################
    ##    Analyze child conditions against poverty status   ##
    ##########################################################

    # Use the value counts to determine the number of impoverished families
    povertycounts = yeardata['HH in Poverty'].value_counts()

    # Group by the poverty status of the household so we can run stats
    ByPovertyStatus = yeardata.groupby(['HH in Poverty'])

    # Convert the value counts into a dataframe and add year
    StatsByPovertyStatus = pd.DataFrame({'Poverty Flag':povertycounts.index, 'Count':povertycounts.values})
    StatsByPovertyStatus["Year"] = ByPovertyStatus["SRVY_YR"].mean()

    crosscheck(df2update=StatsByPovertyStatus, \
               bydf=ByPovertyStatus, \
               byvar='HH in Poverty', \
               checkvar='HH with Asthmatic Child', \
               desc='Asthmatic Child',
               alldf=yeardata)

    crosscheck(df2update=StatsByPovertyStatus, \
               bydf=ByPovertyStatus, \
               byvar='HH in Poverty', \
               checkvar='HH with ADHD/ADD Child', \
               desc='ADHD/ADD Child',
               alldf=yeardata)

    crosscheck(df2update=StatsByPovertyStatus, \
               bydf=ByPovertyStatus, \
               byvar='HH in Poverty', \
               checkvar='HH with Autistic Child', \
               desc='Autistic Child',
               alldf=yeardata)

    crosscheck(df2update=StatsByPovertyStatus, \
               bydf=ByPovertyStatus, \
               byvar='HH in Poverty', \
               checkvar='HH with Child With Concentration/Emotional/Behavior Issues', \
               desc='Concentration/Emotional/Behavior',
               alldf=yeardata)

    compare_poverty = collapse2year(df2collapse=StatsByPovertyStatus,byvar='Poverty Flag', \
                                   yesdesc='in Impoverished HH',nodesc='in Non-Impoverished HH', \
                                   compdesc="for Poverty Status")

    #################################################################
    ##    Break year data into impoverished and non-impoverished   ##
    ##    households.  Rerun the comparisons to see if there is    ##
    ##    smoking/poverty interaction is clousing results          ##   
    #################################################################

    # Break the dataframe into impoverished and non-impoverished families.  Then rerun the analyses.
    poverty = yeardata[yeardata['HH in Poverty']==1] 
    nopoverty = yeardata[yeardata['HH in Poverty']==0] 

    # Find counts of smoking status in these dataframes
    psmk_pov_counts = poverty['HH with Smoker'].value_counts()
    npsmk_pov_counts = nopoverty['HH with Smoker'].value_counts()

    # Group by the smoking status of the household so we can run stats
    PovertyBySmoke = poverty.groupby(['HH with Smoker'])
    NoPovertyBySmoke = nopoverty.groupby(['HH with Smoker'])

    # Convert the value counts into a dataframe and add year
    StatsPovertyBySmoke = pd.DataFrame({'Smoking Flag':psmk_pov_counts.index, 'Count':psmk_pov_counts.values})
    StatsNoPovertyBySmoke = pd.DataFrame({'Smoking Flag':npsmk_pov_counts.index, 'Count':npsmk_pov_counts.values})

    # Add the year
    StatsPovertyBySmoke["Year"] = PovertyBySmoke["SRVY_YR"].mean()
    StatsNoPovertyBySmoke["Year"] = NoPovertyBySmoke["SRVY_YR"].mean()

    # Find means and run significance tests
    crosscheck(df2update=StatsPovertyBySmoke, \
               bydf=PovertyBySmoke, \
               byvar='HH with Smoker', \
               checkvar='HH with Asthmatic Child', \
               desc='Asthmatic Child',
               alldf=yeardata)

    crosscheck(df2update=StatsPovertyBySmoke, \
               bydf=PovertyBySmoke, \
               byvar='HH with Smoker', \
               checkvar='HH with ADHD/ADD Child', \
               desc='ADHD/ADD Child',
               alldf=yeardata)

    crosscheck(df2update=StatsPovertyBySmoke, \
               bydf=PovertyBySmoke, \
               byvar='HH with Smoker', \
               checkvar='HH with Autistic Child', \
               desc='Autistic Child',
               alldf=yeardata)

    crosscheck(df2update=StatsPovertyBySmoke, \
               bydf=PovertyBySmoke, \
               byvar='HH with Smoker', \
               checkvar='HH with Child With Concentration/Emotional/Behavior Issues', \
               desc='Concentration/Emotional/Behavior',
               alldf=yeardata)
    
    compare_poverty_bysmoking = collapse2year(df2collapse=StatsPovertyBySmoke,byvar='Smoking Flag', \
                               yesdesc='in Smoking Impoverished HH',nodesc='in Non-Smoking Impoverished HH', \
                               compdesc="for Smoking Status in Impoverished HH")

    # Find means and run significance tests
    crosscheck(df2update=StatsNoPovertyBySmoke, \
               bydf=NoPovertyBySmoke, \
               byvar='HH with Smoker', \
               checkvar='HH with Asthmatic Child', \
               desc='Asthmatic Child',
               alldf=yeardata)

    crosscheck(df2update=StatsNoPovertyBySmoke, \
               bydf=NoPovertyBySmoke, \
               byvar='HH with Smoker', \
               checkvar='HH with ADHD/ADD Child', \
               desc='ADHD/ADD Child',
               alldf=yeardata)

    crosscheck(df2update=StatsNoPovertyBySmoke, \
               bydf=NoPovertyBySmoke, \
               byvar='HH with Smoker', \
               checkvar='HH with Autistic Child', \
               desc='Autistic Child',
               alldf=yeardata)

    crosscheck(df2update=StatsNoPovertyBySmoke, \
               bydf=NoPovertyBySmoke, \
               byvar='HH with Smoker', \
               checkvar='HH with Child With Concentration/Emotional/Behavior Issues', \
               desc='Concentration/Emotional/Behavior',
               alldf=yeardata)

    compare_nopoverty_bysmoking = collapse2year(df2collapse=StatsNoPovertyBySmoke,byvar='Smoking Flag', \
                               yesdesc='in Smoking Non-Impoverished HH',nodesc='in Non-Smoking Non-Impoverished HH', \
                               compdesc="for Smoking Status in Non-Impoverished HH")
            
    #################################################################
    ##            Put everything together for one year.            ##   
    #################################################################
    compare_all = pd.merge(compare_smoke, \
                           pd.merge(compare_poverty, \
                                   pd.merge(compare_poverty_bysmoking,compare_nopoverty_bysmoking,on=['Year']), \
                                   on=['Year']), \
                           on=['Year'])

    return compare_all