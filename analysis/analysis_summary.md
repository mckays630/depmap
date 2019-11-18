

## Get gene descriptions, etc
Use data from humanmine (http://www.humanmine.org/) to map NCBI gene IDs to name, summary, symbol, uniprot


## Aggregate cell lines by lineage
* CCLE Cell line metadata downloaded from DepMap
* Group all cell lines by lineage
* If a lineage has > 1 defined sublineages, also segregate cell lines by sublineages (eg: leukemia -> AML)

Number of cell lines 1429
Number of lineages 33
Number of sub-lineages 61

## Mutations 
<b>DepMap source file:</b> CCLE_mutations.csv
* Keep track of TCGA and COSMIC hotspot genes by lineage
* Track deleterious mutations by lineage for future reference


## Ingest DEMETER2 Data v5 combines RNAi gene dependency data
DEMETER2 Data v5
Cancer cell line genetic dependencies estimated using the DEMETER2 model. DEMETER2 is applied to three large-scale RNAi screening datasets: the Broad Institute Project Achilles, Novartis Project DRIVE, and the Marcotte et al. breast cell line dataset. The model is also applied to generate a combined dataset of gene dependencies covering a total of 712 unique cancer cell lines.

<b>DepMap source file:</b> D2_combined_gene_dep_scores.csv 

<b>Citation:</b> Jordan G. Bryan, John M. Krill-Burger, Thomas M. Green, Francisca Vazquez, Jesse S. Boehm, Todd R. Golub, William C. Hahn, David E. Root, Aviad Tsherniak. (2018). Improved estimation of cancer dependencies from large-scale RNAi screens using model-based normalization and data integration. Nature Communications 9, 1. https://doi.org/10.1038/s41467-018-06916-5</font>

* Data source uses CCLE names rather than DepMap cell line IDS
* Translate the cell line names to IDS for consistency with other data sources
* Also deal with rows in the table with multiple gene names (eg 'GTF2IP4&GTF2IP1 (100093631&2970)')


## Ingest Achilles Crispr gene dependency data
CERES data with principle components strongly related to known batch effects removed, then shifted and scaled per cell line so the median nonessential KO effect is 0 and the median essential KO effect is -1.

<b>source data:</b> Achilles_gene_effect.csv 

<b>Citation:</b> DepMap, Broad (2019): DepMap 19Q3 Public. figshare. Dataset doi:10.6084/m9.figshare.9201770.v1.
<br>
Robin M. Meyers, Jordan G. Bryan, James M. McFarland, Barbara A. Weir, ... David E. Root, William C. Hahn, Aviad Tsherniak. Computational correction of copy number effect improves specificity of CRISPR-Cas9 essentiality screens in cancer cells. Nature Genetics 2017 October 49:1779–1784. doi:10.1038/ng.3984

* Translate gene names (column labels) to NCBI IDS
* Transpose rows and columns so each cell line is a column label with vertivally stacked gene data

423 cell lines are shared
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
    <tr>
      <td>3248</td>
      <td>HPGD</td>
      <td>15-hydroxyprostaglandin dehydrogenase</td>
      <td>This gene encodes a member of the short-chain nonmetalloenzyme alcohol dehydrogenase protein family. The encoded enzyme is responsible for the metabolism of prostaglandins, which function in a variety of physiologic and cellular processes such as inflammation. Mutations in this gene result in primary autosomal recessive hypertrophic osteoarthropathy and cranioosteoarthropathy. Multiple transcript variants encoding different isoforms have been found for this gene. [provided by RefSeq, Mar 2009]</td>
      <td>E9PBZ2</td>
    </tr>
    <tr>
      <td>3248</td>
      <td>HPGD</td>
      <td>15-hydroxyprostaglandin dehydrogenase</td>
      <td>This gene encodes a member of the short-chain nonmetalloenzyme alcohol dehydrogenase protein family. The encoded enzyme is responsible for the metabolism of prostaglandins, which function in a variety of physiologic and cellular processes such as inflammation. Mutations in this gene result in primary autosomal recessive hypertrophic osteoarthropathy and cranioosteoarthropathy. Multiple transcript variants encoding different isoforms have been found for this gene. [provided by RefSeq, Mar 2009]</td>
      <td>P15428</td>
    </tr>
    <tr>
      <td>3248</td>
      <td>HPGD</td>
      <td>15-hydroxyprostaglandin dehydrogenase</td>
      <td>This gene encodes a member of the short-chain nonmetalloenzyme alcohol dehydrogenase protein family. The encoded enzyme is responsible for the metabolism of prostaglandins, which function in a variety of physiologic and cellular processes such as inflammation. Mutations in this gene result in primary autosomal recessive hypertrophic osteoarthropathy and cranioosteoarthropathy. Multiple transcript variants encoding different isoforms have been found for this gene. [provided by RefSeq, Mar 2009]</td>
      <td>P15428</td>
    </tr>
    <tr>
      <td>3248</td>
      <td>HPGD</td>
      <td>15-hydroxyprostaglandin dehydrogenase</td>
      <td>This gene encodes a member of the short-chain nonmetalloenzyme alcohol dehydrogenase protein family. The encoded enzyme is responsible for the metabolism of prostaglandins, which function in a variety of physiologic and cellular processes such as inflammation. Mutations in this gene result in primary autosomal recessive hypertrophic osteoarthropathy and cranioosteoarthropathy. Multiple transcript variants encoding different isoforms have been found for this gene. [provided by RefSeq, Mar 2009]</td>
      <td>P15428</td>
    </tr>
  </tbody>
</table>
sample:
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
    <tr>
      <td>3248</td>
      <td>HPGD</td>
      <td>15-hydroxyprostaglandin dehydrogenase</td>
      <td>This gene encodes a member of the short-chain nonmetalloenzyme alcohol dehydrogenase protein family. The encoded enzyme is responsible for the metabolism of prostaglandins, which function in a variety of physiologic and cellular processes such as inflammation. Mutations in this gene result in primary autosomal recessive hypertrophic osteoarthropathy and cranioosteoarthropathy. Multiple transcript variants encoding different isoforms have been found for this gene. [provided by RefSeq, Mar 2009]</td>
      <td>E9PBZ2</td>
    </tr>
  </tbody>
</table>

## Aggregate cell lines by lineage
<b>DepMap source file:</b> sample_info.csv
* Group all cell lines by main (parent) lineage
* If a lineage has > 1 defined sublineages, also aggregate cell lines by sublineage (eg: leukemia -> AML)

Number of cell lines: 1429
Number of lineages: 33
NUmber of lineages with sub-lineages: 16
Number of sub-lineages 61
Number of cell lines: 1429
Number of lineages: 33
Number of lineages with sub-lineages: 16
Number of sub-lineages 61
<pre>
Number of cell lines: 1429
Number of lineages: 33
Number of lineages with sub-lineages: 16
Number of sub-lineages 61
</pre>

# Sample analysis of CCLE/DepMap 
## Request
* Identify the most frequent genetic alterations (could be mutations or copy number variations) in the cancer cell lines
* Match them with the best genetic dependencies that could be used for drug development for the cancers that carry those mutations
* Take into account the lineage of cancer cell lines (certain mutations/CNVs may be restricted to a specific lineage)


# Sample analysis of Cancer Dependency Map (DepMap) data 
## Request
* Identify the most frequent genetic alterations (could be mutations or copy number variations) in the cancer cell lines
* Match them with the best genetic dependencies that could be used for drug development for the cancers that carry those mutations
* Take into account the lineage of cancer cell lines (certain mutations/CNVs may be restricted to a specific lineage)


# Sample analysis of Cancer Dependency Map (DepMap) data 
## Request
* Identify the most frequent genetic alterations (could be mutations or copy number variations) in the cancer cell lines
* Match them with the best genetic dependencies that could be used for drug development for the cancers that carry those mutations
* Take into account the lineage of cancer cell lines (certain mutations/CNVs may be restricted to a specific lineage)

## Resources
### DepMap (https://depmap.org/portal) Data 
* Cell line metadata
* Expression
 ** RNAseq
 ** Protein
* Copy number variation
* Mutations
* Genetic dependency
 ** Crispr (Achilles)
 ** RNAi (DEMETER2)


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
 ** Crispr (Achilles)
 ** RNAi (DEMETER2)


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
* Gene-pair data

### Jupyter (https://jupyter.org/)
* Python programming framework for analysis prototyping and reporting

### GitHub (https://github.com/)
* Revision control for Python code
* Reporting mechanism for analysi summary and details



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


