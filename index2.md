

# Sample analysis of Cancer Dependency Map (DepMap) data 
## Request
* Identify the most frequent genetic alterations (could be mutations or copy number variations) in the cancer cell lines
* Match them with the best genetic dependencies that could be used for drug development for the cancers that carry those mutations
* Take into account the lineage of cancer cell lines (certain mutations/CNVs may be restricted to a specific lineage)

## Resources
### DepMap (https://depmap.org/portal) Data 
* Cell line metadata
* Expression (RNASeq)
* Copy number variation
* Mutations
* Genetic dependency
  * Crispr (Achilles)
  * RNAi (DEMETER2)
  
<b>Citations:</b> 
* Jordan G. Bryan, John M. Krill-Burger, Thomas M. Green, Francisca Vazquez, Jesse S. Boehm, Todd R. Golub, William C. Hahn, David E. Root, Aviad Tsherniak. (2018). Improved estimation of cancer dependencies from large-scale RNAi screens using model-based normalization and data integration. Nature Communications 9, 1. https://doi.org/10.1038/s41467-018-06916-5</font>
* DepMap, Broad (2019): DepMap 19Q3 Public. figshare. Dataset doi:10.6084/m9.figshare.9201770.v1.
* Robin M. Meyers, Jordan G. Bryan, James M. McFarland, Barbara A. Weir, ... David E. Root, William C. Hahn, Aviad Tsherniak. Computational correction of copy number effect improves specificity of CRISPR-Cas9 essentiality screens in cancer cells. Nature Genetics 2017 October 49:1779–1784. doi:10.1038/ng.3984


### NCBI (via https://humanmine.org)
* Entrez gene IDs mapped to symbol, name, descrion, uniprot

### Reactome
* Entrez gene IDs mapped to Reactome pathways

### MFR (http://bmbl.sdstate.edu/MFR)
* A Machine Learning Model for measuring relatedness between a pair of genes

### Jupyter (https://jupyter.org/)
* Python programming framework for analysis prototyping and reporting

### GitHub (https://github.com/)
* Revision control for Python code
* Reporting mechanism for analysi summary and details


## Get gene descriptions, etc.
Use data from humanmine (http://www.humanmine.org/) to map NCBI gene IDs to name, summary, symbol, uniprot

sample gene info:
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>primaryIdentifier</th>
      <th>symbol</th>
      <th>briefDescription</th>
      <th>description</th>
      <th>proteins.uniprotAccession</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>2632</td>
      <td>GBE1</td>
      <td>1,4-alpha-glucan branching enzyme 1</td>
      <td>The protein encoded by this gene...</td>
      <td>Q04446</td>
    </tr>
    <tr>
      <td>3248</td>
      <td>HPGD</td>
      <td>15-hydroxyprostaglandin dehydrogenase</td>
      <td>This gene encodes...</td>
      <td>E9PBZ2</td>
    </tr>
  </tbody>
</table>

## Aggregate CCLE cell lines by lineage
<b>DepMap source file:</b> sample_info.csv
* Group all cell lines (CCLE cell line IDs) by main (parent) lineage
* If a lineage has > 1 defined sublineages, also aggregate cell lines by sublineage (eg: leukemia -> AML)

<pre>
Number of cell lines: 1429
Number of lineages: 33
Number of lineages with sub-lineages: 16
Number of sub-lineages 61
</pre>

## Expression Data (RNASeq)
RNAseq TPM gene expression data for just protein coding genes using RSEM. Log2 transformed, using a pseudo-count of 1.

<b>DepMap source file:</b> CCLE_expression.csv
* Transpose columns (gene names) and rows (CCLE cell line IDs)
* Translate gene names to NCBI gene IDs
* Apply BOOLEAN mask to accept log2 tpm > 0 as positive for expression

Sample expression data: <table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ACH-001097</th>
      <th>ACH-001485</th>
      <th>ACH-001396</th>
      <th>ACH-000534</th>
      <th>ACH-000742</th>
      <th>ACH-001818</th>
      <th>ACH-000545</th>
      <th>ACH-000836</th>
      <th>ACH-001959</th>
      <th>ACH-000470</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>7105</th>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>2.883621</td>
      <td>0.839960</td>
      <td>3.722466</td>
      <td>4.032982</td>
      <td>4.251719</td>
      <td>4.632268</td>
      <td>3.321928</td>
      <td>3.681449</td>
    </tr>
    <tr>
      <th>64102</th>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>8813</th>
      <td>4.667324</td>
      <td>5.755689</td>
      <td>4.471838</td>
      <td>5.376082</td>
      <td>6.029674</td>
      <td>5.933100</td>
      <td>5.651052</td>
      <td>6.704180</td>
      <td>7.357288</td>
      <td>7.294896</td>
    </tr>
  </tbody>
</table>
<br>Sample masked expression: <table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ACH-001097</th>
      <th>ACH-001485</th>
      <th>ACH-001396</th>
      <th>ACH-000534</th>
      <th>ACH-000742</th>
      <th>ACH-001818</th>
      <th>ACH-000545</th>
      <th>ACH-000836</th>
      <th>ACH-001959</th>
      <th>ACH-000470</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>7105</th>
      <td>False</td>
      <td>False</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
    </tr>
    <tr>
      <th>64102</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>8813</th>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
    </tr>
  </tbody>
</table>

## Mutation Data 
<b>DepMap source file:</b> CCLE_mutations.csv
* Keep track of TCGA and COSMIC hotspot genes by lineage
* Just using hotspot genes for now but track deleterious mutations by lineage for future reference

8704 TCGA or COSMIC hotspot genes

## Copy number data
Gene level copy number data, log2 transformed with a pseudo count of 1. This is generated by mapping genes onto the segment level calls.

<b>Depmap source file:</b> CCLE_gene_cn_v2.csv

* Transpose columns (gene names) and rows (CCLE cell line IDs)
* Translate gene names to NCBI gene IDs

Sample copy number data: <table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ACH-001793</th>
      <th>ACH-002176</th>
      <th>ACH-000652</th>
      <th>ACH-001295</th>
      <th>ACH-000798</th>
      <th>ACH-001399</th>
      <th>ACH-000111</th>
      <th>ACH-002358</th>
      <th>ACH-000367</th>
      <th>ACH-000584</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>1.086422</td>
      <td>1.526188</td>
      <td>0.776609</td>
      <td>0.964857</td>
      <td>0.986651</td>
      <td>1.097441</td>
      <td>1.577719</td>
      <td>0.990491</td>
      <td>0.972714</td>
      <td>1.232228</td>
    </tr>
    <tr>
      <th>10</th>
      <td>1.103066</td>
      <td>1.044267</td>
      <td>0.520576</td>
      <td>1.001427</td>
      <td>0.974178</td>
      <td>0.775405</td>
      <td>1.209647</td>
      <td>1.001602</td>
      <td>0.564791</td>
      <td>0.379099</td>
    </tr>
    <tr>
      <th>100</th>
      <td>0.910926</td>
      <td>1.089161</td>
      <td>1.555780</td>
      <td>1.010086</td>
      <td>0.987801</td>
      <td>1.877675</td>
      <td>0.826138</td>
      <td>0.999580</td>
      <td>1.128533</td>
      <td>1.254932</td>
    </tr>
  </tbody>
</table>
Samlpe copy number data descritive stats: <table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ACH-001793</th>
      <th>ACH-002176</th>
      <th>ACH-000652</th>
      <th>ACH-001295</th>
      <th>ACH-000798</th>
      <th>ACH-001399</th>
      <th>ACH-000111</th>
      <th>ACH-002358</th>
      <th>ACH-000367</th>
      <th>ACH-000584</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>27639.000000</td>
      <td>2.763900e+04</td>
      <td>2.763900e+04</td>
      <td>2.763900e+04</td>
      <td>27639.000000</td>
      <td>27639.000000</td>
      <td>2.763900e+04</td>
      <td>27639.000000</td>
      <td>2.763900e+04</td>
      <td>27639.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>1.098416</td>
      <td>1.005611e+00</td>
      <td>9.739989e-01</td>
      <td>1.061859e+00</td>
      <td>1.019288</td>
      <td>1.057222</td>
      <td>1.127191e+00</td>
      <td>0.980485</td>
      <td>9.532559e-01</td>
      <td>1.057527</td>
    </tr>
    <tr>
      <th>std</th>
      <td>1.119507</td>
      <td>3.482645e-01</td>
      <td>2.416796e-01</td>
      <td>6.685549e-01</td>
      <td>0.123101</td>
      <td>0.306522</td>
      <td>3.919352e-01</td>
      <td>0.092264</td>
      <td>2.693422e-01</td>
      <td>0.366487</td>
    </tr>
    <tr>
      <th>min</th>
      <td>0.171960</td>
      <td>7.998209e-10</td>
      <td>8.220704e-10</td>
      <td>7.984062e-10</td>
      <td>0.000036</td>
      <td>0.000020</td>
      <td>1.102449e-09</td>
      <td>0.000021</td>
      <td>8.282854e-10</td>
      <td>0.000009</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>0.889299</td>
      <td>7.318536e-01</td>
      <td>7.900758e-01</td>
      <td>9.845272e-01</td>
      <td>0.982870</td>
      <td>0.812673</td>
      <td>8.295737e-01</td>
      <td>0.993549</td>
      <td>6.015790e-01</td>
      <td>0.700131</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>1.053484</td>
      <td>1.045336e+00</td>
      <td>1.027553e+00</td>
      <td>9.942944e-01</td>
      <td>0.986097</td>
      <td>1.003401</td>
      <td>9.373404e-01</td>
      <td>0.999580</td>
      <td>1.056217e+00</td>
      <td>0.990265</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>1.113955</td>
      <td>1.111985e+00</td>
      <td>1.068509e+00</td>
      <td>1.002200e+00</td>
      <td>0.989550</td>
      <td>1.120454</td>
      <td>1.321072e+00</td>
      <td>1.002886</td>
      <td>1.131187e+00</td>
      <td>1.262886</td>
    </tr>
    <tr>
      <th>max</th>
      <td>35.734800</td>
      <td>4.952679e+00</td>
      <td>4.804283e+00</td>
      <td>3.963217e+01</td>
      <td>1.462469</td>
      <td>3.217691</td>
      <td>3.229879e+00</td>
      <td>1.006658</td>
      <td>1.729972e+00</td>
      <td>3.354475</td>
    </tr>
  </tbody>
</table>

## Search for high copy number genes in each of the lineages
* Seleting genes with copy number > 2 in <b><i>all</i></b> cell lines is a lineage is a bit too stringent
* Retain genes that have copy number >= 2 in 80% or more cell lines in a lineage
* Extract the data for any cell lines with high copy number genes to use as plotting baseline

<pre>
skin_epidermoid_carcinoma; 1 cell lines; 234 high copy number genes
skin_squamous; 3 cell lines; 251 high copy number genes
esophagus_adenocarcinoma; 7 cell lines; 7 high copy number genes
upper_aerodigestive_buccal_mucosa; 1 cell lines; 592 high copy number genes
bone_chordoma; 4 cell lines; 11 high copy number genes
lung_immortalized; 1 cell lines; 6 high copy number genes
ovary_immortalized; 1 cell lines; 9 high copy number genes
gastric_adenosquamous; 1 cell lines; 508 high copy number genes
eye_uveal_melanoma; 5 cell lines; 1016 high copy number genes
breast_ERneg; 1 cell lines; 960 high copy number genes
breast_HER2Amp; 13 cell lines; 11 high copy number genes
breast_immortalized; 2 cell lines; 8 high copy number genes
soft_tissue_epitheliod_sarcoma; 2 cell lines; 2 high copy number genes
soft_tissue_fibrosarcoma; 1 cell lines; 2 high copy number genes
soft_tissue_liposarcoma; 5 cell lines; 44 high copy number genes
soft_tissue_sarcoma_undifferentiated; 2 cell lines; 164 high copy number genes
lymphoblastic_lymphoma; 1 cell lines; 311 high copy number genes
adrenal_cortex; 1 cell lines; 200 high copy number genes
central_nervous_system_PNET; 1 cell lines; 2 high copy number genes
central_nervous_system_immortalized; 1 cell lines; 26 high copy number genes
peripheral_nervous_system_PNET; 1 cell lines; 22 high copy number genes
</pre>

## DEMETER2 RNAi gene dependency data
Cancer cell line genetic dependencies estimated using the DEMETER2 model. DEMETER2 is applied to three large-scale RNAi screening datasets: the Broad Institute Project Achilles, Novartis Project DRIVE, and the Marcotte et al. breast cell line dataset. The model is also applied to generate a combined dataset of gene dependencies covering a total of 712 unique cancer cell lines.

<b>DepMap source file:</b> D2_combined_gene_dep_scores.csv 

* Data source uses CCLE names rather than DepMap cell line IDS
* Translate the cell line names to IDS for consistency with other data sources
* Also deal with rows in the table with multiple gene names (eg 'GTF2IP4&GTF2IP1 (100093631&2970)')


## Achilles Crispr gene dependency data
CERES data with principle components strongly related to known batch effects removed, then shifted and scaled per cell line so the median nonessential KO effect is 0 and the median essential KO effect is -1.

<b>DepMap source file:</b> Achilles_gene_effect.csv 

* Translate gene names (column labels) to NCBI IDS
* Transpose rows and columns so each cell line is a column label with vertivally stacked gene data

Sample Achilles data:
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ACH-000004</th>
      <th>ACH-000005</th>
      <th>ACH-000007</th>
      <th>ACH-000009</th>
      <th>ACH-000011</th>
      <th>ACH-000012</th>
      <th>ACH-000013</th>
      <th>ACH-000014</th>
      <th>ACH-000015</th>
      <th>ACH-000017</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>0.168684</td>
      <td>-0.068759</td>
      <td>0.053893</td>
      <td>0.059874</td>
      <td>0.277165</td>
      <td>0.008073</td>
      <td>0.062131</td>
      <td>0.143078</td>
      <td>-0.090890</td>
      <td>0.178427</td>
    </tr>
    <tr>
      <th>29974</th>
      <td>0.089128</td>
      <td>0.218792</td>
      <td>0.081444</td>
      <td>-0.011153</td>
      <td>0.085354</td>
      <td>0.167177</td>
      <td>0.038687</td>
      <td>-0.035837</td>
      <td>0.007894</td>
      <td>0.106952</td>
    </tr>
  </tbody>
</table>

### How many cell lines and genes are shared between D2 (RNAi) and Achilles (Crispr) gene dependency data sets?

<pre>
423 cell lines are shared
16052 genes are shared
</pre>
<img src="plots/gene_dependency.png" style="float:left">
* significant p-value means reject H0 that slope == 0
* We will use the Achilles (Crispr) gene dependency score and check for positive agreement with RNAi later

### Sanity checking with ERBB2 (2064)
Evaluating breast cancer lineages where at least one cell line had copy number > 2:
* Is ERB2B in the hotspot gene set?
* We expect ERBB2 to have high copy number in breast cancer lineages
  ** What is the mean ERB2B copy number in breast cancers?
* The gene dependency score should be < 0
  ** What is the mean gene dependency score in breast cancers?

ERBB2 is in hotspot gene set? <b>TRUE</b>
<pre>
ERBB2 mean copy number for breast_TPBC (5 cell lines): 9.59
ERBB2 mean copy number for breast_TNBC (27 cell lines): 1.89
ERBB2 mean copy number for breast_HER2Amp (11 cell lines): 14.84
ERBB2 mean gene dependency for breast_HER2Amp (6 cell lines): -0.83
ERBB2 mean gene dependency for breast_ERpos (7 cell lines): -0.27
ERBB2 mean gene dependency for breast_TNBC (15 cell lines): -0.28
</pre>

## Lineages with observed high copy number genes

* Go through the list of lineages with high copy number genes
* Plot gene dependency vs. copy number
* Highlight genes/cell-lines with copy number > 2 and gene dependency < 0 for specific lineages

### Copy number vs gene dependency

<img src="plots/breast_HER2Amp.png" style="float:left">
<img src="plots/skin_epidermoid_carcinoma.png" style="float:left">
<img src="plots/eye_uveal_melanoma.png" style="float:left">
<img src="plots/esophagus_adenocarcinoma.png" style="float:left">
<img src="plots/soft_tissue_fibrosarcoma.png" style="float:left">
<img src="plots/upper_aerodigestive_buccal_mucosa.png" style="float:left">
<img src="plots/skin_squamous.png" style="float:left">
<img src="plots/soft_tissue_epitheliod_sarcoma.png" style="float:left">
