

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

Sample expression data: 
<br><table border="1" class="dataframe">
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
<br>Sample masked expression: 
<br><table border="1" class="dataframe">
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

