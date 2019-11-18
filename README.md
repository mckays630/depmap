

# Sample analysis of Cancer Dependency Map (DepMap) data 
## Request
* Identify the most frequent genetic alterations (could be mutations or copy number variations) in the cancer cell lines
* Match them with the best genetic dependencies that could be used for drug development for the cancers that carry those mutations
* Take into account the lineage of cancer cell lines (certain mutations/CNVs may be restricted to a specific lineage)

## Resources
### DepMap (https://depmap.org/portal) Data 
* Cell line metadata
* Expression
 * RNAseq
 * Protein
* Copy number variation
* Mutations
* Genetic dependency
 * Crispr (Achilles)
 * RNAi (DEMETER2)

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



## Get gene descriptions, etc
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
      <td>The protein encoded by this gene is a glycogen branching enzyme that catalyzes the transfer of alpha-1,4-linked glucosyl units from the outer end of a glycogen chain to an alpha-1,6 position on the same or a neighboring glycogen chain. Branching of the chains is essential to increase the solubility of the glycogen molecule and, consequently, in reducing the osmotic pressure within cells. Highest level of this enzyme are found in liver and muscle. Mutations in this gene are associated with glycogen storage disease IV (also known as Andersen's disease). [provided by RefSeq, Jul 2008]</td>
      <td>Q04446</td>
    </tr>
  </tbody>
</table>

## Aggregate cell lines by lineage
<b>DepMap source file:</b> sample_info.csv
* Group all cell lines by main (parent) lineage
* If a lineage has > 1 defined sublineages, also aggregate cell lines by sublineage (eg: leukemia -> AML)

<pre>
Number of cell lines: 1429
Number of lineages: 33
Number of lineages with sub-lineages: 16
Number of sub-lineages 61
</pre>

## Mutation Data 
<b>DepMap source file:</b> CCLE_mutations.csv
* Keep track of TCGA and COSMIC hotspot genes by lineage
* Track deleterious mutations by lineage for future reference


## DEMETER2 RNAi gene dependency data
Cancer cell line genetic dependencies estimated using the DEMETER2 model. DEMETER2 is applied to three large-scale RNAi screening datasets: the Broad Institute Project Achilles, Novartis Project DRIVE, and the Marcotte et al. breast cell line dataset. The model is also applied to generate a combined dataset of gene dependencies covering a total of 712 unique cancer cell lines.

<b>DepMap source file:</b> D2_combined_gene_dep_scores.csv 

<b>Citation:</b> Jordan G. Bryan, John M. Krill-Burger, Thomas M. Green, Francisca Vazquez, Jesse S. Boehm, Todd R. Golub, William C. Hahn, David E. Root, Aviad Tsherniak. (2018). Improved estimation of cancer dependencies from large-scale RNAi screens using model-based normalization and data integration. Nature Communications 9, 1. https://doi.org/10.1038/s41467-018-06916-5</font>

* Data source uses CCLE names rather than DepMap cell line IDS
* Translate the cell line names to IDS for consistency with other data sources
* Also deal with rows in the table with multiple gene names (eg 'GTF2IP4&GTF2IP1 (100093631&2970)')


## Achilles Crispr gene dependency data
CERES data with principle components strongly related to known batch effects removed, then shifted and scaled per cell line so the median nonessential KO effect is 0 and the median essential KO effect is -1.

<b>DepMap source file:</b> Achilles_gene_effect.csv 

<b>Citation:</b> DepMap, Broad (2019): DepMap 19Q3 Public. figshare. Dataset doi:10.6084/m9.figshare.9201770.v1.
<br>
Robin M. Meyers, Jordan G. Bryan, James M. McFarland, Barbara A. Weir, ... David E. Root, William C. Hahn, Aviad Tsherniak. Computational correction of copy number effect improves specificity of CRISPR-Cas9 essentiality screens in cancer cells. Nature Genetics 2017 October 49:1779–1784. doi:10.1038/ng.3984

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
      <th>ACH-000018</th>
      <th>ACH-000019</th>
      <th>ACH-000021</th>
      <th>ACH-000022</th>
      <th>ACH-000025</th>
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
      <td>-0.020829</td>
      <td>0.179394</td>
      <td>-0.069118</td>
      <td>0.023515</td>
      <td>0.000379</td>
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
      <td>0.080596</td>
      <td>-0.051912</td>
      <td>0.046006</td>
      <td>0.115700</td>
      <td>-0.096151</td>
    </tr>
  </tbody>
</table>

### How many cell lines and genes are shared between D2 (RNAi) and Achilles (Crispr) gene dependency data sets?

* 423 cell lines are shared
* 16052 genes are shared

## Copy number data
Gene level copy number data, log2 transformed with a pseudo count of 1. This is generated by mapping genes onto the segment level calls.

<b>Depmap source file:</b> CCLE_gene_cn_v2.csv

* Transpose columns (gene names) and rows (CCLE cell line IDs)
* Translate gene names to NCBI gene IDs

<pre>
423 cell lines are shared
16052 genes are shared
</pre>
