

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
      <td>The protein encoded by this gene is a glycogen branching enzyme that catalyzes the transfer of alpha-1,4-linked glucosyl units from the outer end of a glycogen chain to an alpha-1,6 position on the same or a neighboring glycogen chain. Branching of the chains is essential to increase the solubility of the glycogen molecule and, consequently, in reducing the osmotic pressure within cells. Highest level of this enzyme are found in liver and muscle. Mutations in this gene are associated with glycogen storage disease IV (also known as Andersen's disease). [provided by RefSeq, Jul 2008]</td>
      <td>Q04446</td>
    </tr>
  </tbody>
</table>

## Aggregate cell lines by lineage
<b>DepMap source file:</b> sample_info.csv
* Group all cell lines (CCLE cell line IDs) by main (parent) lineage
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

